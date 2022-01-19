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
import site.gamsung.service.domain.AuctionProduct;
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
	@RequestMapping("admin")
	public String adminMainPage(HttpSession httpSession, Model model) {
		
		User user = (User)httpSession.getAttribute("user");
		
		if(user == null || !user.getRole().equals("ADMIN")) {
			return "redirect:/";
		}
		
		ReservationStatistics reservationStatistics = campReservationService.getReservationStatistics();
		
		HashMap<String, Object> searchParameter = new HashMap<String, Object>();		
		
		Calendar calendar = new GregorianCalendar();
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
		
		calendar.add(Calendar.DATE, 0);		
		String todayDay = SDF.format(calendar.getTime());		
		System.out.println("todayDay : "+todayDay);
	
		
		SiteProfit siteProfit = null;
		try {
			siteProfit = paymentService.listSiteProfit(todayDay);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("siteProfit : "+siteProfit);		
		
		model.addAttribute("siteProfit", siteProfit);
		model.addAttribute("reservationStatistics", reservationStatistics);
	
		return "forward:/adminMain.jsp";
	}
}
