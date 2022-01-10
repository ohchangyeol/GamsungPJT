package site.gamsung.controller.camp;

import java.io.File;
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
import site.gamsung.service.domain.QnaWrapper;
import site.gamsung.service.domain.RatingReview;
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
														
	private static final String FILE_SERVER_PATH = "C:\\Users\\hulis\\git\\GamsungPJT\\gamsung\\src\\main\\webapp\\";
	
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
	
	@RequestMapping(value = "addPaymentByMyPage", method = RequestMethod.POST)
	public String addPaymentByMyPage(@ModelAttribute("campReservation") CampReservation campReservation,  HttpSession httpSession, Model model){
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
		
		model.addAttribute("campReservation", campReservation);
		model.addAttribute("payment", payment);
		System.out.println(model);
		
		return "forward:/view/payment/readyPayment.jsp";
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
			campReservationService.updateMainSiteTemp(campReservation);
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
		System.out.println(search);
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
//			System.out.println(search);
//			System.out.println(resultPage);
//			System.out.println(model);
					
			return "forward:/view/camp/listMyReservation.jsp";
		}
	}
	
	@RequestMapping(value = "getMyReservation", method = RequestMethod.GET)
	public String getMyReservation(@RequestParam String reservationNo, Model model) throws Exception{
		
		System.out.println("/campGeneral/geteMyReservation : GET");
			
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
		
		System.out.println(campReservation);

		model.addAttribute("campReservation" , campReservation);
		
		return "forward:/view/camp/getMyReservation.jsp";
	}
	
	@RequestMapping(value = "updateMyReservationView", method = RequestMethod.GET)
	public String updateMyReservationView(@RequestParam String reservationNo, Model model) throws Exception{
		System.out.println("/campGeneral/updateMyReservationView : GET");
		
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
		
		System.out.println(campReservation);

		model.addAttribute("campReservation" , campReservation);
		
		return "forward:/view/camp/updateMyReservation.jsp";
	}
	
	@RequestMapping(value = "updateMyReservation", method = RequestMethod.POST)
	public String updateMyReservation(@ModelAttribute CampReservation campReservation,HttpSession httpSession, Model model) throws Exception{
		
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
			
			
			System.out.println("입력된 업데이트 예약정보 :: "+campReservation);
			System.out.println("결제 정보를 위해서 가져온 현재 예약 정보 :: "+campReservationByCurrent);
			
			Camp camp = new Camp();
			camp.setCampImg1(campReservationByCurrent.getCamp().getCampImg1());
			User campUser = new User();
			campUser.setCampName(campReservationByCurrent.getCamp().getUser().getCampName());
			camp.setUser(campUser);
			campReservation.setCamp(camp);
			MainSite mainSite = new MainSite();
			mainSite.setMainSiteType(campReservationByCurrent.getMainSite().getMainSiteType());
			campReservation.setMainSite(mainSite);
			campReservation.setReservationRegDate(campReservationByCurrent.getReservationRegDate());

			Payment payment = new Payment();
			payment.setPaymentSender(campReservation.getUser().getId());
			payment.setPaymentReceiver(campReservationByCurrent.getCamp().getUser().getId());
			payment.setPaymentCode("R2");
			payment.setPaymentPriceTotal(campReservation.getTotalPaymentPrice());
			
			model.addAttribute("campReservation", campReservation);
			model.addAttribute("payment", payment);
			//System.out.println(model);
			
			return "forward:/view/payment/readyPayment.jsp";
		}else {
			//예약 취소
			return null;
		}

	}
	
	@RequestMapping(value = "cancleMyReservation", method = RequestMethod.GET)
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
		model.addAttribute("type", "CAMP");
		
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
	
	@RequestMapping(value = "getcampNotice")
	public String getcampNotice(@RequestParam int noticeNo, Model model) throws Exception{
		System.out.println("/campGeneral/getcampNotice : GET");
		
		noticeService.updateViewCount(noticeNo);
		Notice notice = noticeService.getNotice(noticeNo);
		
		System.out.println(notice);

		model.addAttribute("notice" , notice);
		model.addAttribute("noticeType", "get");
		
		return "forward:/view/camp/getCampNotice.jsp";
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
	
	@RequestMapping(value = "addCampRatingReviewView", method = RequestMethod.GET)
	public String addCampRatingReviewView(@ModelAttribute("reservationNo") String reservationNo, Model model ,HttpSession httpSession) throws Exception{
		System.out.println("/campGeneral/addCampRatingReviewView : GET");
		
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
		Camp camp = campSearchService.getCampByReservation(campReservation.getCamp().getCampNo());
		
		model.addAttribute("campReservation", campReservation);
		model.addAttribute("camp", camp);
		
		System.out.println(model);
		
		return "forward:/view/camp/addCampRatingReview.jsp";
	}
	
	@RequestMapping(value = "addCampRatingReview", method = RequestMethod.POST)
	public String addCampRatingReview(@ModelAttribute("RatingReview") RatingReview ratingReview, @RequestParam("reviewImg") MultipartFile[] reviewImg, @RequestParam("reservationNo") String reservationNo, Model model ,HttpServletRequest request,HttpSession httpSession) throws Exception{
		System.out.println("/campGeneral/addCampRatingReview : POST");
		
		System.out.println(ratingReview);
		System.out.println("리뷰이미지??"+reviewImg);
		
		int	index = 1;
		
		for(MultipartFile multpartfile: reviewImg) {
				System.out.println("포문 돌아???");
		//MultipartFile로 받은 reviewImg에서 file이름을 originalReviewImg 넣는다. 
		String originalReviewImg = multpartfile.getOriginalFilename(); 
		
	    System.out.println("originalPostImg::::"+originalReviewImg+"!");
		
	    if(originalReviewImg != null && originalReviewImg != "") {
	    
				//그 파일명 .의 인덱스 숫자까지 잘라서 확장자만 추출 (ex .jsp)
				String originalFileExtension = originalReviewImg.substring(originalReviewImg.lastIndexOf("."));
				
				// UUID로 랜덤하게 생성한거에 -가 있으면 없애고 확장자를 붙임 (ex 359498a2ff1a40b8a8e16f6c43dd2bf3.jpg)
				String attach_path = "uploadfiles/campimg/review/";
			    String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			    
			    System.out.println(FILE_SERVER_PATH);
			    //File을 생성해서 주소랑 새로 만든 파일이름을 넣는다. 
			    File file = new File(FILE_SERVER_PATH + attach_path + storedFileName);	
			    
			    System.out.println("file::::"+file);
				   
			    //MultipartFile.transferTo(File file) - Byte형태의 데이터를 File객체에 설정한 파일 경로에 전송한다.
			    //file에는 주소랑 새로만든 파일이름이 있음. 그걸 PostImg에 넣는다. 
			    multpartfile.transferTo(file); // postImg를 transferto(보낸다)file로 	
			    
			    System.out.println("file");
			    System.out.println("file.getPath::"+file.getPath());
	   
	
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
		ratingReview.setRatingReviewStatus(1);
		
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
		campReservation.setReservationStatus(8);
				
		ratingReviewService.addRatingReview(ratingReview);
		campReservationService.updateReservationStatus(campReservation);
		
		Search search = new Search();
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);	
		}
		
		search.setPageSize(campPageSize);
		search.setId(ratingReview.getUser().getId());
		
		Map<String, Object> map = ratingReviewService.listRatingReview(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, campPageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("type", "MY");
		
		System.out.println(search);
		System.out.println(map.get("list"));
		
	    ratingReviewService.listRatingReview(search);
		
		return "forward:/view/camp/listRatingReview.jsp";
	}
	
	@RequestMapping(value = "listMyCampRatingReview", method = RequestMethod.GET)
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
	
	public String updateMyCampQna() throws Exception{
		System.out.println("/campGeneral/updateMyCampQna : POST");
		
		return null;
	}
	
	public String deleteMyCampQna() throws Exception{
		System.out.println("/campGeneral/deleteCampQna : GET");
		
		return null;
	}
	
	
}
