package site.gamsung.controller.campbusiness;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.io.File;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.NoticeWrapper;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.domain.QnaWrapper;
import site.gamsung.service.domain.SubSite;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.NoticeService;
import site.gamsung.service.servicecenter.QnaService;
import site.gamsung.service.campbusiness.CampBusinessService;
import site.gamsung.service.user.UserService;

//String methodName = new Object() { }.getClass().getEnclosingMethod().getName();
//System.out.println(" >> " + this.getClass().getName() + " : " + methodName);

@Controller
@RequestMapping("/campBusiness/*")
public class CampBusinessController {

	/// Field
	@Autowired
	@Qualifier("campBusinessServiceImpl")
	private CampBusinessService campBusinessService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("qnaServiceImpl")
	private QnaService qnaService;
	
	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService noticeService;

	// @Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 5}")
	int pageUnit;

	// @Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 10}")
	int pageSize;
	
	public CampBusinessController() {
		System.out.println(this.getClass());
	}
	
	
	/*
	 * Common
	 */
	@RequestMapping(value = "goSubMainCampBusiness", method = RequestMethod.GET)
	public String goSubMainCampBusiness(HttpSession httpSession) throws Exception {
			
		Camp campSession = new Camp();
		User tempUser = null;

		if (httpSession == null) {
			
			return "redirect:/main.jsp";			

		} else {
			
			System.out.println("campSession httpSession : " + (User) httpSession.getAttribute("user")); // 테스트
			
			// user 전체정보요청
			tempUser = userService.getUser(((User) httpSession.getAttribute("user")).getId());
			System.out.println("campSession tempUser : " + tempUser); // 테스트
			
			if (tempUser != null) {
				
				
				// role = GENERAL
				if (tempUser.getRole().equals("GENERAL")) {
					return "forward:/main.jsp";
				}			
				
				// role = ADMIN
				if (tempUser.getRole().equals("ADMIN")) {
					campSession.setUser(tempUser);
					httpSession.setAttribute("campSession", campSession);
					return "forward:/businessMain.jsp";
				}
				
				// role = BUSINESS
				if (tempUser.getRole().equals("BUSINESS")) {
					
					// 캠핑장정보 미등록시 캠핑장 등록화면 이동
					if (campBusinessService.getCampTempSaveById(tempUser.getId()) < 3) {

						campSession.setUser(tempUser);
						httpSession.setAttribute("campSession", campSession);
						System.out.println("campSession x camp : " + campSession); // 테스트
						return "forward:/campBusiness/addCampView";
					}
				}
			}
		}

		// session 에 load
		campSession = campBusinessService.getCamp(campBusinessService.getCampNoById(tempUser.getId()));
		campSession.setUser(tempUser);
		httpSession.setAttribute("campSession", campSession);
		System.out.println("campSession o camp : " + campSession); // 테스트

		// 사업자 메인으로 이동
		return "forward:/businessMain.jsp";
	}


	/*
	 * Camp
	 */
	@RequestMapping(value = "addCampView", method = RequestMethod.GET)
	public String addCampView(HttpSession httpSession, Model model) throws Exception {
		
		Camp tempCamp = new Camp();
		User tempUser = new User();
		String tempId = ((User)httpSession.getAttribute("user")).getId();
		tempUser.setId(tempId);
		tempCamp.setUser(tempUser);

		tempCamp.setCampRegDate(Date.valueOf("1111-11-11"));
		tempCamp.setCampTheme1(" ");
		tempCamp.setCampTheme2(" ");
		tempCamp.setCampNature1(" ");
		tempCamp.setCampNature2(" ");
		tempCamp.setCampOperation1(" ");
		tempCamp.setCampOperation2(" ");
		
		// 등록번호 발급
		int tempRegNum = campBusinessService.getCampNoById(tempId);
		if (tempRegNum == 0 ) {
			tempRegNum = campBusinessService.getRegNum("Camp", tempCamp);
		}
		tempCamp.setCampNo(tempRegNum);
		model.addAttribute("camp", tempCamp);		
		
		return "forward:/view/campbusiness/addCamp.jsp";
	}
	
	// 주소, 전화번호, 회원ID, 테마, 환경, 운영 Ajax 처리필요
	@RequestMapping(value = "listCamp")
	public String listCamp(@ModelAttribute("search") Search search, Model model)
			throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		search.setSearchItemType("Camp");
		Map<String, Object> map = campBusinessService.listCamp(search);
		Page resultPage = 
				new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/view/campbusiness/listCamp.jsp";
	}
	
	@RequestMapping(value = "getCamp", method = RequestMethod.GET)
	public String getCamp(@RequestParam("campNo") int campNo, Model model) throws Exception {

		Camp camp = campBusinessService.getCamp(campNo);
		model.addAttribute("camp", camp);

		return "forward:/view/campbusiness/getCamp.jsp";
	}
	
	@RequestMapping(value = "updateCampView", method = RequestMethod.POST)
	public String updateCampView(@RequestParam("campNo") int campNo, Model model) throws Exception {

		Camp camp = campBusinessService.getCamp(campNo);
		model.addAttribute("camp", camp);
		System.out.println("updateCampView camp : " +camp);
		
		return "forward:/view/campbusiness/updateCamp.jsp";
	}
	
	@RequestMapping(value = "updateCamp", method = RequestMethod.POST)
	public String updateCamp(@ModelAttribute("camp") Camp camp, HttpSession httpSession) throws Exception {	
		
		System.out.println("c1 : " + camp);	
		
		String FILE_PATH_CAMP = httpSession.getServletContext().getRealPath("/")+"uploadfiles/campimg/campbusiness/camp/";
					
		String originfileName = ""; 
		String extension = "";
		String newfileName = ""; 		
		
		Camp originalCampData = campBusinessService.getCamp(camp.getCampNo());
		System.out.println("originalCampData : " +originalCampData);
		
		if(camp.getCampMapFile() != null) {
			originfileName = camp.getCampMapFile().getOriginalFilename().trim();
			System.out.println("originfileName : " +originfileName);
			
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = camp.getCampNo() + "_map" + "." + extension;
				camp.setCampMapImg(newfileName);
				camp.getCampMapFile().transferTo(new File(FILE_PATH_CAMP, newfileName)); 
			}
		} else {
			camp.setCampMapImg(originalCampData.getCampMapImg());
		}
		
		if(camp.getCampImgFile1() != null) {
			originfileName = camp.getCampImgFile1().getOriginalFilename().trim();
			
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = camp.getCampNo() + "_1" + "." + extension;
				camp.setCampImg1(newfileName);
				camp.getCampImgFile1().transferTo(new File(FILE_PATH_CAMP, newfileName));
			}
		} else {
			camp.setCampImg1(originalCampData.getCampImg1());
		}
		
		if(camp.getCampImgFile2() != null) {
			originfileName = camp.getCampImgFile2().getOriginalFilename().trim();
			
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = camp.getCampNo() + "_2" + "." + extension;
				camp.setCampImg2(newfileName);
				camp.getCampImgFile2().transferTo(new File(FILE_PATH_CAMP, newfileName));
			}
		} else {
			camp.setCampImg2(originalCampData.getCampImg2());
		}		
		
		if(camp.getCampImgFile3() != null) {
			originfileName = camp.getCampImgFile3().getOriginalFilename().trim();
			
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = camp.getCampNo() + "_3" + "." + extension;
				camp.setCampImg3(newfileName);
				camp.getCampImgFile3().transferTo(new File(FILE_PATH_CAMP, newfileName));
			}
		} else {
			camp.setCampImg3(originalCampData.getCampImg3());
		}
		
		if(camp.getCampImgFile4() != null) {
			originfileName = camp.getCampImgFile4().getOriginalFilename().trim();
			
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = camp.getCampNo() + "_4" + "." + extension;
				camp.setCampImg4(newfileName);
				camp.getCampImgFile4().transferTo(new File(FILE_PATH_CAMP, newfileName));
			}
		} else {
			camp.setCampImg4(originalCampData.getCampImg4());
		}		
		
		if(camp.getCampImgFile5() != null) {
			originfileName = camp.getCampImgFile5().getOriginalFilename().trim();
			
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = camp.getCampNo() + "_5" + "." + extension;
				camp.setCampImg5(newfileName);
				camp.getCampImgFile5().transferTo(new File(FILE_PATH_CAMP, newfileName)); 
			}
		} else {
			camp.setCampImg5(originalCampData.getCampImg5());
		}	
	
		System.out.println("c2 : " + camp);		
		campBusinessService.updateCamp(camp);
		
		return "forward:/view/campbusiness/getCamp.jsp";
	}
		
	@RequestMapping(value = "deleteCamp", method = RequestMethod.POST)
	public String deleteCamp(@RequestParam("campNo") int campNo) throws Exception {

		campBusinessService.deleteCamp(campNo);
		return "forward:/view/common/subMainCampBusiness.jsp";
	}

	
	/*
	 * MainSite
	 */
	@RequestMapping(value = "addMainSiteView", method = RequestMethod.GET)
	public String addMainSiteView(HttpSession httpSession, Model model) throws Exception {
		
		MainSite tempMainSite = new MainSite();		
		int tempCampNo = ((Camp)httpSession.getAttribute("campSession")).getCampNo();
		tempMainSite.setCampNo(tempCampNo);

		tempMainSite.setMainSiteType(" ");
		tempMainSite.setMainSiteName(tempCampNo+"");
		tempMainSite.setMainSiteMinCapacity(0);
		tempMainSite.setMainSiteMaxCapacity(0);
		tempMainSite.setMainSiteMinPrice(0);
		tempMainSite.setMainSiteAddPrice(0);		
		tempMainSite.setMainSiteRegDate(Date.valueOf("1111-11-11"));		
		
		int tempRegNum = campBusinessService.getRegNum("MainSite", tempMainSite);		
		tempMainSite.setMainSiteNo(tempRegNum);
		model.addAttribute("mainSite", tempMainSite);			
		
		return "forward:/view/campbusiness/addMainSite.jsp";
	}

	// 구역크기, 기본인원, 최대인원, 기본인원사용금액, 추가인원금액 Ajax 처리필요
	@RequestMapping(value = "listMainSite")
	public String listMainSite(@ModelAttribute("search") Search search, Model model)
			throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		search.setSearchItemType("MainSite");
		Map<String, Object> map = campBusinessService.listMainSite(search);
		Page resultPage = 
				new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,	pageSize);
	
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/view/campbusiness/listMainSite.jsp";
	}

	@RequestMapping(value = "getMainSite", method = RequestMethod.GET)
	public String getMainSite(@RequestParam("mainSiteNo") int mainSiteNo, Model model) throws Exception {
		
		MainSite mainSite = campBusinessService.getMainSite(mainSiteNo);
		model.addAttribute("mainSite", mainSite);

		return "forward:/view/campbusiness/getMainSite.jsp";
	}

	@RequestMapping(value = "updateMainSiteView", method = RequestMethod.POST)
	public String updateMainSiteView(@RequestParam("mainSiteNo") int mainSiteNo, Model model) throws Exception {
		
		MainSite mainSite = campBusinessService.getMainSite(mainSiteNo);
		model.addAttribute("mainSite", mainSite);

		return "forward:/view/campbusiness/updateMainSite.jsp";
	}

	@RequestMapping(value = "updateMainSite", method = RequestMethod.POST)
	public String updateMainSite(@ModelAttribute("mainSite") MainSite mainSite, HttpSession httpSession) throws Exception {
		
		String FILE_PATH_MAINSITE = httpSession.getServletContext().getRealPath("/")+"uploadfiles/campimg/campbusiness/mainsite/";
		
		String originfileName = ""; 
		String extension = "";
		String newfileName = ""; 			
		
		if(mainSite.getMainSiteImgFile1() != null) {			
			originfileName = mainSite.getMainSiteImgFile1().getOriginalFilename().trim();
			
			if(!(originfileName.equals(""))) {				
				extension = originfileName.split("\\.")[1];		
				newfileName = mainSite.getCampNo()+"-" + mainSite.getMainSiteNo() +"_1" + "." + extension;
				mainSite.setMainSiteImg1(newfileName);
				mainSite.getMainSiteImgFile1().transferTo(new File(FILE_PATH_MAINSITE, newfileName)); 
			}
		}
		
		if(mainSite.getMainSiteImgFile2() != null) {
			originfileName = mainSite.getMainSiteImgFile2().getOriginalFilename().trim();
			
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = mainSite.getCampNo()+"-" + mainSite.getMainSiteNo() +"_2" + "." + extension;
				mainSite.setMainSiteImg2(newfileName);
				mainSite.getMainSiteImgFile2().transferTo(new File(FILE_PATH_MAINSITE, newfileName)); 
			}
		}
		
		if(mainSite.getMainSiteImgFile3() != null) {
			originfileName = mainSite.getMainSiteImgFile3().getOriginalFilename().trim();
			
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = mainSite.getCampNo()+"-" + mainSite.getMainSiteNo() +"_3" + "." + extension;
				mainSite.setMainSiteImg3(newfileName);
				mainSite.getMainSiteImgFile3().transferTo(new File(FILE_PATH_MAINSITE, newfileName)); 
			}
		}
		
		campBusinessService.updateMainSite(mainSite);
		return "forward:/view/campbusiness/getMainSite.jsp";
	}

	@RequestMapping(value = "deleteMainSite", method = RequestMethod.POST)
	public String deleteMainSite(@RequestParam("mainSiteNo") int mainSiteNo) throws Exception {

		campBusinessService.deleteMainSite(mainSiteNo);
		return "forward:/view/common/subMainCampBusiness.jsp";
	}

	
	/*
	 * SubSite
	 */
	@RequestMapping(value = "addSubSiteView", method = RequestMethod.GET)
	public String addSubSiteView(HttpSession httpSession, Model model) throws Exception {
				
		SubSite tempSubSite = new SubSite();		
		int tempCampNo = ((Camp)httpSession.getAttribute("campSession")).getCampNo();
		tempSubSite.setCampNo(tempCampNo);

		tempSubSite.setSubSiteType(" ");
		tempSubSite.setSubSiteName(tempCampNo+"");
		tempSubSite.setSubSiteRegDate(Date.valueOf("1111-11-11"));
		
		// 등록번호 발급
		int tempRegNum = campBusinessService.getRegNum("SubSite", tempSubSite);		
		tempSubSite.setSubSiteNo(tempRegNum);
		model.addAttribute("subSite", tempSubSite);		
		 
		return "forward:/view/campbusiness/addSubSite.jsp";
	}

	@RequestMapping(value = "listSubSite")
	public String listSubSite(@ModelAttribute("search") Search search, Model model)
			throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		search.setSearchItemType("SubSite");
		Map<String, Object> map = campBusinessService.listSubSite(search);
		Page resultPage = 
				new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,	pageSize);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/view/campbusiness/listSubSite.jsp";
	}

	@RequestMapping(value = "getSubSite", method = RequestMethod.GET)
	public String getSubSite(@RequestParam("subSiteNo") int subSiteNo, Model model) throws Exception {
		SubSite subSite = campBusinessService.getSubSite(subSiteNo);
		model.addAttribute("subSite", subSite);

		return "forward:/view/campbusiness/getSubSite.jsp";
	}

	@RequestMapping(value = "updateSubSiteView", method = RequestMethod.POST)
	public String updateSubSiteView(@RequestParam("subSiteNo") int subSiteNo, Model model) throws Exception {

		SubSite subSite = campBusinessService.getSubSite(subSiteNo);
		model.addAttribute("subSite", subSite);

		return "forward:/view/campbusiness/updateSubSite.jsp";
	}

	@RequestMapping(value = "updateSubSite", method = RequestMethod.POST)
	public String updateSubSite(@ModelAttribute("subSite") SubSite subSite, HttpServletRequest httpServletRequest, HttpSession httpSession) throws Exception {
				
		String FILE_PATH_SUBSITE = httpSession.getServletContext().getRealPath("/")+"uploadfiles/campimg/campbusiness/subsite/";
		
		String originfileName = ""; 
		String extension = "";
		String newfileName = ""; 			

		if(subSite.getSubSiteImgFile() != null) {
			originfileName = subSite.getSubSiteImgFile().getOriginalFilename().trim();
					
			if(!(originfileName.equals(""))) {
				extension = originfileName.split("\\.")[1];		
				newfileName = subSite.getCampNo() + "-" + subSite.getSubSiteNo() + "." + extension;
				subSite.setSubSiteImg(newfileName);
				subSite.getSubSiteImgFile().transferTo(new File(FILE_PATH_SUBSITE, newfileName)); 
			}
		}
		
		campBusinessService.updateSubSite(subSite);
		return "forward:/view/campbusiness/getSubSite.jsp";
	}

	@RequestMapping(value = "deleteSubSite", method = RequestMethod.POST)
	public String deleteSubSite(@RequestParam("subSiteNo") int subSiteNo) throws Exception {

		campBusinessService.deleteSubSite(subSiteNo);
		return "forward:/view/common/subMainCampBusiness.jsp";
	}
	
	
	/*
	 * Qna
	 */
	@RequestMapping(value = "listCampQna")
	public String listCampQna(@RequestParam(value ="campNo", required = false, defaultValue = "0") int campNo,
								@RequestParam(value ="userId", required = false) String userId,	Model model) throws Exception {
		
		System.out.println("campNo : "+campNo);
		System.out.println("userId : "+userId);
		
		List<Qna> list = new ArrayList<Qna>();
				
		if(campNo != 0) {
			list = campBusinessService.listCampQna(campNo);
			model.addAttribute("campNo", campNo);

		} else if( userId != null) {
			list = campBusinessService.listCampQnaById(userId);
		}
		
		System.out.println("Qna list : "+ list);
		model.addAttribute("list", list);

		return "forward:/view/campbusiness/listCampQna.jsp";
	}
	
	@RequestMapping(value = "addCampQnaQuestion", method = RequestMethod.GET)
	public String addCampQnaQuestion(@RequestParam("campNo") int campNo, Qna qna, Model model) throws Exception {
		
		qna.setCampNo(campNo);
		model.addAttribute("qna", qna);
		
		return "forward:/view/campbusiness/addCampQnaQuestion.jsp";
	}
	
	@RequestMapping(value = "addCampQnaQuestion", method = RequestMethod.POST)
	public String addCampQnaQuestion(@ModelAttribute("qna") Qna qna, Model model) throws Exception {
		
		System.out.println("qna : "+qna);
		campBusinessService.addCampQnaQuestion(qna);
		
		model.addAttribute("qna",qna);
		return "forward:/view/campbusiness/listCampQna.jsp";
	}
	
	@RequestMapping(value = "getCampQna", method = RequestMethod.GET)
	public String getCampQna(@RequestParam("qnaNo") int qnaNo ,HttpSession session, Model model) throws Exception {
		
		System.out.println("qnaNo : "+qnaNo);
		Qna qna = campBusinessService.getCampQna(qnaNo);
		model.addAttribute("qna" , qna);

		return "forward:/view/campbusiness/getCampQna.jsp";		
	}
	
	@RequestMapping(value = "addCampQnaAnswer", method = RequestMethod.POST)
	public String addCampQnaAnswer(@ModelAttribute("qna") Qna qna, Model model) throws Exception {
		
		System.out.println("qna : "+qna);
		
		campBusinessService.addCampQnaAnswer(qna);
		model.addAttribute("qna" , qna);

		return "forward:/businessMain.jsp";		
	}
	
	
	/*
	 * Notice
	 */
	@RequestMapping(value = "listCampNotice", method = RequestMethod.POST)
	public String listCampNotice(@RequestParam("campNo") int campNo, Model model)
			throws Exception {
		
		System.out.println("campNo : "+campNo);

		List<Notice> list = campBusinessService.listCampNotice(campNo);
		model.addAttribute("list", list);

		return "forward:/view/campbusiness/listCampNotice.jsp";
	}
	
	@RequestMapping(value = "addCampNotice", method = RequestMethod.GET)
	public String addCampNotice() throws Exception {
		return "forward:/view/campbusiness/addCampNotice.jsp";
	}
	
	@RequestMapping(value = "addCampNotice", method = RequestMethod.POST)
	public String addCampNotice(@ModelAttribute("notice") Notice notice, Model model) throws Exception {
		
		System.out.println("notice : "+notice);
		campBusinessService.addCampNotice(notice);
		
		model.addAttribute("notice",notice);
		return "forward:/view/campbusiness/getCampNotice.jsp";
	
	}
	
	@RequestMapping(value = "getCampNotice", method = RequestMethod.GET)
	public String getCampNotice(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
		
		System.out.println("noticeNo : "+noticeNo);
		Notice notice = campBusinessService.getCampNotice(noticeNo);
	
		model.addAttribute("notice" , notice);
		
		return "forward:/view/campbusiness/getCampNotice.jsp";
	}
	
	@RequestMapping(value = "updateCampNotice", method = RequestMethod.GET)
	public String updateCampNotice(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
		
		System.out.println("noticeNo : "+noticeNo);
		Notice notice = campBusinessService.getCampNotice(noticeNo);
		model.addAttribute("notice" , notice);
		
		return "forward:/view/campbusiness/updateCampNotice.jsp";
	}
	
	@RequestMapping(value = "updateCampNotice", method = RequestMethod.POST)
	public String updateCampNotice(@ModelAttribute("notice") Notice notice, Model model) throws Exception {
		
		System.out.println("notice : "+notice);
		campBusinessService.updateCampNotice(notice);
		
		model.addAttribute("notice",notice);
		return "forward:/view/campbusiness/getCampNotice.jsp";
	}
	
	@RequestMapping(value = "deleteCampNotice", method = RequestMethod.POST)
	public String deleteCampNotice(@RequestParam("noticeNo") int noticeNo) throws Exception {

		System.out.println("noticeNo : "+noticeNo);
		campBusinessService.deleteCampNotice(noticeNo);
		
		return "forward:/view/campbusiness/listCampNotice.jsp";
	}

} // end of class
