package site.gamsung.controller.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	@Autowired
	@Qualifier("campSearchServiceImpl")
	private CampSearchService campSearchService;
	
	//메인페이지 접속시 mapping
	@RequestMapping("/")
	public String mainPage(Model model) {

		List<AuctionProduct> productList = auctionProductService.listMainAuctionProduct();
		
		Map<String, Object> map = campSearchService.getTopCamp();
		
		model.addAttribute("productList",productList);
		model.addAttribute("topRating",map.get("topRating"));
		model.addAttribute("topView",map.get("topView"));
		model.addAttribute("topReservation",map.get("topReservation"));
					
		return "forward:/main.jsp";
	}
	
	//관리자 로그인시 mapping
	@RequestMapping("/admin")
	public String adminMainPage(HttpSession httpSession, Model model) {
		System.out.println("admin");
		User user = (User)httpSession.getAttribute("user");
		
		if(user == null || !user.getRole().equals("ADMIN")) {
			return "redirect:/";
		}
		
		return "forward:/adminMain.jsp";
	}
}
