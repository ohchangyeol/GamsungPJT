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
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.NoticeWrapper;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.QnaWrapper;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.service.servicecenter.NoticeService;
import site.gamsung.service.servicecenter.QnaService;
import site.gamsung.service.user.UserService;

@Controller
@RequestMapping("/campGeneral/*")
public class CampGeneralController {

	@Autowired
	@Qualifier("campSearchServiceImpl")
	private CampSearchService campSearchService;
	
	@Autowired
	@Qualifier("campReservationServiceImpl")
	private CampReservationService campReservationService;
	
	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService noticeService;
	
	@Autowired
	@Qualifier("qnaServiceImpl")
	private QnaService qnaService;
		
	@Autowired
	@Qualifier("campRatingReviewServiceImpl")
	private RatingReviewService ratingReviewService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	public CampGeneralController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['campPageSize']}")
	int campPageSize;
	
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
	
	@RequestMapping(value = "getCamp")
	public String getCamp(@RequestParam("campNo") int campNo ,@ModelAttribute("search") Search search,  Model model ) throws Exception{
		System.out.println("/campGeneral/getCamp");
		
		Map<String, Object> map = campSearchService.getCamp(campNo);
		
		model.addAttribute("camp", map.get("camp"));
		model.addAttribute("mainSite", map.get("mainSite"));
		model.addAttribute("subSite", map.get("subSite"));
		model.addAttribute("mainSiteType", map.get("mainSiteType"));
		
		System.out.println(map.get("camp"));
		System.out.println(map.get("mainSite"));
		System.out.println(map.get("subSite"));
		System.out.println(map.get("mainSiteType"));
				
		return "forward:/view/camp/getCamp.jsp";
	}
	
	@RequestMapping(value = "addReservation", method = RequestMethod.POST)
	public String addReservation(@RequestParam("mainSiteNo") int mainSiteNo, Model model, @ModelAttribute("campReservation") CampReservation campReservation,  HttpSession httpSession) throws Exception{
		System.out.println("/campGeneral/addReservation : POST");
		
		User user = (User)httpSession.getAttribute("user");
		MainSite mainSite = new MainSite();
		mainSite.setMainSiteNo(mainSiteNo);
		campReservation.setMainSite(mainSite);
		
		if(user == null) {
			
			return "redirect:/";
			
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
			
		} else {
			
			campReservation.setUser(user);
			campReservation = campReservationService.addTempReservation(campReservation);
			campReservation.setUser(user);

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
	
	@RequestMapping(value = "listMyReservation")
	public String listMyReservation(@ModelAttribute("search") Search search, Model model ,HttpSession httpSession) throws Exception{
		System.out.println("/campGeneral/listMyReservation : GET / POST");
		
		User user = (User)httpSession.getAttribute("user");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		if(user == null) {
			
			return "redirect:/";
			
		} else {
			
			Map<String, Object> map = campReservationService.listMyReservation(search, user.getId());
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
						
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			model.addAttribute("user", user);
			System.out.println(search);
			System.out.println(resultPage);
//			System.out.println(model);
					
			return "forward:/view/camp/listMyReservation.jsp";
		}
	}
	
	public String updateMyReservation() throws Exception{
		System.out.println("/campGeneral/updateMyReservation : GET");
		
		return null;
	}
	
	public String cancleMyReservation() throws Exception{
		System.out.println("/campGeneral/cancleMyReservation : GET");
		
		return null;
	}
		
	@RequestMapping(value = "listCampRatingReview")
	public String listCampRatingReview(@RequestParam("campNo") int campNo , @ModelAttribute("search") Search search , Model model ) throws Exception{
	
		System.out.println("/campGeneral/listCampRatingReview : GET / POST");	
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);	
		}
		
		search.setPageSize(campPageSize);
		search.setCampNo(campNo);
		
		Map<String, Object> map = ratingReviewService.listRatingReview(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, campPageSize);
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
	
	@RequestMapping(value = "listCampNotice")
	public String listCampNotice(@ModelAttribute("search") Search search , Model model ) throws Exception{

		System.out.println("/campGeneral/listCampNotice : GET / POST");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
				
		NoticeWrapper noticeWrapper = noticeService.listNotice(search);
		
		Page resultPage = new Page(search.getCurrentPage(), noticeWrapper.getTotalCount(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("wrapper", noticeWrapper);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("campNo", search.getCampNo());
		
				
		System.out.println(search);
		System.out.println(noticeWrapper.getNotices());
		
		return "forward:/view/camp/listCampNotice.jsp";
	}
	
	@RequestMapping("getcampNotice")
	public String getcampNotice(@RequestParam int noticeNo, Model model) throws Exception{
		System.out.println("/campGeneral/getcampNotice : GET");
		
		noticeService.updateViewCount(noticeNo);
		Notice notice = noticeService.getNotice(noticeNo);
		
		System.out.println(notice);

		model.addAttribute("notice" , notice);
		model.addAttribute("noticeType", "get");
		
		return "forward:/view/camp/getCampNotice.jsp";
	}
	
//	@RequestMapping(value = "listCampQna", method = RequestMethod.GET)
//	public String listCampQna(@RequestParam("campNo") int campNo , @ModelAttribute("search") Search search , Model model ) throws Exception{
//		System.out.println("/campGeneral/listCampQna : GET");
//		
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		
//		search.setPageSize(pageSize);
//		search.setCampNo(campNo);
//		
//		QnaWrapper qnaWrapper = qnaService.listQna(search);
//		
//		Page resultPage = new Page(search.getCurrentPage(), qnaWrapper.getTotalCount(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		model.addAttribute("wrapper", qnaWrapper);
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//		model.addAttribute("campNo", campNo);
//		
//				
//		System.out.println(search);
//				
//		return "forward:/view/camp/listCampqna.jsp";
//		
//	}
	
	public String getCampQna() throws Exception{
		System.out.println("/campGeneral/getCampQna : GET");
		
		return null;
	}
	
	public String addCampQna() throws Exception{
		System.out.println("/campGeneral/addCampQna : POST");
		
		return null;
	}
	
	@RequestMapping(value = "listMyQna", method = RequestMethod.GET)
	public String listMyCampQna(@ModelAttribute("search") Search search, Model model ,HttpSession httpSession) throws Exception{
		System.out.println("/campGeneral/listMyCampQna : GET");

		User user = (User)httpSession.getAttribute("user");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		if(user == null) {
			
			return "redirect:/";
			
		} else {
			
			search.setId(user.getId());
			
			QnaWrapper qnaWrapper = qnaService.listQna(search);
			
			Page resultPage = new Page(search.getCurrentPage(), qnaWrapper.getTotalCount(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			model.addAttribute("wrapper", qnaWrapper);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			model.addAttribute("user", user);
			
			System.out.println(search);
			System.out.println(qnaWrapper);
			
			return "forward:/view/camp/listMyQna.jsp";
		}
	
	}
	
	public String updateMyCampQna() throws Exception{
		System.out.println("/campGeneral/updateMyCampQna : POST");
		
		return null;
	}
	
	public String deleteMyCampQna() throws Exception{
		System.out.println("/campGeneral/deleteCampQna : GET");
		
		return null;
	}
	
	public String addCampRatingReview() throws Exception{
		System.out.println("/campGeneral/addCampRatingReview : GET");
		
		return null;
	}
	
	@RequestMapping(value = "listMyReview", method = RequestMethod.GET)
	public String listMyCampRatingReview(@ModelAttribute("search") Search search, Model model ,HttpSession httpSession) throws Exception{
		System.out.println("/campGeneral/listMyCampRatingReview : GET");
		
		User user = (User)httpSession.getAttribute("user");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(campPageSize);
		
		if(user == null) {
			
			return "redirect:/";
			
		} else {
			
			search.setId(user.getId());
			Map<String, Object> map = ratingReviewService.listRatingReview(search);
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, campPageSize);
			System.out.println(resultPage);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			model.addAttribute("user", user);
			
			System.out.println(search);
			System.out.println(map.get("list"));

			return "forward:/view/camp/listMyRatingReview.jsp";
		}
		
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
