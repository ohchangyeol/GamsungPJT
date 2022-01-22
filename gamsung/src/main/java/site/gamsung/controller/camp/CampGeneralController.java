package site.gamsung.controller.camp;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

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
import site.gamsung.service.domain.RatingReview;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.NoticeService;

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
	@Qualifier("campRatingReviewServiceImpl")
	private RatingReviewService ratingReviewService;
	
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
	public String listCamp(@ModelAttribute("search") Search search, Model model){
		System.out.println("/campGeneral/listCamp : POST");
	
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		Map<String, Object> map = campSearchService.listCamp(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/view/camp/listCamp.jsp";
	}
	
	@RequestMapping(value = "getCamp")
	public String getCamp(@RequestParam("campNo") int campNo ,@ModelAttribute("search") Search search,  Model model ){
		System.out.println("/campGeneral/getCamp");
		
		Map<String, Object> map = campSearchService.getCamp(campNo);
		
		model.addAttribute("camp", map.get("camp"));
		model.addAttribute("mainSite", map.get("mainSite"));
		model.addAttribute("subSite", map.get("subSite"));
		model.addAttribute("mainSiteType", map.get("mainSiteType"));
				
		return "forward:/view/camp/getCamp.jsp";
	}
	
	@RequestMapping(value = "addReservation", method = RequestMethod.POST)
	public String addReservation(@RequestParam("mainSiteNo") int mainSiteNo, Model model, 
									@ModelAttribute("campReservation") CampReservation campReservation,  HttpSession httpSession){
		
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
			
			return "forward:/view/camp/addReservationFirst.jsp";

		}else if(campReservation.getUseNum() == 0){
			
			MainSite resultMainSite = campSearchService.getMainSite(campReservation);
			Camp camp = campSearchService.getCampByReservation(campReservation.getCamp().getCampNo());
			model.addAttribute("campReservation",campReservation);
			model.addAttribute("mainSite",resultMainSite);
			model.addAttribute("camp",camp);
			
			return "forward:/view/camp/addReservationSecond.jsp";
		
		}else{
			
			MainSite resultMainSite = campSearchService.getMainSite(campReservation);
			model.addAttribute("campReservation",campReservation);
			model.addAttribute("mainSite",resultMainSite);
						
			return "forward:/view/camp/addReservationThird.jsp";
		}
	}
	
	@RequestMapping(value = "addPaymentByMyPage", method = RequestMethod.POST)
	public String addPaymentByMyPage(@ModelAttribute("campReservation") CampReservation campReservation,  
										HttpServletRequest request, HttpSession httpSession, Model model){
		System.out.println("/campGeneral/addPaymentByMyPage : POST");
		
		User user = (User)httpSession.getAttribute("user");
		
		campReservation.setUser(user);
		campReservation = campReservationService.getReservationByPayment(campReservation);
		campReservation.setUser(user);
		
		Payment payment = new Payment();
		payment.setPaymentSender(campReservation.getUser().getId());
		payment.setPaymentReceiver(campReservation.getCamp().getUser().getId());
		payment.setPaymentCode("R1");
		payment.setPaymentPriceTotal(campReservation.getTotalPaymentPrice());
		
		Map<String, Object> payCampMap = new HashMap<String, Object>();
		payCampMap.put("payment", payment);
		payCampMap.put("campReservation", campReservation);
		
		request.setAttribute("payCampMap", payCampMap);
					
		return "forward:/payment/readyPayment";
	}
	
	@RequestMapping(value = "addPayment", method = RequestMethod.POST)
	public String addPayment(@RequestParam("mainSiteNo") int mainSiteNo,
								@ModelAttribute("campReservation") CampReservation campReservation,
										HttpSession httpSession, HttpServletRequest request, Model model){
		
		User user = (User)httpSession.getAttribute("user");
		
		MainSite mainSite = new MainSite();
		mainSite.setMainSiteNo(mainSiteNo);
		campReservation.setMainSite(mainSite);
		
		if(user == null) {
			
			return "redirect:/main.jsp";
			
		} else {
			
			campReservation.setUser(user);
			campReservationService.updateMainSiteTemp(campReservation);
			campReservation = campReservationService.addTempReservation(campReservation);
			campReservation.setUser(user);

			Payment payment = new Payment();
			payment.setPaymentSender(campReservation.getUser().getId());
			payment.setPaymentReceiver(campReservation.getCamp().getUser().getId());
			payment.setPaymentCode("R1");
			payment.setPaymentPriceTotal(campReservation.getTotalPaymentPrice());
						
			Map<String, Object> payCampMap = new HashMap<String, Object>();
			payCampMap.put("payment", payment);
			payCampMap.put("campReservation", campReservation);
			
			request.setAttribute("payCampMap", payCampMap);
			
			return "forward:/payment/readyPayment";
		
		}
		
	}
	
	@RequestMapping(value = "listMyReservation" )
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

			return "forward:/view/camp/listMyReservation.jsp";
		}
	}
	
	@RequestMapping(value = "getMyReservation", method = RequestMethod.GET)
	public String getMyReservation(@RequestParam String reservationNo, Model model){
		
		System.out.println("/campGeneral/geteMyReservation : GET");
			
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
	
		model.addAttribute("campReservation" , campReservation);
		
		return "forward:/view/camp/getMyReservation.jsp";
	}
	
	@RequestMapping(value = "updateMyReservationView", method = RequestMethod.GET)
	public String updateMyReservationView(@RequestParam String reservationNo, Model model){
		System.out.println("/campGeneral/updateMyReservationView : GET");
		
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
		
		model.addAttribute("campReservation" , campReservation);
		
		return "forward:/view/camp/updateMyReservation.jsp";
	}
	
	@RequestMapping(value = "updateMyReservation", method = RequestMethod.POST)
	public String updateMyReservation(@ModelAttribute CampReservation campReservation,
									HttpServletRequest request, HttpSession httpSession, Model model){
		
		System.out.println("/campGeneral/updateMyReservation : POST");
		
		if(campReservation.getTotalPaymentPrice() == 0) {
			//예약 테이블 정보 변경
			campReservation.setReservationStatus(2);
			campReservationService.updateReservation(campReservation);
			campReservation = campReservationService.getReservation(campReservation.getReservationNo());
			
			model.addAttribute("campReservation" , campReservation);
			
			return "forward:/view/camp/getMyReservation.jsp";
			
		}else if(campReservation.getTotalPaymentPrice() > 0) {
			//예약 결제 후 예약 테이블 정보 변경
			User user = (User)httpSession.getAttribute("user");
			campReservation.setUser(user);
			campReservation.setReservationStatus(2);
			
			CampReservation campReservationByCurrent = campReservationService.getCampIdByAppendPayment(campReservation);
			
			Camp camp = new Camp();
			camp.setCampImg1(campReservationByCurrent.getCamp().getCampImg1());
	
			User campUser = new User();
			campUser.setCampName(campReservationByCurrent.getCamp().getUser().getCampName());
			camp.setUser(campUser);
			
			campReservation.setCamp(camp);
			
			MainSite mainSite = new MainSite();
			mainSite.setMainSiteType(campReservationByCurrent.getMainSite().getMainSiteType());
			mainSite.setMainSiteNo(campReservationByCurrent.getMainSite().getMainSiteNo());
			
			System.out.println(mainSite);
			
			campReservation.setMainSite(mainSite);
			campReservation.setReservationRegDate(campReservationByCurrent.getReservationRegDate());

			Payment payment = new Payment();
			payment.setPaymentSender(campReservation.getUser().getId());
			payment.setPaymentReceiver(campReservationByCurrent.getCamp().getUser().getId());
			payment.setPaymentCode("R2");
			payment.setPaymentPriceTotal(campReservation.getTotalPaymentPrice());
			
			Map<String, Object> payCampMap = new HashMap<String, Object>();
			payCampMap.put("payment", payment);
			payCampMap.put("campReservation", campReservation);
			
			request.setAttribute("payCampMap", payCampMap);
			
			return "forward:/payment/readyPayment";
			
		}else {
			return null;
		}

	}
		
	@RequestMapping(value = "listCampRatingReview")
	public String listCampRatingReview(@RequestParam("campNo") int campNo , @ModelAttribute("search") Search search , Model model){
	
		System.out.println("/campGeneral/listCampRatingReview : GET / POST");	
			
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);	
		}
		
		search.setPageSize(campPageSize);
		search.setCampNo(campNo);
		
		Map<String, Object> map = ratingReviewService.listRatingReview(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, campPageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("campRating", map.get("campRating"));
		model.addAttribute("campNo", campNo);
		model.addAttribute("type", "CAMP");
		
		return "forward:/view/camp/listRatingReview.jsp";
	}
	
	@RequestMapping(value = "listBusinessCampRatingReview")
	public String listBusinessCampRatingReview(@RequestParam("campNo") int campNo , @ModelAttribute("search") Search search , Model model){
	
		System.out.println("/campGeneral/listBusinessCampRatingReview : GET / POST");	

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);	
		}
		
		search.setPageSize(campPageSize);
		search.setCampNo(campNo);
		
		Map<String, Object> map = ratingReviewService.listRatingReview(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, campPageSize);
				
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("campRating", map.get("campRating"));
		model.addAttribute("campNo", campNo);
		model.addAttribute("type", "CAMP");
		
		return "forward:/view/camp/listCampRatingReview.jsp";
	}
	
	@RequestMapping(value = "listCampNotice")
	public String listCampNotice(@ModelAttribute("search") Search search , Model model ){

		System.out.println("/campGeneral/listCampNotice : GET / POST");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		try {
			NoticeWrapper noticeWrapper = noticeService.listNotice(search);
			Page resultPage = new Page(search.getCurrentPage(), noticeWrapper.getTotalCount(), pageUnit, pageSize);
			
			model.addAttribute("wrapper", noticeWrapper);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			model.addAttribute("campNo", search.getCampNo());
	
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "forward:/view/camp/listCampNotice.jsp";
	
	}
	
	@RequestMapping(value = "getCampNotice")
	public String getcampNotice(@RequestParam int noticeNo, Model model){
		System.out.println("/campGeneral/getCampNotice : GET");
		
		try {
			noticeService.updateViewCount(noticeNo);
			Notice notice = noticeService.getNotice(noticeNo);

			model.addAttribute("notice" , notice);
			model.addAttribute("noticeType", "get");
		}catch (Exception e) {
			e.printStackTrace();
		}
				
		return "forward:/view/camp/getCampNotice.jsp";
	}
	
	@RequestMapping(value = "addCampRatingReviewView", method = RequestMethod.GET)
	public String addCampRatingReviewView(@ModelAttribute("reservationNo") String reservationNo, Model model ,HttpSession httpSession){
		System.out.println("/campGeneral/addCampRatingReviewView : GET");
		
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
		Camp camp = campSearchService.getCampByReservation(campReservation.getCamp().getCampNo());
		
		model.addAttribute("campReservation", campReservation);
		model.addAttribute("camp", camp);
		
		return "forward:/view/camp/addCampRatingReview.jsp";
	}
	
	@RequestMapping(value = "addCampRatingReview", method = RequestMethod.POST)
	public String addCampRatingReview(@ModelAttribute("RatingReview") RatingReview ratingReview, @RequestParam("article_file") MultipartFile[] reviewImg, 
											@RequestParam("reservationNo") String reservationNo, Model model ,HttpSession httpSession){
		
		System.out.println("/campGeneral/addCampRatingReview : POST");
		
		int	index = 1;
		
		for(MultipartFile multpartfile: reviewImg) {
				
		//MultipartFile로 받은 reviewImg에서 file이름을 originalReviewImg 넣는다. 
		String originalReviewImg = multpartfile.getOriginalFilename(); 
		
	    if(originalReviewImg != null && originalReviewImg != "") {
	    
				//그 파일명 .의 인덱스 숫자까지 잘라서 확장자만 추출 (ex .jsp)
				String originalFileExtension = originalReviewImg.substring(originalReviewImg.lastIndexOf("."));
				
				// UUID로 랜덤하게 생성한거에 -가 있으면 없애고 확장자를 붙임 (ex 359498a2ff1a40b8a8e16f6c43dd2bf3.jpg)
				String path = httpSession.getServletContext().getRealPath("/");
				String attach_path = "uploadfiles/campimg/review/";
			    String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			    
			    //File을 생성해서 주소랑 새로 만든 파일이름을 넣는다. 
			    File file = new File(path + attach_path + storedFileName);	
			    
			    System.out.println("file::::"+file);
			    
				try {
					multpartfile.transferTo(file); // postImg를 transferto(보낸다)file로
				} catch (Exception e) {
					
					e.printStackTrace();
				}
			    
				if (index == 1) {
					ratingReview.setImg1(storedFileName);
				} else if (index == 2 ) {
					ratingReview.setImg2(storedFileName);
				} else {
					ratingReview.setImg3(storedFileName);        
				}
			
				index ++;
			}
		}
		
		User user = (User)httpSession.getAttribute("user");
		ratingReview.setUser(user);
		
		if(ratingReview.getRatingReviewStatus() == 2) {
			ratingReview.setRatingReviewStatus(2);	
		}else {
		ratingReview.setRatingReviewStatus(1);
		}
		
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
		campReservation.setReservationStatus(7);
		campReservation.setTotalPaymentPrice(0);
				
		ratingReviewService.addRatingReview(ratingReview);
		campReservationService.updateReservationStatus(campReservation);
		
		return "forward:/view/camp/listMyRatingReview.jsp";
	}
	
	@RequestMapping(value = "listMyCampRatingReview")
	public String listMyCampRatingReview(@ModelAttribute("search") Search search, Model model ,HttpSession httpSession){
		System.out.println("/campGeneral/listMyCampRatingReview : GET / POST");
		
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
		
			return "forward:/view/camp/listMyRatingReview.jsp";
		}
		
	}
	
	@RequestMapping(value = "deleteMyCampRatingReview", method = RequestMethod.GET)
	public String deleteMyCampRatingReview(@RequestParam int ratingReviewNo, Model model, HttpSession httpSession){
		System.out.println("/campGeneral/deleteMyCampRatingReview : GET");
		
		RatingReview ratingReview = new RatingReview();
		
		ratingReview.setRatingReviewNo(ratingReviewNo);
		ratingReview.setReviewDeleteFlag("Y");
		
		ratingReviewService.updateRatingReview(ratingReview);
		
		User user = (User)httpSession.getAttribute("user");
		Search search = new Search();
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(campPageSize);
		search.setId(user.getId());
		Map<String, Object> map = ratingReviewService.listRatingReview(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, campPageSize);
			
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("user", user);
	
		return "forward:/view/camp/listMyRatingReview.jsp";
		
	}

}
