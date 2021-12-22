package site.gamsung.controller.user;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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
		
		if(dbUser == null) {
			return "forward:/main.jsp";
		}
		
		System.out.println(dbUser);
//		System.out.println("1111111111111"+dbUser);
		LocalDate now = LocalDate.now();
//		System.out.println("222222222222222222now"+now);
		String regDate=now.toString();
		Date currentDate=dbUser.getCurrentLoginRegDate();
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		java.sql.Date date = java.sql.Date.valueOf(now);
		
		if(dbUser.getRole().equals("ADMIN")) {
			return "관리자메인.jsp";
		}else if(dbUser.getDormantConversionDate() != null) {
			return "휴면회원임.일반으로 전환할건지?.jsp";
		}else if(dbUser.getSecessionRegDate() != null) {
			return "탈퇴회원안내.jsp";
		}else if(dbUser.getSuspensionDate() != null) {
			return "이용정지된 회원임.jsp";
		}
		
		String jsp ="";
		
		if(user.getPassword().equals(dbUser.getPassword())) {
			System.out.println("로그인 시작");
			
			if(dbUser.getNickName() != null) {
				jsp = "redirect:/main.jsp";
			}else if(dbUser.getBusinessUserApprovalFlag() != null && dbUser.getBusinessUserApprovalFlag().equals("Y")) {
				jsp = "forward:/campbusiness/goSubMainCampBusiness"; 
		    }else {
		    	return "아직 회원가입 승인안됨.jsp";
		    	
			}
		}
		
		if(!(currentDate != null && regDate.equals(currentDate.toString()))) {
			userService.addLoginDate(dbUser);	
		}
			
		session.setAttribute("user", dbUser);
		return jsp;
	}
		
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		System.out.println("/user/logout : GET");
		
		session.invalidate();
		
		return "redirect:/main.jsp";
		
	}
}
