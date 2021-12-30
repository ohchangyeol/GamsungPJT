package site.gamsung.controller.camp;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public String getCamp(@RequestParam("campNo") int campNo , Model model ) throws Exception{
		System.out.println("/campGeneral/getCamp : GET");
		
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
