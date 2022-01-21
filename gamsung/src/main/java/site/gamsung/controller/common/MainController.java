package site.gamsung.controller.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.ReservationStatistics;
import site.gamsung.service.domain.SiteProfit;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	@Autowired
	@Qualifier("campSearchServiceImpl")
	private CampSearchService campSearchService;
	
	@Autowired
	@Qualifier("campReservationServiceImpl")
	private CampReservationService campReservationService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	//메인페이지 접속시 mapping
	@RequestMapping("/")
	public String mainPage(Model model) throws Exception {

		List<AuctionProduct> productList = auctionProductService.listMainAuctionProduct();
		
		Map<String, Object> map = campSearchService.getTopCamp();
		

		HashMap<String, Object> communityMap = new HashMap<String, Object>();
		User user = new User();
		Search search = new Search();
		search.setPageSize(3);
		search.setCurrentPage(1);
		Post post = new Post();
		communityMap.put("userId", user.getId());
		communityMap.put("search", search);
		communityMap.put("post", post);
		List<Post> communityList = communityService.listPost(communityMap);
				
		model.addAttribute("productList",productList);
		model.addAttribute("topRating",map.get("topRating"));
		model.addAttribute("topView",map.get("topView"));
		model.addAttribute("topReservation",map.get("topReservation"));
		model.addAttribute("communityList", communityList);
					
		return "forward:/main.jsp";
	}
	
	//관리자 로그인시 mapping
	@RequestMapping("admin")
	public String adminMainPage(HttpSession httpSession, Model model) {
		
		// reservationStatistics
		User user = (User)httpSession.getAttribute("user");
		
		if(user == null || !user.getRole().equals("ADMIN")) {
			return "redirect:/";
		}
		
		ReservationStatistics reservationStatistics = campReservationService.getReservationStatistics();
		
		// siteProfitStatistics
		HashMap<String, Object> searchParameter = new HashMap<String, Object>();	
		Calendar calendar = new GregorianCalendar();
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
		
		calendar.add(Calendar.DATE, -1);		
		String targetDay = SDF.format(calendar.getTime());		
		System.out.println("targetDay : "+targetDay);
		
		SiteProfit siteProfitStatistics = null;
		try {
			siteProfitStatistics = paymentService.listSiteProfit(targetDay);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("siteProfitStatistics : "+siteProfitStatistics);
		
		model.addAttribute("reservationStatistics", reservationStatistics);
		model.addAttribute("siteProfitStatistics", siteProfitStatistics);
		
		return "forward:/adminMain.jsp";
	}
}
