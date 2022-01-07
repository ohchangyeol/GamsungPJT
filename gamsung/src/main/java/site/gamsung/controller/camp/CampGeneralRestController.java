package site.gamsung.controller.camp;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.User;

@RestController
@RequestMapping("/campGeneral/*")
public class CampGeneralRestController {
	
	
	@Autowired
	@Qualifier("campSearchServiceImpl")
	private CampSearchService campSearchService;
	
	@Autowired
	@Qualifier("campReservationServiceImpl")
	private CampReservationService campReservationService;
	
	@Autowired
	@Qualifier("campRatingReviewServiceImpl")
	private RatingReviewService ratingReviewService;
	
	public CampGeneralRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="json/listReviews/{currentPage}/{campNo}", method=RequestMethod.GET)
	public  String listReviews (@PathVariable int currentPage, @PathVariable int campNo, Model model) throws Exception{
		
		System.out.println("/campGeneral/json/listReviews : GET");
		
		Search search = new Search();
		
			if (currentPage == 0) {
			search.setCurrentPage(1);
		}
		
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		search.setCampNo(campNo);
		
		System.out.println(search);
		System.out.println(campNo);
		
		Map<String, Object> reviewmap = ratingReviewService.listRatingReview(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) reviewmap.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", reviewmap.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
			
		return "/view/camp/listRatingReview.jsp";
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
	
	   @RequestMapping(value = "json/listMyReservationTable", method = RequestMethod.POST)
	   private @ResponseBody String getUserList(@ModelAttribute("search") Search search, HttpSession httpSession) throws Exception {
	      
		   System.out.println("/campGeneral/json/listMyReservationTable : POST");
			
			User user = (User)httpSession.getAttribute("user");
		
			if(user == null) {
				
				return "redirect:/";
				
			} else {
				
				search.setId(user.getId());
				List<CampReservation> list = campReservationService.listMyReservationTable(search);
				
				Gson data = new GsonBuilder().serializeNulls().create();
				
				System.out.println(list);
				
				return data.toJson(list);
			}
	   
	   }
}
