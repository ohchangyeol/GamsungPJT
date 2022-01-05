package site.gamsung.controller.camp;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.service.servicecenter.NoticeService;
import site.gamsung.service.servicecenter.QnaService;

@Controller
@RequestMapping("/campGeneral/*")
public class CampGeneralController {

	@Autowired
	@Qualifier("campSearchServiceImpl")
	private CampSearchService campSearchService;
	
	@Autowired
	@Qualifier("campReservationServiceImpl")
	private CampReservationService campReservationService;
	
	private NoticeService noticeService;
	
	private QnaService qnaService;
	
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("campRatingReviewServiceImpl")
	private RatingReviewService ratingReviewService;
	
	private static final String FILE_SERVER_PATH = "";
		
	public CampGeneralController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "listCamp", method = RequestMethod.POST)
	public String listCamp(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("/campGeneral/listCamp : POST");
	
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		Map<String, Object> map = campSearchService.listCamp(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println(search);
		System.out.println(map.get("list"));
		
		return "forward:/view/camp/listCamp.jsp";
	}
	
	@RequestMapping(value = "getCamp", method = RequestMethod.POST)
	public String getCamp(@RequestParam("campNo") int campNo ,@ModelAttribute("search") Search search,  Model model ) throws Exception{
		System.out.println("/campGeneral/getCamp : POST");
		
		Map<String, Object> map = campSearchService.getCamp(campNo);
		
		model.addAttribute("camp", map.get("camp"));
		model.addAttribute("mainSite", map.get("mainSite"));
		model.addAttribute("subSite", map.get("subSite"));
		model.addAttribute("mainSiteType", map.get("mainSiteType"));
		
		System.out.println(map.get("camp"));
		System.out.println(map.get("mainSite"));
		System.out.println(map.get("subSite"));
		System.out.println(map.get("mainSiteType"));
		
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		Map<String, Object> reviewmap = ratingReviewService.listRatingReview(search, campNo);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) reviewmap.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", reviewmap.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println(search);
		System.out.println(reviewmap.get("list"));
		
		return "forward:/view/camp/getCamp.jsp";
	}
	
	public String getCampMap() throws Exception{
		System.out.println("/campGeneral/getCampMap : GET");
		
		return null;
	}
	
	public String listCampNotice() throws Exception{
		System.out.println("/campGeneral/listCampNotice : GET");
		
		return null;
	}
	
	public String getcampNotice() throws Exception{
		System.out.println("/campGeneral/getcampNotice : GET");
		
		return null;
	}
	
	public String listCampQna() throws Exception{
		System.out.println("/campGeneral/listCampQna : GET");
		
		return null;
	}
	
	public String getCampQna() throws Exception{
		System.out.println("/campGeneral/getCampQna : GET");
		
		return null;
	}
	
	public String addCampQna() throws Exception{
		System.out.println("/campGeneral/addCampQna : POST");
		
		return null;
	}
	
	public String listMyCampQna() throws Exception{
		System.out.println("/campGeneral/listMyCampQna : GET");
		
		return null;
	}
	
	public String updateMyCampQna() throws Exception{
		System.out.println("/campGeneral/updateMyCampQna : POST");
		
		return null;
	}
	
	public String deleteMyCampQna() throws Exception{
		System.out.println("/campGeneral/deleteCampQna : GET");
		
		return null;
	}
	
	@RequestMapping(value = "addReservation", method = RequestMethod.POST)
	public String addReservation(@RequestParam("mainSiteNo") int mainSiteNo, Model model, @ModelAttribute("campReservation") CampReservation campReservation,  HttpSession httpSession) throws Exception{
		System.out.println("/campGeneral/addReservation : POST");
		
		User user = (User)httpSession.getAttribute("user");
		MainSite mainSite = new MainSite();
		mainSite.setMainSiteNo(mainSiteNo);
		campReservation.setMainSite(mainSite);
		
		if(user == null) {
			
			return "redirect:/main.jsp";
			
		}else if(mainSiteNo == 0) {
			
			Map<String, Object> map = campSearchService.getCamp(campReservation.getCamp().getCampNo());
			model.addAttribute("campReservation",campReservation);
			model.addAttribute("mainSite", map.get("mainSite"));
			model.addAttribute("camp", map.get("camp"));
			System.out.println("1단계"+model);
			
			return "forward:/view/camp/addReservationFirst.jsp";

		}else if(campReservation.getUseNum() == 0){
			
			MainSite resultMainSite = campSearchService.getMainSite(campReservation);
			Camp camp = campSearchService.getCampByReservation(campReservation.getCamp().getCampNo());
			model.addAttribute("campReservation",campReservation);
			model.addAttribute("mainSite",resultMainSite);
			model.addAttribute("camp",camp);
			System.out.println("주요시설"+resultMainSite);
			System.out.println("2단계"+model);
			
			return "forward:/view/camp/addReservationSecond.jsp";
		
		}else{
			
			MainSite resultMainSite = campSearchService.getMainSite(campReservation);
			model.addAttribute("campReservation",campReservation);
			model.addAttribute("mainSite",resultMainSite);
			System.out.println("3단계"+model);
			
			return "forward:/view/camp/addReservationThird.jsp";
		}
	}
	
	@RequestMapping(value = "addPayment", method = RequestMethod.POST)
	public String addPayment(@RequestParam("mainSiteNo") int mainSiteNo, Model model, @ModelAttribute("campReservation") CampReservation campReservation,  HttpSession httpSession) throws Exception{
		System.out.println("/campGeneral/addPayment : POST");
		
		User user = (User)httpSession.getAttribute("user");
		MainSite mainSite = new MainSite();
		mainSite.setMainSiteNo(mainSiteNo);
		campReservation.setMainSite(mainSite);
		
		if(user == null) {
			
			return "redirect:/main.jsp";
			
		}else {
			
			campReservation.setUser(user);
			campReservation = campReservationService.addTempReservation(campReservation);
			
			Payment payment = new Payment();
			payment.setPaymentSender(campReservation.getUser().getId());
			payment.setPaymentReceiver(campReservation.getCamp().getUser().getId());
			payment.setPaymentCode("R1");
			payment.setPaymentPriceTotal(campReservation.getTotalPaymentPrice());
			
			model.addAttribute("campReservation", campReservation);
			model.addAttribute("payment", payment);
			System.out.println(model);
			
			return "forward:/view/payment/readyPayment.jsp";
		}
		
	}
	
	public String listMyReservation() throws Exception{
		System.out.println("/campGeneral/listMyReservation : GET");
		
		return null;
	}
	
	public String updateMyReservation() throws Exception{
		System.out.println("/campGeneral/updateMyReservation : GET");
		
		return null;
	}
	
	public String cancleMyReservation() throws Exception{
		System.out.println("/campGeneral/cancleMyReservation : GET");
		
		return null;
	}
	
	@RequestMapping(value = "listCampRatingReview", method = RequestMethod.GET)
	public String listCampRatingReview(@RequestParam("campNo") int campNo , @ModelAttribute("search") Search search , Model model ) throws Exception{
		System.out.println("/campGeneral/listCampRatingReview : GET");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		Map<String, Object> map = ratingReviewService.listRatingReview(search, campNo);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("campRating", map.get("campRating"));
		model.addAttribute("campNo", campNo);
		
		System.out.println(search);
		System.out.println(map.get("list"));
			
		return "forward:/view/camp/listRatingReview.jsp";
	}
	
	public String addCampRatingReview() throws Exception{
		System.out.println("/campGeneral/addCampRatingReview : GET");
		
		return null;
	}
	
	public String listMyCampRatingReview() throws Exception{
		System.out.println("/campGeneral/listMyCampRatingReview : GET");
		
		return null;
	}
	
	public String updateMyCampRatingReview() throws Exception{
		System.out.println("/campGeneral/updateMyCampRatingReview : GET");
		
		return null;
	}
	
	public String deleteMyCampRatingReview() throws Exception{
		System.out.println("/campGeneral/deleteMyCampRatingReview : GET");
		
		return null;
	}
	
}
