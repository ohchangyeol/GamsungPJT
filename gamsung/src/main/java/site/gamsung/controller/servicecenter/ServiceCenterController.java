package site.gamsung.controller.servicecenter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.NoticeWrapper;
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
	
	// 공지사항
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public void addNotice() {
		
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
		return "forward:/view/servicecenter/noticeLayout.jsp";
	}
	
	@RequestMapping("getNotice")
	public String getNotice(@RequestParam int noticeNo, Model model) throws Exception {
		
		noticeService.updateViewCount(noticeNo);
		Notice notice = noticeService.getNotice(noticeNo);
		
//		NoticeWrapper wrapper = noticeService.listNotice(search);
		System.out.println(notice);
//		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("notice" , notice);
		model.addAttribute("noticeType", "get");
		
		return "forward:/view/servicecenter/noticeLayout.jsp";
	}
	
}
