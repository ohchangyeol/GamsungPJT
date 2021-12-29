package site.gamsung.controller.auction;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

@RequestMapping("/auction/*")
@Controller
public class AuctionProductController {
	
	@Value("#{commonProperties['auctionPageSize']}")
	int auctionPageSize;
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;

	@Value("#{commonProperties['crawlingURL']}")
	private String crawlingURL;
	
	private static final String TMP_PATH = "D:\\Main\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\auctionimg\\product";
	
	public AuctionProductController() {
		System.out.println(this.getClass());
	}
	
	//경매 진행 중인 상품 최초 8개 조회
	@RequestMapping(value = "listWaitAuctionProduct")
	public String listCrawlingAuctionProduct(HttpSession httpSession, Model model, @ModelAttribute("search") Search search) {
		
		//출력할 개수을 commonProperties로 부터 받아오며, 1페이지가 고정값으로 들어간다.
		search.setPageSize(auctionPageSize);
		search.setCurrentPage(1);
		
		//조건에 맞는 상위 8개의 상품 목록을 리스트로 받는다.
		List<AuctionProduct> list = auctionProductService.listCrawlingAuctionProduct(search);
		
		//받은 상품 목록을 model에 담아 return한다.
		model.addAttribute("list",list);
	
		return "forward:/view/auction/listWaitAuctionProduct.jsp";
		
	}
	
	//상품 상세 조회 페이지 출력
	@RequestMapping(value = "getAuctionProduct", method = RequestMethod.GET)
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
	@RequestMapping(value = "getAuctionProduct", method = RequestMethod.POST)
	public String getCrawlingAuctionProductNo(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct) {
		
		auctionProduct = auctionProductService.getCrawlingAuctionProductNo(auctionProduct);
		
		return "redirect:./getAuctionProduct?auctionProductNo="+auctionProduct.getAuctionProductNo();
	}
	
	//경매 진행 중인 상품 최초 8개 조회
	@RequestMapping(value = "listAuctionProduct")
	public String listAucitonProduct(HttpSession httpSession, Model model, @ModelAttribute("search") Search search) {
		
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
	@RequestMapping(value = "addAuctionProduct", method = RequestMethod.GET)
	public String addAuctionProduct(HttpSession session, Model model) {
		
		//세션으로 부터 요청한 유저의 정보를 가져온다.
		User user = (User)session.getAttribute("user");

		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		//Id에 해당하는 임시 등록 정보가 있는지 확인한다.
		AuctionProduct auctionProduct = auctionProductService.getTempSaveAuctionProduct(user.getId());
		
		// 임시정보가 있다면 model에 담아 return한다.
		if(auctionProduct != null) {
			model.addAttribute("auctionProduct",auctionProduct);
		}
		
		return "forward:/view/auction/addAuctionProduct.jsp";
	}
	
	//상품 등록 확정 요청시 매핑된다.
	@RequestMapping(value = "addAuctionProduct", method = RequestMethod.POST)
	public String addAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct, HttpSession session) {
				
		//세션으로 부터 요청한 유저의 정보를 가져온다.
		User user = (User)session.getAttribute("user");
		
		//user 정보가 존재하면 Id를 받는다.
		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		auctionProduct.setRegistrantId(user.getId());
		
		//상품정보를 등록한다.
		auctionProductService.addAuctionProduct(auctionProduct);
		
		return "forward:/view/auction/addAuctionProduct.jsp";
	}
	
	//미리보기 페이지를 get방식으로 들어올 경우 목록조회로 redirect 시킨다.
	@RequestMapping(value = "previewAuctionProduct", method = RequestMethod.GET)
	public String previewAuctionProduct() {
		
		return "redirect:./listAuctionProduct";
	}
	
	//미리보기 페이지 요청시 정보를 그대로 담아 페이지 navigation한다.
	@RequestMapping(value = "previewAuctionProduct", method = RequestMethod.POST)
	public String previewAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct,
										MultipartHttpServletRequest mtfRequest, Model model){
		System.out.println(auctionProduct);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("inputImgs");
		List<String> fileName = new ArrayList<String>();
		
		for (MultipartFile multipartFile : fileList) {
            
			// File.seperator 는 OS종속적이다.
	        // Spring에서 제공하는 cleanPath()를 통해서 ../ 내부 점들에 대해서 사용을 억제한다
			Path copyOfLocation = Paths.get(TMP_PATH + File.separator + StringUtils.cleanPath(multipartFile.getOriginalFilename()));
			fileName.add(multipartFile.getOriginalFilename());
			
			try {
				
				// inputStream을 가져와서
	            // copyOfLocation (저장위치)로 파일을 쓴다.
	            // copy의 옵션은 기존에 존재하면 REPLACE(대체한다), 오버라이딩 한다
				Files.copy(multipartFile.getInputStream(), copyOfLocation, StandardCopyOption.REPLACE_EXISTING);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}         

		}
		
		auctionProduct = auctionProductService.previewAuctionProduct(auctionProduct, fileName);
		model.addAttribute("auctionProduct",auctionProduct);
		
		return "forward:/view/auction/previewAuctionProduct.jsp";
	}
	
	//임시저장 요청시 매핑된다.
	@RequestMapping(value = "tempSaveAuctionProduct", method = RequestMethod.POST)
	public String tempSaveAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct, HttpSession session) { 
		
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			return "redirect:./listAuctionProduct";
		}
		
		auctionProduct.setRegistrantId(user.getId());
		auctionProductService.tempSaveAuctionProduct(auctionProduct);
		
		return "redirect:./listAuctionProduct";
	}
	
	
	
	
}
