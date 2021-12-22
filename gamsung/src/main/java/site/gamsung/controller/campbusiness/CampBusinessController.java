package site.gamsung.controller.campbusiness;

import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.campbusiness.CampBusinessService;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;
import site.gamsung.service.domain.User;

@Controller
@RequestMapping("/campBusiness/*")
public class CampBusinessController {

	/// Field
	@Autowired
	@Qualifier("campBusinessServiceImpl")
	private CampBusinessService campBusinessService;

	// @Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 5}")
	int pageUnit;

	// @Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 10}")
	int pageSize;

	private static final String FILE_SERVER_PATH = "C:\\Users\\Choi\\git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\campimg\\camp";

	public CampBusinessController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String goMain() throws Exception {		
		return "forward:/view/common/subMainCampBusiness.jsp";
	}
	
	
	/*
	 * Camp
	 */	
	@RequestMapping(value = "addCamp", method = RequestMethod.GET)
	public String addCamp() throws Exception {		
		return "forward:/view/campbusiness/addCamp.jsp";
	}

	@RequestMapping(value = "addCamp", method = RequestMethod.POST)
	public String addCamp(@ModelAttribute("camp") Camp camp, @RequestParam("userId") String userId) throws Exception {

		String methodName = new Object() { }.getClass().getEnclosingMethod().getName();
		System.out.println(" >> " + this.getClass().getName() + " : " + methodName);
		
		User tempUser = new User();
		tempUser.setId(userId);
		camp.setUser(tempUser);

//		// File upload
//		int newCampNo = campBusinessService.findLastCampNum().getProdNo()+1;
//		String newFileName = newCampNo+"";		
//			
//		if(!file.getOriginalFilename().isEmpty()) {
//			String[] temp = (file.getOriginalFilename()).split("\\.");
//			newFileName = newFileName+"."+temp[1];			
//			file.transferTo(new File(FILE_SERVER_PATH, newFileName));
//			product.setFileName(newFileName);
//		}
	
		campBusinessService.addCamp(camp);
		
		return "forward:/view/campbusiness/getCamp.jsp";
	}
	
	// 주소, 전화번호, 회원ID, 테마, 환경, 운영 Ajax 처리필요
	@RequestMapping(value = "listCamp", method = RequestMethod.GET)
	public String listCamp(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception{
		
		Map<String, Object> map = campBusinessService.listCamp(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/view/campbusiness/listCamp.jsp";
	}
	
	@RequestMapping(value = "getCamp", method = RequestMethod.GET)
	public String getCamp(@RequestParam("campNo") int campNo, Model model) throws Exception{		
		Camp camp = campBusinessService.getCamp(campNo);
		model.addAttribute("camp", camp);		
		
		return "forward:/view/campbusiness/getCamp.jsp";
	}

	@RequestMapping(value = "updateCampView", method = RequestMethod.POST)
	public String updateCampView(@RequestParam("campNo") int campNo, Model model) throws Exception{		
		Camp camp = campBusinessService.getCamp(campNo);
		model.addAttribute("camp", camp);		
		
		return "forward:/view/campbusiness/updateCamp.jsp";
	}
	
	@RequestMapping(value = "updateCamp", method = RequestMethod.POST)
	public String updateCamp(Camp camp) throws Exception{
		return null;
	}

	@RequestMapping(value = "deleteCamp", method = RequestMethod.POST)
	public String deleteCamp(@RequestParam("campNo") int campNo) throws Exception{
		campBusinessService.deleteCamp(campNo);
		return "forward:/view/common/subMainCampBusiness.jsp";
	}

	
	/*
	 * MainSite
	 */	
	@RequestMapping(value = "addMainSite", method = RequestMethod.GET)
	public String addMainSite() throws Exception {		
		return "forward:/view/campbusiness/addMainSite.jsp";
	}

	@RequestMapping(value = "addMainSite", method = RequestMethod.POST)
	public String addMainSite(@ModelAttribute("mainSite") MainSite mainSite) throws Exception {

		String methodName = new Object() { }.getClass().getEnclosingMethod().getName();
		System.out.println(" >> " + this.getClass().getName() + " : " + methodName);
		
		campBusinessService.addMainSite(mainSite);
		
		return "forward:/view/campbusiness/getMainSite.jsp";
	}
	
	// 구역크기, 기본인원, 최대인원, 기본인원사용금액, 추가인원금액 Ajax 처리필요
	@RequestMapping(value = "listMainSite", method = RequestMethod.GET)
	public String listMainSite(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception{
		
		Map<String, Object> map = campBusinessService.listMainSite(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/view/campbusiness/listMainSite.jsp";
	}
	
	@RequestMapping(value = "getMainSite", method = RequestMethod.GET)
	public String getMainSite(@RequestParam("mainSiteNo") int mainSiteNo, Model model) throws Exception{		
		MainSite mainSite = campBusinessService.getMainSite(mainSiteNo);
		model.addAttribute("mainSite", mainSite);		
		
		return "forward:/view/campbusiness/getMainSite.jsp";
	}
	
	@RequestMapping(value = "updateMainSiteView", method = RequestMethod.POST)
	public String updateMainSiteView(@RequestParam("mainSiteNo") int mainSiteNo, Model model) throws Exception{
		MainSite mainSite = campBusinessService.getMainSite(mainSiteNo);
		model.addAttribute("mainSite", mainSite);
		
		return "forward:/view/campbusiness/updateMainSite.jsp";
	}
	
	@RequestMapping(value = "updateMainSite", method = RequestMethod.POST)
	public String updateMainSite(MainSite mainSite) throws Exception{
		return null;
	}	
	
	@RequestMapping(value = "deleteMainSite", method = RequestMethod.POST)
	public String deleteMainSite(@RequestParam("mainSiteNo") int mainSiteNo) throws Exception{
		campBusinessService.deleteMainSite(mainSiteNo);
		return "forward:/view/common/subMainCampBusiness.jsp";
	}

	
	/*
	 * SubSite
	 */
	@RequestMapping(value = "addSubSite", method = RequestMethod.GET)
	public String addSubSite() throws Exception {		
		return "forward:/view/campbusiness/addSubSite.jsp";
	}

	@RequestMapping(value = "addSubSite", method = RequestMethod.POST)
	public String addSubSite(@ModelAttribute("subSite") SubSite subSite) throws Exception {

		String methodName = new Object() { }.getClass().getEnclosingMethod().getName();
		System.out.println(" >> " + this.getClass().getName() + " : " + methodName);

		campBusinessService.addSubSite(subSite);
		
		return "forward:/view/campbusiness/getSubSite.jsp";
	}

	@RequestMapping(value = "listSubSite", method = RequestMethod.GET)
	public String listSubSite(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception{
		
		Map<String, Object> map = campBusinessService.listSubSite(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/view/campbusiness/listSubSite.jsp";
	}	
	
	@RequestMapping(value = "getSubSite", method = RequestMethod.GET)
	public String getSubSite(@RequestParam("subSiteNo") int subSiteNo, Model model) throws Exception{		
		SubSite subSite = campBusinessService.getSubSite(subSiteNo);
		model.addAttribute("subSite", subSite);		
		
		return "forward:/view/campbusiness/getSubSite.jsp";
	}
	
	@RequestMapping(value = "updateSubSiteView", method = RequestMethod.POST)
	public String updateSubSiteView(@RequestParam("subSiteNo") int subSiteNo, Model model) throws Exception{
		SubSite subSite = campBusinessService.getSubSite(subSiteNo);
		model.addAttribute("subSite", subSite);
		
		return "forward:/view/campbusiness/updateSubSite.jsp";
	}

	@RequestMapping(value = "updateSubSite", method = RequestMethod.POST)
	public String updateSubSite(SubSite subSite) throws Exception{
		return null;
	}
	
	@RequestMapping(value = "deleteSubSite", method = RequestMethod.POST)
	public String deleteSubSite(@RequestParam("subSiteNo") int subSiteNo) throws Exception{
		campBusinessService.deleteSubSite(subSiteNo);
		return "forward:/view/common/subMainCampBusiness.jsp";
	}

} // end of class
