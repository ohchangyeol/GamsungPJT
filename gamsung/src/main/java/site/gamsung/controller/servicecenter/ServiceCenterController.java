package site.gamsung.controller.servicecenter;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.NoticeWrapper;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.domain.QnaWrapper;
import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.ReportWrapper;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.NoticeService;
import site.gamsung.service.servicecenter.QnaService;
import site.gamsung.service.servicecenter.ReportService;

@Controller
@RequestMapping("/servicecenter/*")
public class ServiceCenterController {

	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService noticeService;
	
	@Autowired
	@Qualifier("qnaServiceImpl")
	private QnaService qnaService;
	
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
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
	public String addNotice(Model model) throws Exception {
		
		model.addAttribute("noticeType","add");
		return "forward:/view/servicecenter/notice/noticeAdminLayout.jsp";
	
	}
	@PostMapping("addNotice")
	public String addNotice(@ModelAttribute Notice notice,@ModelAttribute User user ,@RequestParam("files") MultipartFile[] files,HttpServletRequest req) throws Exception {
		
		System.out.println("add Notice Post!!");
		
		System.out.println("################################# \n Notice ==>"+ notice);
		System.out.println("Files ==>" + files);
		
		notice.setWriter(user);
		
		System.out.println(files.length);
		
		
	
		for (int i = 0; i < files.length-1; i++) {
			MultipartFile file = files[i];
			System.out.println("파일 이름 "+ file.getOriginalFilename());
			
			if(!file.getOriginalFilename().isEmpty()) {
				String root_path = req.getSession().getServletContext().getRealPath("/");  
				String attach_path = "uploadfiles/servicecenter/";
				String filename = file.getOriginalFilename();
				
				//System.out.println("==> root :: "+root_path + attach_path + filename);
				
				System.out.println(filename);
				file.transferTo(new File(root_path + attach_path + filename));
				
				switch (i) {
					case 0:
						notice.setNoticeFile1(filename);
						break;
					case 1:
						notice.setNoticeFile2(filename);
						break;
					case 2:
						notice.setNoticeFile3(filename);
						break;
					case 3:
						notice.setNoticeFile4(filename);
						break;
					case 4:
						notice.setNoticeFile5(filename);
						break;
					default:
						break;
				}
			}
			
		}
		System.out.println(notice);
		noticeService.addNotice(notice);
		
		return "redirect:/servicecenter/listNotice";
	}
	
	@RequestMapping("listNotice")
	public String listNotice(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user"); //Session에서 user받아서 user setting하기. 
		
		if(search.getCurrentPage() == 0 ){ 
			search.setCurrentPage(1); 
		}
		System.out.println(search);
		
		search.setPageSize(pageSize);
		 
		NoticeWrapper wrapper = noticeService.listNotice(search);
		wrapper.setSearch(search);
		
		Page resultPage = new Page( search.getCurrentPage(), wrapper.getTotalCount() , pageUnit, pageSize);
		
		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("noticeType", "list");
		model.addAttribute("resultPage", resultPage);
		
		
		if( user != null && "admin".equalsIgnoreCase(user.getRole()) ) {
			return "forward:/view/servicecenter/notice/noticeAdminLayout.jsp";
		}
		
		return "forward:/view/servicecenter/notice/noticeLayout.jsp";
	}
	
	@GetMapping("getNotice")
	public String getNotice(@RequestParam("noticeNo") int noticeNo,HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		noticeService.updateViewCount(noticeNo);
		Notice notice = noticeService.getNotice(noticeNo);
		
//		NoticeWrapper wrapper = noticeService.listNotice(search);
		System.out.println(notice);
//		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("notice" , notice);
		model.addAttribute("noticeType", "get");
		
		if( user != null && "admin".equalsIgnoreCase(user.getRole()) ) {
			return "forward:/view/servicecenter/notice/noticeAdminLayout.jsp";
		}
		
		return "forward:/view/servicecenter/notice/noticeLayout.jsp";
	}
	
	@GetMapping("deleteNotice")
	public String deleteNotice(@RequestParam int noticeNo) throws Exception {
		
		noticeService.deleteNotice(noticeNo);
		
		return "redirect:/servicecenter/listNotice";
		
	}
	
	
	@GetMapping("fileDownLoad")
	public void deleteNotice(HttpServletRequest request , HttpServletResponse response) throws Exception {
		
		String fileName = new String(request.getParameter("fileName").getBytes("8859_1"),"UTF-8");;
         
        String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "uploadfiles/servicecenter/";
		
		String  realFileName = root_path + attach_path + fileName;
        
        File downFile = new File(realFileName);

        if (!downFile.exists()) {
            return ;
        }
         
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realFileName);
 
            int ncount = 0;
            byte[] bytes = new byte[512];
 
            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (Exception e) {
            System.out.println("FileNotFoundException : " + e);
        }
		
	}
	
	@GetMapping("updateNotice")
	public String updateNotice(@RequestParam("noticeNo") int noticeNo,HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		noticeService.updateViewCount(noticeNo);
		Notice notice = noticeService.getNotice(noticeNo);
		
//		NoticeWrapper wrapper = noticeService.listNotice(search);
		System.out.println(notice);
//		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("notice" , notice);
		model.addAttribute("noticeType", "update");
		
		return "forward:/view/servicecenter/notice/noticeAdminLayout.jsp";
	}
	
	@PostMapping("updateNotice")
	public String updateNotice(@ModelAttribute Notice notice, @ModelAttribute User user , @RequestParam("files") MultipartFile[] files, HttpServletRequest req, Model model) throws Exception {
		
		System.out.println("update Notice Post!!");
		
		System.out.println("################################# \n Notice ==>"+ notice);
		System.out.println("Files ==>" + files);
		
		notice.setWriter(user);
		
		System.out.println(files.length);
		
		
		
		for (int i = 0; i < files.length-1; i++) {
			MultipartFile file = files[i];
			System.out.println("파일 이름 "+ file.getOriginalFilename());
			
			if(!file.getOriginalFilename().isEmpty()) {
				String root_path = req.getSession().getServletContext().getRealPath("/");  
				String attach_path = "uploadfiles/servicecenter/";
				String filename = file.getOriginalFilename();
				
				//System.out.println("==> root :: "+root_path + attach_path + filename);
				
				System.out.println(filename);
				file.transferTo(new File(root_path + attach_path + filename));
				
				switch (i) {
					case 0:
						notice.setNoticeFile1(filename);
						break;
					case 1:
						notice.setNoticeFile2(filename);
						break;
					case 2:
						notice.setNoticeFile3(filename);
						break;
					case 3:
						notice.setNoticeFile4(filename);
						break;
					case 4:
						notice.setNoticeFile5(filename);
						break;
					default:
						break;
				}
			}
			
		}
		System.out.println(notice);
		noticeService.updateNotice(notice);
		notice = noticeService.getNotice(notice.getNoticeNo());
		
//		NoticeWrapper wrapper = noticeService.listNotice(search);
		System.out.println(notice);
//		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("notice" , notice);
		model.addAttribute("noticeType", "get");
		
		return "forward:/view/servicecenter/notice/noticeAdminLayout.jsp";
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
	public String addQna(@ModelAttribute("qna") Qna qna, @ModelAttribute("user") User user) throws Exception {
		System.out.println("QnA ==> "+qna);
		System.out.println("user ==> "+user);
		
		qna.setSender(user);
		
		qnaService.addQuestion(qna);
		return "redirect:/servicecenter/listQna?id="+user.getId();
		
	}
	
	@PostMapping("addQnaAnswer")
	public String addQnaAnswer(@ModelAttribute("qna") Qna qna , HttpSession session,  Model model) throws Exception {
		System.out.println("넌 들어가니??");
		qna.setReceiver((User)session.getAttribute("user"));
		qnaService.addAnswer(qna);
		
		 model.addAttribute("qnaNo" , qna.getQnaNo());
		
		return "redirect:/servicecenter/getQna";
	}
	
	@GetMapping("getQna")
	public String getQna(@RequestParam("qnaNo") int qnaNo ,HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		Qna qna = qnaService.getQna(qnaNo);
		
		model.addAttribute("qnaType", "get");
		model.addAttribute("qna" , qna);
		

		if( user != null && "admin".equalsIgnoreCase(user.getRole()) ) {
			return "forward:/view/servicecenter/qna/qnaAdminLayout.jsp";
		}
		
		System.out.println("qna ==> "+qna);
		return "forward:/view/servicecenter/qna/qnaLayout.jsp";
	}
	
	@GetMapping("deleteQna")
	public String deleteQna( @RequestParam("qnaNo") int qnaNo ) throws Exception {
		
		qnaService.deleteQna(qnaNo);
		return "/servicecenter/listQna";
	}
	
	
	@RequestMapping("listQna")
	public String listQna(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		
		if(search.getCurrentPage() == 0 ){ 
			search.setCurrentPage(1); 
		}
		search.setPageSize(pageSize);
		
		System.out.println("\n == serch ==\n "+search);
		 
		QnaWrapper wrapper = qnaService.listQna(search);
		wrapper.setSearch(search);
		
		Page resultPage = new Page( search.getCurrentPage(), wrapper.getTotalCount() , pageUnit, pageSize);
		
		model.addAttribute("wrapper" , wrapper);
		model.addAttribute("resultPage", resultPage);

		if(search.getId() == null || "".equals(search.getId())) {
			model.addAttribute("qnaType", "list");
		}else {
			model.addAttribute("qnaType", "my");
		}
		
		if( user != null && "admin".equalsIgnoreCase(user.getRole()) ) {
			return "forward:/view/servicecenter/qna/qnaAdminLayout.jsp";
		}
		
		System.out.println(wrapper);
		
		return "forward:/view/servicecenter/qna/qnaLayout.jsp";
	}
	
//	*===================================================================*
//	|							   신고									\
//	*===================================================================*
	@GetMapping("addReport")
	public String addReport(@RequestParam(required = false) String reportType, @RequestParam(required = false) String receiverName, Model model) throws Exception {
		
		System.out.println("reportType => " +reportType + "\n receiverName =>" + receiverName);
		
		
		if(reportType != null) {
			model.addAttribute("reportType",reportType);
		}
		if(receiverName != null) {
			
			receiverName = new String(receiverName.getBytes("8859_1"),"UTF-8");
		}
		
		model.addAttribute("receiverName",receiverName);
		
		System.out.println("change = reportType => " +reportType + "\n receiverName =>" + receiverName);
		
		return "forward:/view/servicecenter/report/addReport.jsp";
	}
	
	@GetMapping("getReport")
	public String getReport(@RequestParam("reportNo") int reportNo , HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		Report report = reportService.getReport(reportNo);
//		System.out.println(report);
		model.addAttribute("report", report);
		
		if( user != null && "admin".equalsIgnoreCase(user.getRole()) ) {
			model.addAttribute("reportType", "get");
			return "forward:/view/servicecenter/report/reportAdminLayout.jsp";
		}
		return "forward:/view/servicecenter/report/getMyReport.jsp";
	}
	
	@RequestMapping("listReport")
	public String listReport(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		if(search.getCurrentPage() == 0 ){ 
			search.setCurrentPage(1); 
		}
		search.setPageSize(pageSize);
		
		ReportWrapper wrapper = reportService.listReport(search);
		wrapper.setSearch(search);
		
		Page resultPage = new Page( search.getCurrentPage(), wrapper.getTotalCount() , pageUnit, pageSize);
		
		
		model.addAttribute("wrapper", wrapper);
		model.addAttribute("resultPage", resultPage);

		System.out.println(wrapper);
		
		
		
		if( search.getId() != null || "".equals(search.getId()) ) {
			return "forward:/view/servicecenter/report/listMyReport.jsp";
		}
		
		if( user != null && "admin".equalsIgnoreCase(user.getRole()) ) {
			model.addAttribute("reportType", "list");
			return "forward:/view/servicecenter/report/reportAdminLayout.jsp";
		}
		
		return null;
	}
	
	
	
	
}
