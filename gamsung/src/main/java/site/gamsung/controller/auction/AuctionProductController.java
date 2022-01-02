package site.gamsung.controller.auction;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;
import site.gamsung.util.auction.AuctionImgUpload;

@RequestMapping("/auction/*")
@Controller
public class AuctionProductController {
	
	@Value("#{commonProperties['auctionPageSize']}")
	int auctionPageSize;
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	@Autowired
	@Qualifier("auctionInfoService")
	private AuctionInfoService auctionInfoService;
	
	@Autowired
	@Qualifier("auctionReviewService")
	private AuctionReviewService auctionReviewService;

	@Value("#{commonProperties['crawlingURL']}")
	private String crawlingURL;
	
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
		
		//조회수를 1증가 시키며, 상품 번호에 대한 상세정보를 받아온다.
		Map<String, Object> map = auctionProductService.getAuctionProduct(auctionInfo);
			
		//받은 상품정보를 model에 담아 return한다.
		model.addAttribute("auctionProduct",map.get("auctionProduct"));
		model.addAttribute("auctionInfo", map.get("auctionInfo"));
		model.addAttribute("registrantInfo", map.get("registrantInfo"));
			
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
	public String listAucitonProduct(Model model, @ModelAttribute("search") Search search) {
		
		//출력할 개수을 commonProperties로 부터 받아오며, 1페이지가 고정값으로 들어간다.
		search.setPageSize(auctionPageSize);
		search.setCurrentPage(1);
		
		//조건에 맞는 상위 8개의 상품 목록을 리스트로 받는다.
		List<AuctionProduct> list = auctionProductService.listAuctionProduct(search);
		
		//받은 상품 목록을 model에 담아 return한다.
		model.addAttribute("list",list);
	
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
		auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		
		// 임시정보가 있다면 model에 담아 return한다.
		if(auctionProduct != null) {
			model.addAttribute("auctionProduct",auctionProduct);
		}
		
		return "forward:/view/auction/addAuctionProduct.jsp";
	}
	
	//상품 등록 확정 요청시 매핑된다.
	@PostMapping(value = "addAuctionProduct")
	public String addAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct, HttpSession httpSession, MultipartHttpServletRequest mtfRequest) {
		
		//세션으로 부터 요청한 유저의 정보를 가져온다.
		User user = (User)httpSession.getAttribute("user");
				
		//user 정보가 존재하면 Id를 받는다.
		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		auctionProduct.setRegistrantId(user.getId());
		
		if(auctionProduct.getProductImg1() == null) {
			
			List<MultipartFile> fileList = mtfRequest.getFiles("inputImgs");
			
			AuctionImgUpload auctionImgUpload = new AuctionImgUpload();
			List<String> fileName = auctionImgUpload.imgUpload(fileList);
			
			auctionProduct = auctionProductService.auctionProductImgs(auctionProduct, fileName);
			
		}
		
		AuctionProduct tmpAuctionProduct = auctionProductService.getTempSaveAuctionProduct(user.getId());
		
		if(tmpAuctionProduct != null) {
			auctionProduct.setAuctionProductNo(tmpAuctionProduct.getAuctionProductNo());
			auctionProductService.updateAuctionProduct(auctionProduct);
			return "redirect:./listAuctionProduct";
		}
		
		
		//상품정보를 등록한다.
		auctionProductService.addAuctionProduct(auctionProduct);
					
		return "redirect:./listAuctionProduct";
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
		
		if(auctionProduct.getProductImg1() == null) {
			
			List<MultipartFile> fileList = mtfRequest.getFiles("inputImgs");
			
			AuctionImgUpload auctionImgUpload = new AuctionImgUpload();
			List<String> fileName = auctionImgUpload.imgUpload(fileList);
			
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
			
		
		}else if(!user.getId().equals(auctionInfo.getUser().getId())) {
		
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
		
		if(auctionProduct.getProductImg1() == null) {
			
			List<MultipartFile> fileList = mtfRequest.getFiles("inputImgs");
			
			AuctionImgUpload auctionImgUpload = new AuctionImgUpload();
			List<String> fileName = auctionImgUpload.imgUpload(fileList);
			
			auctionProduct = auctionProductService.auctionProductImgs(auctionProduct, fileName);
			
		}
		
		auctionProductService.updateAuctionProduct(auctionProduct);
		
		return "forward:/view/auction/updateAuctionProduct.jsp";
	}
	
	@GetMapping(value = "addReview/{auctionProductNo}")
	public String addReview(@PathVariable("auctionProductNo") String auctionProductNo, Model model) {
		
		model.addAttribute("auctionProductNo",auctionProductNo);
		
		return "forward:/view/auction/reviewModal.jsp";
	}

}
