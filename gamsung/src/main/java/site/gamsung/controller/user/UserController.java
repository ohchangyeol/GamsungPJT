package site.gamsung.controller.user;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import site.gamsung.service.domain.User;
import site.gamsung.service.user.UserService;
import site.gamsung.util.user.SHA256Util;

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
		
		return "redirect:/view/user/addUser.jsp";
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) throws Exception{
		
		System.out.println("/user/addUser:POST");
		
		//user.setRole("GENERAL");
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
		System.out.println(user);
		User dbUser=userService.checkIdPassword(user);
		
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
		
		String jsp ="forward:/main.jsp";
//		String pw = user.getPassword();
//		System.out.println("비밀번호"+pw);
//		System.out.println("솔트"+dbUser.getSalt());
//		String newPwd = SHA256Util.getEncrypt(pw, dbUser.getSalt());
//		System.out.println("암호화"+newPwd);
		
	
		if(dbUser != null) {
			System.out.println("로그인 시작");
			
			if(dbUser.getNickName() != null) {
				jsp = "redirect:/main.jsp";
			}else if(dbUser.getBusinessUserApprovalFlag() != null && dbUser.getBusinessUserApprovalFlag().equals("Y")) {
				jsp = "forward:/campbusiness/goSubMainCampBusiness.jsp"; 
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
		

	@RequestMapping(value = "getKakaoAuthUrl", method= RequestMethod.GET)
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=5069ddcbe63e1882c2df7cc176f1a96f"
				+ "&redirect_uri=http://localhost:8080/user/kakaoCallback"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "kakaoCallback")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Model model, HttpSession session) throws Exception {
		System.out.println("#########" + code);
        String accessToken = userService.getAccessToken(code);
        System.out.println("###access_Token#### : " + accessToken);
        
        HashMap<String, Object> userInfo = userService.getUserInfo(accessToken);
        System.out.println("###access_Token#### : " + accessToken);
        String email=(String)userInfo.get("email");
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###sns_id#### : " + userInfo.get("snsId"));
       
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        model.addAttribute("kakaoInfo", kakaoInfo);
        User userEmail = userService.getUser(email);
        
        if(accessToken != null) {
			session.setAttribute("kakaoToken", accessToken);
		}
        
        
        if(userEmail != null) {
              if(email.equals(userService.getUser(email).getId())) {
	        	
	        	if(userEmail.getSnsId() != null) {
	        		session.setAttribute("user", userEmail);
	        	   return "forward:/view/user/main.jsp";
	        	} else {
	        		//우리 회원임
	        		return "redirect:/view/user/login.jsp";
	        	} 	
	        } 
        }
        return "forward:/view/user/addUser.jsp";
	}
	
	@RequestMapping(value="/kakaologout")
	public String kakaoLogout(HttpSession session) {
	userService.kakaoLogout((String)session.getAttribute("accessToken"));
	session.invalidate();
	return "redirect:/main.jsp"; 
	}
	
	@RequestMapping(value="/kakaounlink") 
	public String unlink(HttpSession session) { 
		userService.unlink((String)session.getAttribute("access_token")); 
		session.invalidate();
		return "redirect:/";
		}


	
	

	
}

