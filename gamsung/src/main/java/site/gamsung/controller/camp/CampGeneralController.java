package site.gamsung.controller.camp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.RatingReviewService;
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
	
	private RatingReviewService ratingReviewService;
	
	private static final String FILE_SERVER_PATH = "";
		
	public CampGeneralController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "campSearch")
	public String campSearch() throws Exception{
		System.out.println("/campGeneral/campSearch : GET");
		
		return "redirect:/view/camp/campSearch.jsp";
	}
	
	@RequestMapping(value = "campDetailSearch")
	public String campDetailSearch() throws Exception{
		System.out.println("/campGeneral/campDetailSearch : GET");
		
		return "redirect:/view/camp/campDetailSearch.jsp";
	}
	
	public String listCamp() throws Exception{
		System.out.println("/campGeneral/listCamp : GET");
		
		return null;
	}
	
	//getcamp, intro, useInfo 한번에.....
	public String getCamp() throws Exception{
		System.out.println("/campGeneral/getCamp : GET");
		
		return null;
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
	
	public String addReservation() throws Exception{
		System.out.println("/campGeneral/addReservation : POST");
		
		return null;
	}
	
	public String addPayment() throws Exception{
		System.out.println("/campGeneral/addPayment : POST");
		
		return null;
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
	
	public String listCampRatingReview() throws Exception{
		System.out.println("/campGeneral/listCampRatingReview : GET");
		
		return null;
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
