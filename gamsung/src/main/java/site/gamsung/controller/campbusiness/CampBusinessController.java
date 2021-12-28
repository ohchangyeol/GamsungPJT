package site.gamsung.controller.campbusiness;

import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;
import site.gamsung.service.domain.User;
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

	// @Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 5}")
	int pageUnit;

	// @Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 10}")
	int pageSize;

	private static final String FILE_PATH = "C:\\Users\\Choi\\git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\campimg\\campbusiness\\camp";

	public CampBusinessController() {
		System.out.println(this.getClass());
	}
	
	/*
	 * Common
	 */
	@RequestMapping(value = "goSubMainCampBusiness", method = RequestMethod.GET)
	public String goSubMainCampBusiness(HttpSession httpSession, Model model) throws Exception {

		/////////////////////////////////////////////////////////////////////// Session 완료시 삭제
		User tempSessionUser = new User();
		
		tempSessionUser.setId("businessuser1@gamsung.com"); // TS -3 저장
		//tempSessionUser.setId("businessuser6@gamsung.com"); // TS -2 임시저장
		//tempSessionUser.setId("businessuser9@gamsung.com"); // TS -1 발급 완료
		//tempSessionUser.setId("businessuser11@gamsung.com");  // TS -0 발급 미완료
		//tempSessionUser.setId("admin");					  // admin
		
		httpSession.setAttribute("user", tempSessionUser);
		System.out.println("tempSessionUser : " + tempSessionUser);
		/////////////////////////////////////////////////////////////////////// 여기까지 삭제

		
		Camp campSession = new Camp();
		User tempUser = null;

		if (httpSession != null) {
			
			// user 전체정보요청
			tempUser = userService.getUser(((User) httpSession.getAttribute("user")).getId());
			System.out.println("campSession tempUser : " + tempUser); // 테스트
			
			if (tempUser != null) {
				
				// role = business
				if (tempUser.getRole().equals("BUSINESS")) {
					
					// 캠핑장정보 미등록시 캠핑장 등록화면 이동
					if (campBusinessService.getCampTempSaveById(tempUser.getId()) < 3) {

						campSession.setUser(tempUser);
						httpSession.setAttribute("campSession", campSession);
						System.out.println("campSession x camp : " + campSession); // 테스트
						return "forward:/campBusiness/addCampView";
					}
				}
				
				// role = admin
				if (tempUser.getRole().equals("ADMIN")) {
					campSession.setUser(tempUser);
					httpSession.setAttribute("campSession", campSession);
					return "forward:/view/common/subMainCampBusiness.jsp";
				}
			}

		} else {
			return "redirect:/main.jsp";
		}

		// session 에 load
		campSession = campBusinessService.getCamp(campBusinessService.getCampNoById(tempUser.getId()));
		campSession.setUser(tempUser);
		httpSession.setAttribute("campSession", campSession);
		System.out.println("campSession o camp : " + campSession); // 테스트

		// 사업자 메인으로 이동
		return "forward:/view/common/subMainCampBusiness.jsp";
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
		System.out.println("tempRegNum1 : " + tempRegNum);
		if (tempRegNum == 0 ) {
			tempRegNum = campBusinessService.getRegNum(tempCamp);
		}
		System.out.println("tempRegNum2 : " + tempRegNum);
		tempCamp.setCampNo(tempRegNum);
		model.addAttribute("camp", tempCamp);		
		
		return "forward:/view/campbusiness/addCamp.jsp";
	}
	
	// 주소, 전화번호, 회원ID, 테마, 환경, 운영 Ajax 처리필요
	@RequestMapping(value = "listCamp", method = RequestMethod.POST)
	public String listCamp(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		search.setSearchItemType("Camp");
		Map<String, Object> map = campBusinessService.listCamp(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

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

		return "forward:/view/campbusiness/updateCamp.jsp";
	}
	
	@RequestMapping(value = "updateCamp", method = RequestMethod.POST)
	public String updateCamp(@ModelAttribute("camp") Camp camp, MultipartHttpServletRequest multipartRequest) throws Exception {	
		System.out.println("c1 : " + camp);	
			
		List<MultipartFile> fileList = multipartRequest.getFiles("file");
        String src = multipartRequest.getParameter("src");
        System.out.println("src value : " + src);

        String path = "C:\\image\\";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                   e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

		System.out.println("c1 : " + camp);		
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
	public String addMainSiteView() throws Exception {
		return "forward:/view/campbusiness/addMainSite.jsp";
	}

	@RequestMapping(value = "addMainSite", method = RequestMethod.POST)
	public String addMainSite(@ModelAttribute("mainSite") MainSite mainSite) throws Exception {

		campBusinessService.addMainSite(mainSite);
		return "forward:/view/campbusiness/getMainSite.jsp";
	}

	// 구역크기, 기본인원, 최대인원, 기본인원사용금액, 추가인원금액 Ajax 처리필요
	@RequestMapping(value = "listMainSite", method = RequestMethod.POST)
	public String listMainSite(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		search.setSearchItemType("MainSite");
		Map<String, Object> map = campBusinessService.listMainSite(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

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
	public String updateMainSite(@ModelAttribute("mainSite") MainSite mainSite) throws Exception {
		
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
	public String addSubSiteView() throws Exception {
		return "forward:/view/campbusiness/addSubSite.jsp";
	}

	@RequestMapping(value = "addSubSite", method = RequestMethod.POST)
	public String addSubSite(@ModelAttribute("SubSite") SubSite subSite) throws Exception {

		campBusinessService.addSubSite(subSite);
		return "forward:/view/campbusiness/getSubSite.jsp";
	}

	@RequestMapping(value = "listSubSite", method = RequestMethod.POST)
	public String listSubSite(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		search.setSearchItemType("SubSite");
		Map<String, Object> map = campBusinessService.listSubSite(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

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
	public String updateSubSite(@ModelAttribute("subSite") SubSite subSite) throws Exception {
		
		campBusinessService.updateSubSite(subSite);
		return "forward:/view/campbusiness/getSubSite.jsp";
	}

	@RequestMapping(value = "deleteSubSite", method = RequestMethod.POST)
	public String deleteSubSite(@RequestParam("subSiteNo") int subSiteNo) throws Exception {

		campBusinessService.deleteSubSite(subSiteNo);
		return "forward:/view/common/subMainCampBusiness.jsp";
	}

} // end of class
