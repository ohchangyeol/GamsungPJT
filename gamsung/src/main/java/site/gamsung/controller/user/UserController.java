package site.gamsung.controller.user;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "forward:/view/user/loginView.jsp";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getId());
		
		if(user.getPassword().equals(dbUser.getPassword())) {
			
			if(user.getDormantConversionDate() != null) {
				return "휴면회원임.일반으로 전환할건지?.jsp";
			}else if(user.getSecessionRegDate() != null) {
				return "탈퇴회원안내.jsp";
			}else if(user.getSuspensionDate() != null) {
				return "이용정지된 회원임.jsp";
			} else {			 
				if(user.getRole().equals("BUSINESS")) {
					if(user.getBusinessUserApprovalFlag().equals("Y")) {
						session.setAttribute("user", dbUser);
						return "사업자메인.jsp";   
					}else {
						return "아직 회원가입 승인안됨.jsp";
					}
				  } else {
					  session.setAttribute("user", dbUser);
				  }			
			}
		}
			return "redirect:/main.jsp";
	}
}
