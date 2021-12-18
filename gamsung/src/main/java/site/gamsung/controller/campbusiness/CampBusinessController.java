package site.gamsung.controller.campbusiness;

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

import site.gamsung.service.domain.Camp;
import site.gamsung.service.campbusiness.CampBusinessService;

@Controller
@RequestMapping("/campBusiness/*")
public class CampBusinessController {
	
	/// Field
	@Autowired
	@Qualifier("campBusinessServiceImpl")
	private CampBusinessService campBusinessService;
	
	//@Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 10}")
	int pageUnit;

	//@Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 5}")
	int pageSize;	
	
	private static final String FILE_SERVER_PATH = "C:\\Users\\Choi\\git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\campimg\\camp";
	
	public CampBusinessController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "addCamp", method = RequestMethod.POST)
	public String addCamp() throws Exception {
		
		String methodName = new Object() {}.getClass().getEnclosingMethod().getName();
		System.out.println(" >> "+ this.getClass().getName() + " : " + methodName);
		
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
		
		// Business Logic
		campBusinessService.addCamp(null);
	
		return "redirect:/view/campbusiness/getCamp.jsp";
	}
	
	
	
	
	
	
	
	
	

}
