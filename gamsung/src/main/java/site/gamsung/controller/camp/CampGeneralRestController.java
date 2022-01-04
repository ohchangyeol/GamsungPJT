package site.gamsung.controller.camp;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.RatingReview;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.service.servicecenter.NoticeService;
import site.gamsung.service.servicecenter.QnaService;

@RestController
@RequestMapping("/campGeneral/*")
public class CampGeneralRestController {
	
	
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
	
	public CampGeneralRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="json/listReviews/{currentPage}/{campNo}", method=RequestMethod.GET)
	public  List<RatingReview> listReviews (@PathVariable int currentPage, @PathVariable int campNo) throws Exception{
		
		System.out.println("/campGeneral/json/listReviews : GET");
		
		System.out.println("캠핑장 번호 : "+campNo);
		
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		
		System.out.println(search);
		
		Map<String , Object> map= ratingReviewService.listRatingReview(search, campNo);
	
		List<RatingReview> list = (List<RatingReview>) map.get("list");
		System.out.println(list);
				
		return list;
	}
	
	@RequestMapping( value="json/possibleMainsite/{start}/{end}/{campNo}", method=RequestMethod.GET)
	public  List<MainSite> possibleMainsite (@PathVariable Date start, @PathVariable Date end, @PathVariable int campNo) throws Exception{
		
		System.out.println("/campGeneral/json/possibleMainsite : GET");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("campNo", campNo);
		System.out.println(map);
				
		List<MainSite> list= campReservationService.listPossibleReservation(map);
		
		System.out.println("예약 가능한 주요시설 목록"+list);
				
		return list;
	}
}
