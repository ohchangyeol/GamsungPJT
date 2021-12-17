package site.gamsung.controller.camp;

import service.camp.CampSearchService;
import service.camp.CampReservationService;
import service.servicecenter.NoticeService;
import service.servicecenter.QnaService;
import service.payment.*;
import service.common.RatingReviewService;

public class CampGeneralController {

	private CampSearchService campSearchService;
	private CampReservationService campReservationService;
	private NoticeService noticeService;
	private QnaService qnaService;
	private PaymentService paymentService;
	private RatingReviewService ratingReviewService;
	
	private static final String FILE_SERVER_PATH = "";
		
	public CampGeneralController() {
		System.out.println(this.getClass());
	}
	
	public String campSearch() throws Exception{
		System.out.println("/campGeneral/campSearch : GET");
		
		return "redirect:/view/camp/campSearch.jsp";
	}
	
	public String campDetailSearch() throws Exception{
		System.out.println("/campGeneral/campDetailSearch : GET");
		
		return "redirect:/view/camp/campDetailSearch.jsp";
	}
	
	public String listCamp() throws Exception{
		System.out.println("/campGeneral/listCamp : GET");
	}
	
	//getcamp, intro, useInfo 한번에.....
	public String getCamp() throws Exception{
		System.out.println("/campGeneral/getCamp : GET");
	}
	
	public String getCampMap() throws Exception{
		System.out.println("/campGeneral/getCampMap : GET");
	}
	
	public String listCampNotice() throws Exception{
		System.out.println("/campGeneral/listCampNotice : GET");
	}
	
	public String getcampNotice() throws Exception{
		System.out.println("/campGeneral/getcampNotice : GET");
	}
	
	public String listCampQna() throws Exception{
		System.out.println("/campGeneral/listCampQna : GET");
	}
	
	public String getCampQna() throws Exception{
		System.out.println("/campGeneral/getCampQna : GET");
	}
	
	public String addCampQna() throws Exception{
		System.out.println("/campGeneral/addCampQna : POST");
	}
	
	public String listMyCampQna() throws Exception{
		System.out.println("/campGeneral/listMyCampQna : GET");
	}
	
	public String updateMyCampQna() throws Exception{
		System.out.println("/campGeneral/updateMyCampQna : POST");
	}
	
	public String deleteMyCampQna() throws Exception{
		System.out.println("/campGeneral/deleteCampQna : GET");
	}
	
	public String addReservation() throws Exception{
		System.out.println("/campGeneral/addReservation : POST");
	}
	
	public String addPayment() throws Exception{
		System.out.println("/campGeneral/addPayment : POST");
	}
	
	public String listMyReservation() throws Exception{
		System.out.println("/campGeneral/listMyReservation : GET");
	}
	
	public String updateMyReservation() throws Exception{
		System.out.println("/campGeneral/updateMyReservation : GET");
	}
	
	public String cancleMyReservation() throws Exception{
		System.out.println("/campGeneral/cancleMyReservation : GET");
	}
	
	public String listCampRatingReview() throws Exception{
		System.out.println("/campGeneral/listCampRatingReview : GET");
	}
	
	public String addCampRatingReview() throws Exception{
		System.out.println("/campGeneral/addCampRatingReview : GET");
	}
	
	public String listMyCampRatingReview() throws Exception{
		System.out.println("/campGeneral/listMyCampRatingReview : GET");
	}
	
	public String updateMyCampRatingReview() throws Exception{
		System.out.println("/campGeneral/updateMyCampRatingReview : GET");
	}
	
	public String deleteMyCampRatingReview() throws Exception{
		System.out.println("/campGeneral/deleteMyCampRatingReview : GET");
	}
	
}
