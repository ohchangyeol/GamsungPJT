package site.gamsung.controller.servicecenter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/servicecenter/*")
public class ServiceCenterController {

	// Constructor
	public ServiceCenterController() {
		System.out.println("@Controller :: " + this.getClass());
	}
	
	@RequestMapping(value = "home")
	public String serviceCenterHome() {
		return "redirect:/view/servicecenter/serviceCeneterHome.jsp";
	}
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public void addNotice() {
		
	}
	
}
