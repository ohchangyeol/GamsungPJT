package site.gamsung.controller.servicecenter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.NoticeWrapper;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.domain.Report;
import site.gamsung.service.servicecenter.NoticeService;

@Controller
@RequestMapping("/servicecenter/*")
public class ServiceCenterController {

	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService noticeService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	// Constructor
	public ServiceCenterController() {
		System.out.println("@Controller :: " + this.getClass());
	}
	
	@RequestMapping("home")
	public String serviceCenterHome() {
		return "redirect:/view/servicecenter/serviceCeneterHome.jsp";
	}
	
	
//	*===================================================================*
//	|							   공지사항								\
//	*===================================================================*
	
	@GetMapping("addNotice")
	public String addNotice() throws Exception {
		
		return "forward:/view/servicecenter/notice/addNotice.jsp";
	}
	@PostMapping("addNotice")
	public String addNotice(@ModelAttribute Notice notice) throws Exception {
//		아직...
		return null;
	}
	
	@RequestMapping("listNotice")
	public String listNotice(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		if(search.getCurrentPage() == 0 ){ 
			search.setCurrentPage(1); 
		}
		search.setPageSize(pageSize);
		 
		NoticeWrapper wrapper = noticeService.listNotice(search);
		
		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("noticeType", "list");
		return "forward:/view/servicecenter/notice/noticeLayout.jsp";
	}
	
	@GetMapping("getNotice")
	public String getNotice(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
		
		noticeService.updateViewCount(noticeNo);
		Notice notice = noticeService.getNotice(noticeNo);
		
//		NoticeWrapper wrapper = noticeService.listNotice(search);
		System.out.println(notice);
//		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("notice" , notice);
		model.addAttribute("noticeType", "get");
		
		return "forward:/view/servicecenter/notice/noticeLayout.jsp";
	}
	
//	*===================================================================*
//	|							   Q&A									\
//	*===================================================================*
	@GetMapping("addQna")
	public String addQna(Model model) throws Exception {
		
		model.addAttribute("qnaType", "add"); 
		return "forward:/view/servicecenter/qna/qnaLayout.jsp";
	}
	
	@PostMapping("addQna")
	public String addQna(@ModelAttribute("qna") Qna qna) throws Exception {
//		아직
		return null;
	}
	
	@PostMapping("addQnaAnswer")
	public String addQnaAnswer(@ModelAttribute("qna") Qna qna ) throws Exception {
//		아직
		return null ;
	}
	
	@GetMapping("getQna")
	public String getQna(@RequestParam("qnaNo") int QnaNo , Model model) throws Exception {
		
		model.addAttribute("qnaType", "get");
		return "forward:/view/servicecenter/qna/qnaLayout.jsp";
	}
	
	@RequestMapping("listQna")
	public String listQna(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		if(search.getCurrentPage() == 0 ){ 
			search.setCurrentPage(1); 
		}
		search.setPageSize(pageSize);
		 
//		NoticeWrapper wrapper = noticeService.listNotice(search);
		
//		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("qnaType", "list");
		return "forward:/view/servicecenter/qna/qnaLayout.jsp";
	}
	
//	*===================================================================*
//	|							   신고									\
//	*===================================================================*
	@GetMapping("addReport")
	public String addReport() throws Exception {
		
		return "forward:/view/servicecenter/report/addReport.jsp";
	}
	
	@PostMapping("addReport")
	public String addNotice(@ModelAttribute("report") Report report) throws Exception {
//		아직...
		return null;
	}
	
	@GetMapping("getReport")
	public String getReport(@RequestParam("rerpot") int ReportNo , Model model) throws Exception {
		
		return "forward:/view/servicecenter/report/getReport.jsp";
	}
	
	@RequestMapping("listReport")
	public String listReport(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		if(search.getCurrentPage() == 0 ){ 
			search.setCurrentPage(1); 
		}
		search.setPageSize(pageSize);
		 
//		NoticeWrapper wrapper = noticeService.listNotice(search);
		
//		model.addAttribute("wrapper" , wrapper);
//		model.addAttribute("noticeType", "list");
		return "forward:/view/servicecenter/report/listReport.jsp";
	}
	
	
}
