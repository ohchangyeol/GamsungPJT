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
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
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
	
	@Value("#{commonProperties['crawlingURL']}")
	private String crawlingURL;
	
	@Value("#{commonProperties['auctionPageSize']}")
	int auctionPageSize;
	
	@Value("#{commonProperties['auctionMypageSize']}")
	int auctionMypageSize;
	
	public AuctionProductController() {
		System.out.println(this.getClass());
	}
	
	//경매 진행 중인 상품 최초 8개 조회
	@RequestMapping(value = "listWaitAuctionProduct")
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
	@GetMapping(value = "getAuctionProduct")
	public String getAuctionProduct(AuctionInfo auctionInfo, HttpSession httpSession, Model model) {
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = req.getRemoteAddr();			
		}
		auctionInfo.setInfo(ip);
		
		//조회수를 1증가 시키며, 상품 번호에 대한 상세정보를 받아온다.
		Map<String, Object> map = auctionProductService.getAuctionProduct(auctionInfo);
		
		//받은 상품정보를 model에 담아 return한다.
		model.addAttribute("auctionProduct",map.get("auctionProduct"));
		model.addAttribute("auctionInfo", map.get("auctionInfo"));
		model.addAttribute("registrantInfo", map.get("registrantInfo"));
		model.addAttribute("ratingReview",map.get("ratingReview"));
		model.addAttribute("auctionGrade", map.get("auctionGrade"));
		
		return "forward:/view/auction/getAuctionProduct.jsp";
	}
	
	//상품 상세 조회 페이지 출력
	@PostMapping(value = "getAuctionProduct")
	public String getCrawlingAuctionProductNo(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct) {
		
		auctionProduct = auctionProductService.getCrawlingAuctionProductNo(auctionProduct);
		
		return "redirect:./getAuctionProduct?auctionProductNo="+auctionProduct.getAuctionProductNo();
	}
	
	//경매 진행 중인 상품 최초 8개 조회
	@RequestMapping(value = "listAuctionProduct")
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
	@GetMapping(value = "addAuctionProduct")
	public String addAuctionProduct(HttpSession httpSession, Model model) {
		
		//세션으로 부터 요청한 유저의 정보를 가져온다.
		User user = (User)httpSession.getAttribute("user");

		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		//Id에 해당하는 임시 등록 정보가 있는지 확인한다.
		AuctionProduct auctionProduct = auctionProductService.getTempSaveAuctionProduct(user.getId());
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		//user 정보를 새로 세팅한다.
		httpSession.setAttribute("user", user);
		
		// 임시정보가 있다면 model에 담아 return한다.
		if(auctionProduct != null) {
			model.addAttribute("auctionProduct",auctionProduct);
		}
		
		return "forward:/view/auction/addAuctionProduct.jsp";
	}
	
	//상품 등록 확정 요청시 매핑된다.
	@PostMapping(value = "addAuctionProduct")
	public String addAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct, HttpSession httpSession, MultipartHttpServletRequest mtfRequest, Model model) {
		
		//세션으로 부터 요청한 유저의 정보를 가져온다.
		User user = (User)httpSession.getAttribute("user");
		
		//user 정보가 존재하면 Id를 받는다.
		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		//희망 낙찰가*등급별 수수료 보다 보유 포인트가 적을 경우 충전페이지로 redirect 시킨다. 
		PaymentCode paymentCode = auctionInfoService.getPaymentInfo(user.getAuctionGrade());

		int deductionPoint = auctionProduct.getHopefulBidPrice()*paymentCode.getPaymentCodeFee()/100;

		if(user.getHavingPoint() < deductionPoint) {
			return "redirect:/payment/managePoint";
		}
		
		
		auctionProduct.setRegistrantId(user.getId());
		
		String path = httpSession.getServletContext().getRealPath("/");

		if(auctionProduct.getProductImg1() == null) {
			
			List<MultipartFile> fileList = mtfRequest.getFiles("inputImgs");
			
			AuctionImgUpload auctionImgUpload = new AuctionImgUpload();
			List<String> fileName = auctionImgUpload.imgUpload(fileList, path);
			
			auctionProduct = auctionProductService.auctionProductImgs(auctionProduct, fileName);
			
		}
		
		AuctionProduct tmpAuctionProduct = auctionProductService.getTempSaveAuctionProduct(user.getId());
		String navigation = "";
		if(tmpAuctionProduct != null) {
			auctionProduct.setAuctionProductNo(tmpAuctionProduct.getAuctionProductNo());
			auctionProductService.updateAuctionProduct(auctionProduct);
			
			//사용자 경매 등급 재설정한다.
			user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
			navigation = "redirect:./listAuctionProduct";
		}else {
			//상품정보를 등록한다.
			auctionProductService.addAuctionProduct(auctionProduct);
			//사용자 경매 등급 재설정한다.
			user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
			navigation =  "redirect:./listAuctionProduct";
		}
		
		//user 정보를 새로 세팅한다.
		httpSession.setAttribute("user", user);
		
		//결제 담당자가 서비스를 통해 처리하여 payment domain을 생성하여 인자로 준다.
		AuctionProduct tmpInfo = auctionProductService.paymentSubInfo(user.getId());
		System.out.println(tmpInfo);
		Payment payment = new Payment();
		payment.setPaymentProduct(tmpInfo.getAuctionProductName());
		payment.setPaymentSender(user.getId());
		payment.setPaymentReceiver("admin");
		payment.setPaymentReferenceNum(tmpInfo.getAuctionProductNo());
		payment.setPaymentCode(paymentCode.getPaymentCode());
		payment.setPaymentPriceTotalSecond(deductionPoint);
		try {
			paymentService.internalPointPayment(payment);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return navigation;
	}
	
	//임시저장 요청시 매핑된다.
	@PostMapping(value = "tempSaveAuctionProduct")
	public String tempSaveAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct, HttpSession httpSession, MultipartHttpServletRequest mtfRequest) { 
		
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
			
			AuctionImgUpload auctionImgUpload = new AuctionImgUpload();
			List<String> fileName = auctionImgUpload.imgUpload(fileList,path);
			
			auctionProduct = auctionProductService.auctionProductImgs(auctionProduct, fileName);
			
		}
		
		auctionProductService.tempSaveAuctionProduct(auctionProduct);
		
		return "redirect:./listAuctionProduct";
	}
	
	@GetMapping(value = "updateAuctionProduct")
	public String updateAuctionProduct(@ModelAttribute("auctionInfo") AuctionInfo auctionInfo, HttpSession httpSession, Model model) { 
		
		User user = (User)httpSession.getAttribute("user");
		
		if(user == null) {
			
			return "redirect:./listAuctionProduct";
		}
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		model.addAttribute("auctionProduct",auctionProduct);
		
		return "forward:/view/auction/updateAuctionProduct.jsp";
	}
	
	@PostMapping(value = "updateAuctionProduct")
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
			
			AuctionImgUpload auctionImgUpload = new AuctionImgUpload();
			List<String> fileName = auctionImgUpload.imgUpload(fileList,path);
			
			auctionProduct = auctionProductService.auctionProductImgs(auctionProduct, fileName);
			
		}

		System.out.println("after:"+auctionProduct);
		auctionProductService.updateAuctionProduct(auctionProduct);
		
		return "forward:./listAuctionProduct";
	}
	
	@GetMapping(value = "addReview/{auctionProductNo}")
	public String addReview(@PathVariable("auctionProductNo") String auctionProductNo, Model model) {
		
		model.addAttribute("auctionProductNo",auctionProductNo);
		
		return "forward:/view/auction/reviewModal.jsp";
	}
	
	@RequestMapping(value = "listMyAuctionProduct/{option}")
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
			map = auctionReviewService.listMyRatingReview(map);
			break;
		}
		
		if(map != null) {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));			
		}
		model.addAttribute("auctionInfo", auctionInfo);
		model.addAttribute("search",search);
		
		return "forward:/view/auction/listMyAuctionProduct.jsp";
	}

}
