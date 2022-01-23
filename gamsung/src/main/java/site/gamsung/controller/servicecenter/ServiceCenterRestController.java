package site.gamsung.controller.servicecenter;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.QnaWrapper;
import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.QnaService;
import site.gamsung.service.servicecenter.ReportService;
import site.gamsung.service.user.UserService;

@RestController
@RequestMapping("servicecenter/rest/*")
public class ServiceCenterRestController {

	// field
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	@Autowired
	@Qualifier("qnaServiceImpl")
	private QnaService qnaService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize; 
	
	
	// Constructor
	public ServiceCenterRestController() {
		System.out.println("@Controller :: " + this.getClass());
	}

	
	@PostMapping("addReport")
	public int addReport(@ModelAttribute("report") Report report, @ModelAttribute("user") User user ,@RequestParam("files") MultipartFile[] files, HttpServletRequest req ) throws Exception {
		User receiver = reportService.findReceiverId(report);
		
		if(receiver == null) {
			return 0 ;
		}
		report.setSender(user);
		report.setReceiver(receiver);
		
		for (int i = 0; i < files.length; i++) {
			MultipartFile file = files[i];
			
			if(!file.getOriginalFilename().isEmpty()) {
				String root_path = req.getSession().getServletContext().getRealPath("/");  
				String attach_path = "uploadfiles/servicecenter/";
				String filename = file.getOriginalFilename();
				//System.out.println("==> root :: "+root_path + attach_path + filename);

				file.transferTo(new File(root_path + attach_path + filename));
				
				switch (i) {
					case 0:
						report.setReportImgFile1(filename);
						break;
					case 1:
						report.setReportImgFile2(filename);
						break;
					case 2:
						report.setReportImgFile3(filename);
						break;
					default:
						break;
				}
			}
		}
		reportService.addReport(report);
		return 1;
	}
	
	@GetMapping("deleteReport/{reportNo}")
	public int deleteReport (@PathVariable("reportNo") int reportNo ) throws Exception {
		if(reportNo == 0) {
			System.out.println("??");
			return 0;
		}else {
			reportService.deleteReport(reportNo);			
			return 1;
		}
	}
	
	@PostMapping("updateCode")
	public int updateReportCode(@RequestBody Report report ) throws Exception {
		
		return reportService.updateCodeReport(report);
	}
	
	
	@GetMapping("listQna")
	public QnaWrapper listQna(@ModelAttribute("search") Search search) throws Exception {
		
		search.setSearchKeyword(new String(search.getSearchKeyword().getBytes("8859_1"),"UTF-8")); 
		System.out.println(search);
		
		
		if(search.getCurrentPage() == 0 ){ 
			search.setCurrentPage(1); 
		}
		search.setPageSize(pageSize);
		
		QnaWrapper wrapper = qnaService.listQna(search);
		wrapper.setSearch(search);
		
		System.out.println(wrapper);

		return wrapper;
	}
	
	@GetMapping("adminMain")
	public Map<String, Object> adminMain() throws Exception {
		
		int qnaCount = qnaService.notTotalCountQna();
		int reportCount = reportService.notTotalCountReport();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("qnaCount", qnaCount);
		map.put("reportCount", reportCount );
		
		return map;
	}
	
}
