package site.gamsung.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.gamsung.service.domain.User;
import site.gamsung.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserController() {}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addUser", method=RequestMethod.GET)
	public String addUser() throws Exception{
		
		System.out.println("/user/addUser:GET");
		
		return null;
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) throws Exception{
		
		System.out.println("/user/addUser:POST");
		
		userService.addUser(user);
		
		return "redirect:/user/loginModal.jsp";
	}
	
	@RequestMapping(value="getUser", method=RequestMethod.POST)
	public String getUser(@ModelAttribute("user") String id, Model model) throws Exception{
		
		System.out.println("/user/getUser:POST");
		
		User user = userService.getUser(id);
		
		model.addAttribute("user", user);
		
		
		return "forward:/user/getUser.jsp";
	}

}
