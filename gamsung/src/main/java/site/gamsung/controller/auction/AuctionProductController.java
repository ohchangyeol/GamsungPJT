package site.gamsung.controller.auction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionReviewService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.NaverProduct;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.util.auction.AuctionImgUpload;

@RequestMapping("/auction/*")
@Controller
public class AuctionProductController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	@Autowired
	@Qualifier("auctionInfoService")
	private AuctionInfoService auctionInfoService;
	
	@Autowired
	@Qualifier("auctionReviewService")
	private RatingReviewService ratingReviewService;
	
	@Autowired
	@Qualifier("auctionReviewService")
	private AuctionReviewService auctionReviewService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;

	@Autowired
	@Qualifier("auctionImgUpload")
	private AuctionImgUpload auctionImgUpload;
	
	@Value("#{auctionProperties['auctionPageSize']}")
	int auctionPageSize;
	
	@Value("#{auctionProperties['auctionMypageSize']}")
	int auctionMypageSize;
	
	public AuctionProductController() {
		System.out.println(this.getClass());
	}
	
	//네이버 상품을 통해 가져온다. 
	@RequestMapping( "listAdminAuctionProduct")
	public String listNaverAuctionProduct(HttpSession httpSession, Model model, @ModelAttribute("search") Search search) {
		
		//네이버 API를 통해 상품 목록을 가져온다.
		List<NaverProduct> list = auctionProductService.listNaverAuctionProduct(search);
		//받은 상품 목록을 model에 담아 return한다.
		model.addAttribute("list",list);
	
		return "forward:/view/auction/listAdminAuctionProduct.jsp";
		
	}
	
	//상품 상세 조회 페이지 출력
	@GetMapping("getAuctionProduct")
	public String getAuctionProduct(AuctionInfo auctionInfo, HttpSession httpSession, Model model) {
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		//로그인 유저의 IP를 헤더를 통해 획득한다.
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = req.getRemoteAddr();			
		}
		auctionInfo.setInfo(ip);
		
		//조회수를 1증가 시키며, 상품 번호에 대한 상세정보를 받아온다.
		Map<String, Object> map = auctionProductService.getAuctionProduct(auctionInfo);
		
		AuctionProduct auctionProduct = (AuctionProduct)map.get("auctionProduct");
		//경매 추천 상품 목록을 가져온다.
		List<AuctionProduct> productList = auctionProductService.listMainAuctionProduct();
		
		//조건에 따른 수수료 들을 requestScope에 담아 return한다.
		PaymentCode paymentCode = null;
		if(user != null) {

			paymentCode = (PaymentCode)auctionInfoService.makePaymentInfo(user, "중도철회 수수료",auctionProduct);
			int withdrawalFee = paymentCode.getPaymentCodeFee();
			
			paymentCode = (PaymentCode)auctionInfoService.makePaymentInfo(user, "경매확정 수수료",auctionProduct);
			int confirmFee = paymentCode.getPaymentCodeFee();
			
			paymentCode = (PaymentCode)auctionInfoService.makePaymentInfo(user, "낙찰취소 수수료",auctionProduct);
			int cancelFee = paymentCode.getPaymentCodeFee();
			
			model.addAttribute("withdrawalFee",withdrawalFee);
			model.addAttribute("confirmFee",confirmFee);
			model.addAttribute("cancelFee",cancelFee);
			
		}
		//받은 상품정보를 model에 담아 return한다.
		model.addAttribute("auctionProduct",auctionProduct);
		model.addAttribute("auctionInfo", map.get("auctionInfo"));
		model.addAttribute("registrantInfo", map.get("registrantInfo"));
		model.addAttribute("ratingReview",map.get("ratingReview"));
		model.addAttribute("auctionGrade", map.get("auctionGrade"));
		model.addAttribute("productList",productList);
		
		return "forward:/view/auction/getAuctionProduct.jsp";
	}
	
	// 상품 상세 조회 페이지 출력
	@PostMapping("getAuctionProductA")
	public String getNaverAuctionProductNo(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct) {

		auctionProduct = auctionProductService.convertNaverToAuctionProduct(auctionProduct);

		return "redirect:./getAuctionProduct?auctionProductNo=" + auctionProduct.getAuctionProductNo();
	}
	
	//경매 진행 중인 상품 최초 8개 조회
	@RequestMapping( "listAuctionProduct")
	public String listAucitonProduct(@ModelAttribute("search") Search search, Model model, HttpSession httpSession) {
		
		//세션에서 로그인 유저 정보를 가져온다.
		User user = (User)httpSession.getAttribute("user");
		
		//출력할 개수을 commonProperties로 부터 받아오며, 1페이지가 고정값으로 들어간다.
		search.setPageSize(auctionPageSize);
		search.setCurrentPage(1);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("search", search);
		System.out.println(search);
		//조건에 맞는 상위 8개의 상품 목록을 리스트로 받는다.
		map = auctionProductService.listAuctionProduct(map);
		
		//받은 상품 목록과 응찰 관심 목록을 model에 담아 return한다.
		model.addAttribute("productList",map.get("productList"));
		model.addAttribute("concernList",map.get("concernList"));
		model.addAttribute("search", search);
		return "forward:/view/auction/listAuctionProduct.jsp";
		
	}
	
	//상품 등록 페이지 navigation
	@GetMapping( "addAuctionProduct")
	public String addAuctionProduct(HttpSession httpSession, Model model) {
		
		//세션으로 부터 요청한 유저의 정보를 가져온다.
		User user = (User)httpSession.getAttribute("user");

		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		//Id에 해당하는 임시 등록 정보가 있는지 확인한다.
		AuctionProduct auctionProduct = auctionProductService.getTempSaveAuctionProduct(user.getId());
		
		// 임시정보가 있다면 model에 담아 return한다.
		if(auctionProduct != null) {
			model.addAttribute("auctionProduct",auctionProduct);
		}
		
		//등급에 따른 수수료를 반환하여 requestScope에 담아준다.
		PaymentCode paymentCode = (PaymentCode)auctionInfoService.makePaymentInfo(user, "상품등록 수수료", null); 
		model.addAttribute("fee",paymentCode.getPaymentCodeFee());
		
		//user 정보를 새로 세팅한다.
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		httpSession.setAttribute("user", user);
		
		return "forward:/view/auction/addAuctionProduct.jsp";
	}
	
	//상품 등록 확정 요청시 매핑된다.
	@PostMapping( "addAuctionProduct")
	public String addAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct, HttpSession httpSession, MultipartHttpServletRequest mtfRequest, Model model) {
		
		//세션으로 부터 요청한 유저의 정보를 가져온다.
		User user = (User)httpSession.getAttribute("user");
		
		//user 정보가 존재하면 Id를 받는다.
		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		auctionProduct.setRegistrantId(user.getId());
		
		String path = httpSession.getServletContext().getRealPath("/");

		if(auctionProduct.getProductImg1() == null) {
			
			List<MultipartFile> fileList = mtfRequest.getFiles("inputImgs");
			
			List<String> fileName = auctionImgUpload.imgUpload(fileList, path);
			
			auctionProduct = auctionProductService.auctionProductImgs(auctionProduct, fileName);
		}
		
		AuctionProduct tmpAuctionProduct = auctionProductService.getTempSaveAuctionProduct(user.getId());
		
		if(tmpAuctionProduct != null) {
			auctionProduct.setAuctionProductNo(tmpAuctionProduct.getAuctionProductNo());
			auctionProductService.updateAuctionProduct(auctionProduct);
		}else {
			//상품정보를 등록한다.
			auctionProductService.addAuctionProduct(auctionProduct);
		}
		
		//결제 담당자가 서비스를 통해 처리하여 payment domain을 생성하여 인자로 준다.
		Payment payment = (Payment) auctionInfoService.makePaymentInfo(user, "상품등록", null);
		try {
			paymentService.makePayment(payment);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		//사용자 경매 등급 재설정한다.
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		//user 정보를 새로 세팅한다.
		httpSession.setAttribute("user", user);
		
		return  "redirect:./listAuctionProduct";
	}
	
	//임시저장 요청시 매핑된다.
	@PostMapping("tempSaveAuctionProduct")
	public String tempSaveAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct, HttpSession httpSession, MultipartHttpServletRequest mtfRequest) { 
		
		//세션으로 부터 요청한 유저의 정보를 가져온다.
		User user = (User)httpSession.getAttribute("user");
						
		//user 정보가 존재하면 Id를 받는다.
		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
			
		auctionProduct.setRegistrantId(user.getId());
		
		//context root를 가져온다.
		String path = httpSession.getServletContext().getRealPath("/");
		
		if(auctionProduct.getProductImg1() == null) {
			
			List<MultipartFile> fileList = mtfRequest.getFiles("inputImgs");
			
			List<String> fileName = auctionImgUpload.imgUpload(fileList,path);
			
			auctionProduct = auctionProductService.auctionProductImgs(auctionProduct, fileName);
			
		}
		
		auctionProductService.tempSaveAuctionProduct(auctionProduct);
		
		return "redirect:./listAuctionProduct";
	}
	
	@GetMapping("updateAuctionProduct")
	public String updateAuctionProduct(@ModelAttribute("auctionInfo") AuctionInfo auctionInfo, HttpSession httpSession, Model model) { 
		
		User user = (User)httpSession.getAttribute("user");
		
		if(user == null) {
			
			return "redirect:./listAuctionProduct";
		}
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		model.addAttribute("auctionProduct",auctionProduct);
		
		return "forward:/view/auction/updateAuctionProduct.jsp";
	}
	
	@PostMapping("updateAuctionProduct")
	public String updateAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct, HttpSession httpSession, MultipartHttpServletRequest mtfRequest) { 
		
		User user = (User)httpSession.getAttribute("user");
		
		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		auctionProduct.setRegistrantId(user.getId());
		
		String path = httpSession.getServletContext().getRealPath("/");
		System.out.println("before:"+auctionProduct);
		if(auctionProduct.getProductImg1() == null) {
			
			List<MultipartFile> fileList = mtfRequest.getFiles("inputImgs");

			List<String> fileName = auctionImgUpload.imgUpload(fileList,path);
			
			auctionProduct = auctionProductService.auctionProductImgs(auctionProduct, fileName);
			
		}

		System.out.println("after:"+auctionProduct);
		auctionProductService.updateAuctionProduct(auctionProduct);
		
		return "forward:./listAuctionProduct";
	}
	
	@GetMapping("addReview/{auctionProductNo}")
	public String addReview(@PathVariable("auctionProductNo") String auctionProductNo, Model model) {
		
		model.addAttribute("auctionProductNo",auctionProductNo);
		
		return "forward:/view/auction/reviewModal.jsp";
	}
	
	@RequestMapping("listMyAuctionProduct/{option}")
	public String listMyPage(	@ModelAttribute("search") Search search, @PathVariable("option") String option,
								Model model ,HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		
		if(user == null) {
			return "redirect:/";
		}
		
		search.setPageSize(auctionMypageSize);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("user", user);
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setUser(user);
		auctionInfo.setInfo(option);
		
		switch(option) {
		case "add":
			map = auctionInfoService.listAuctionProductByRole(map);
			break;
		case "history":
			map = auctionInfoService.auctionHistory(map);
			break;
		case "bid":
			map = auctionInfoService.listBidConcern(map);
			break;
		case "review":
			System.out.println(search);
			map = auctionReviewService.listMyRatingReview(map);
			break;
		}
		
		if(map != null) {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));			
		}
		model.addAttribute("auctionInfo", auctionInfo);
		model.addAttribute("search",search);
		
		model.addAttribute("resultPage",new Page(search.getCurrentPage(), (int)map.get("totalCount"),10,5));		
		return "forward:/view/auction/listMyAuctionProduct.jsp";
	}
	
	@RequestMapping("auctionStatistics")
	public String auctionStatistics(HttpSession httpSession, Model model) {
		
		User user = (User)httpSession.getAttribute("user");
		if(user == null || !user.getRole().equals("ADMIN")) {
			return "redirect:/";
		}
		
		Map<String, Object> map = auctionInfoService.getAuctionStatistics();
		
		model.addAttribute("yearList",map.get("yearList"));
		model.addAttribute("lastYearList",map.get("lastYearList"));
		model.addAttribute("currentYearList",map.get("currentYearList"));
		model.addAttribute("todayAuction",map.get("todayAuction"));
		
		return "forward:/view/auction/auctionStatistics.jsp";
	}
	
	@RequestMapping("auctionSuspension")
	public String auctionSuspensionUserList(@ModelAttribute("search")Search search, HttpSession httpSession, Model model) {
		
		User user = (User)httpSession.getAttribute("user");
		if(user == null || !user.getRole().equals("ADMIN")) {
			return "redirect:/";
		}
		
		search.setPageSize(auctionMypageSize);
		
		Map<String, Object> map = auctionInfoService.listAuctionSuspensionUser(user, search);
		int count = (int)map.get("count") / auctionMypageSize;
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("count",count);
		
		return "forward:/view/auction/auctionSuspensionManage.jsp";
	}
	
	
	//허용되지 않은 매핑 방식 일 경우 mainPage로 redirect 시킨다.
	@GetMapping("tempSaveAuctionProduct")
	public String tempSaveAuctionProduct() {
		return "redirect:/";
	}
	
	@GetMapping("infiniteScroll")
	public String InfiniteScroll() {
		return "redirect:/";
	}
	
	@GetMapping("getBidderRanking")
	public String getBidderRanking() {
		return "redirect:/";
	}
	
	@GetMapping("listAuctionRatingReview/{currentPage}")
	public String listAuctionRatingReview(){
		return "redirect:/";
	}
	
	@GetMapping("addReviewComment/{auctionProductNo}")
	public String addReviewComment(){
		return "redirect:/";
	}
	
	@GetMapping( "deleteAuctionRatingReview")
	public String deleteAuctionRatingReview(){
		return "redirect:/";
	}
	
	@GetMapping("deleteSuspension")
	public String deleteAuctionSuspensionUser() {
		return "redirect:/";
	}
	
	//EC2에서 쿠팡 상품 크롤링 중 문제가 발생하여 네이버 검색 API로 전환한다.
	
	//경매 진행 중인 상품 최초 8개 조회
	@RequestMapping( "listWaitAuctionProduct")
	public String listCrawlingAuctionProduct(HttpSession httpSession, Model model, @ModelAttribute("search") Search search) {
		
		//출력할 개수을 commonProperties로 부터 받아오며, 1페이지가 고정값으로 들어간다.
		search.setSortCondition("latestAsc");
		search.setPageSize(auctionPageSize);
		search.setCurrentPage(1);
		
		//조건에 맞는 상위 8개의 상품 목록을 리스트로 받는다.
		List<AuctionProduct> list = auctionProductService.listCrawlingAuctionProduct(search);
		
		//받은 상품 목록을 model에 담아 return한다.
		model.addAttribute("list",list);
	
		return "forward:/view/auction/listWaitAuctionProduct.jsp";
		
	}
	
	//상품 상세 조회 페이지 출력
	@PostMapping( "getAuctionProductB")
	public String getCrawlingAuctionProductNo(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct) {
		
		auctionProduct = auctionProductService.getCrawlingAuctionProductNo(auctionProduct);
		
		return "redirect:./getAuctionProduct?auctionProductNo="+auctionProduct.getAuctionProductNo();
	}
	
}
