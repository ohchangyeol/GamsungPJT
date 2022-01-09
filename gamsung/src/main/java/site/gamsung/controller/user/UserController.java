package site.gamsung.controller.user;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;
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
		
		return "redirect:/view/user/addUser.jsp";
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user){
		
		System.out.println("/user/addUser:POST");
		
		//user.setRole("GENERAL");
		userService.addUser(user);
		
		return "redirect:/main.jsp";
	}
	
	@RequestMapping(value="getUser", method=RequestMethod.GET)
	public String getUser(@ModelAttribute("userId") String id, Model model){
		
		System.out.println("/user/getUser:GET");
		
		User user = userService.getUser(id);
		
		model.addAttribute("user", user);
		
		if(user.getRole().equals("GENERAL")) {
			return "forward:/view/common/maPage.jsp";
		} else{
			return "forward:/view/user/getBusinessUserUpdate.jsp";
		}
		
	}
	
	@RequestMapping(value="updateUser", method=RequestMethod.GET)
	public String updateUser(@RequestParam("id") String id, Model model) {
		
		System.out.println("/user/updateUser : GET");
		
		User user = userService.getUser(id);
		
		model.addAttribute("user", user);
		
		return "forward:/view/common/myPage.jsp";
		
	}
	
	@RequestMapping(value="updateUser", method=RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) {
		
		System.out.println("/user/updateUser : POST");
		
		System.out.println("입력된 User"+user);
		
		
		User sessionUser=(User)session.getAttribute("user");
			
		System.out.println("세션유저"+sessionUser);
		System.out.println("유저 솔트값"+user.getSalt());
		System.out.println("유저 비밀번호"+user.getPassword());

		if(sessionUser.getId().equals(user.getId())){
			System.out.println("이프문 안이다");
			if(user.getPassword()==null || user.getPassword()=="") {
			System.out.println("패스워드가 널이다");
			user.setPassword(sessionUser.getPassword());
			System.out.println(sessionUser.getPassword());
			}else {
				System.out.println("널이 아니다");
				user.setPassword(user.getPassword());
				user.setSalt(sessionUser.getSalt());
			}	
		}
			
			userService.updateUser(user);
						
//			User upUser=userService.getUser(user.getId());
			session.setAttribute("user", user);
					
		
//		String seesionId=((User)session.getAttribute("user")).getId();
//		

//		session.setAttribute("user", user);
//		User upSession=(User)session.getAttribute("user");
//		
//		System.out.println("변경이 되었는가"+upSession);
		if(user.getRole().equals("GENERAL")) {
			return "forward:/view/common/myPage.jsp";
		}else {
			return "forward:/view/user/getBusinessUserUpdate.jsp";
		}
		
	}
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "/";
	}
	

	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session){
		
		System.out.println("/user/login : POST");
		//Business Logic
		System.out.println(user);
		User dbUser=userService.checkIdPassword(user);
//		if(session.getAttribute("eamil")!=null) {
//		User kUser=userService.getUser(session.getAttribute("eamil").toString());
//		}
		if(dbUser == null) {
			return "forward:/view/user/addGeneralUser.jsp";
		}
		
//		if(kUser.getSnsId()!=null) {
//			System.out.println("카카오 로그인");
//			session.setAttribute("user", kUser);
//			return "forward:/";
//		}
		
		System.out.println(dbUser);
//		System.out.println("1111111111111"+dbUser);
		LocalDate now = LocalDate.now();
//		System.out.println("222222222222222222now"+now);
		String regDate=now.toString();
		Date currentDate=dbUser.getCurrentLoginRegDate();
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		java.sql.Date date = java.sql.Date.valueOf(now);
			
		if(dbUser.getRole().equals("ADMIN")) {
			session.setAttribute("user", dbUser);
			return "redirect:/admin";
		}else if(dbUser.getDormantConversionDate() != null) {
			session.setAttribute("id", user.getId());
			System.out.println("휴면회원 아이디"+user.getId());
			return "/view/user/updateDormantGeneralUserConvert.jsp";
		}else if(dbUser.getSecessionRegDate() != null) {
			return "탈퇴회원안내.jsp";
		}else if(dbUser.getSuspensionDate() != null) {
			return "이용정지된 회원임.jsp";
		}
		
		String jsp ="/";
//		String pw = user.getPassword();
//		System.out.println("비밀번호"+pw);
//		System.out.println("솔트"+dbUser.getSalt());
//		String newPwd = SHA256Util.getEncrypt(pw, dbUser.getSalt());
//		System.out.println("암호화"+newPwd);
		
	
		if(dbUser != null) {
			System.out.println("로그인 시작");
			
			//비밀번호를 확인하세요 있어야됨.
			
			if(dbUser.getNickName() != null) {
				jsp = "redirect:/";
			}else if(dbUser.getBusinessUserApprovalFlag() != null && dbUser.getBusinessUserApprovalFlag().equals("Y")) {
				jsp = "forward:/campBusiness/goSubMainCampBusiness"; 
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
	public String logout(HttpSession session){
		
		System.out.println("/user/logout : GET");

		if((String)session.getAttribute("kakaoToken")!=null) {
			userService.kakaoLogout((String)session.getAttribute("accessToken"));
			session.invalidate();
		}
		session.invalidate();
		
		return "redirect:/";
		
	}
		

	@RequestMapping(value = "getKakaoAuthUrl", method= RequestMethod.GET)
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request){
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=5069ddcbe63e1882c2df7cc176f1a96f"
				+ "&redirect_uri=http://localhost:8080/user/kakaoCallback"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "kakaoCallback")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Model model, HttpSession session){
		
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
        System.out.println("카카오 인포"+kakaoInfo);
        User userEmail = userService.getUser(email);
        
        if(accessToken != null) {
			session.setAttribute("kakaoToken", accessToken);
		}
        
        if(userEmail==null) {
        	  User user= new User();
              user.setId(userInfo.get("email").toString());
              user.setNickName(userInfo.get("nickname").toString());
              user.setSnsId(userInfo.get("snsId").toString());
              session.setAttribute("user", user);
              return "forward:/view/user/addKakaoUser.jsp";
        }else {
              if(email.equals(userService.getUser(email).getId())) {
	        	
	        	if(userEmail.getSnsId() != null) {
	        		session.setAttribute("user", userEmail);
	        	   return "redirect:/";
	        	} else {
	        		//우리 회원임
	        		return "redirect:/";
	        	} 	
	        } 
        }
        return "forward:/view/user/addKakaoUser.jsp";
	}
	
//	@RequestMapping(value="/kakaoLogout")
//	public String kakaoLogout(HttpSession session) {
//	userService.kakaoLogout((String)session.getAttribute("accessToken"));
//	session.invalidate();
//	return "redirect:/"; 
//	}
	
	@RequestMapping(value="addSuspensionUser", method= RequestMethod.POST)
	public String addSuspensionUser(User user) {
		System.out.println("이용정지 컨트롤러");
		System.out.println("이용정지 유저"+user);
		userService.addSuspensionUser(user);
		
		return "회원 리스트.jsp";
	}
	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		UserWrapper userWrapper=userService.listUser(search);
		
		List<User> list = userWrapper.getUsers();
		Integer totalCount = userWrapper.getTotalCount();
		
		search.setCurrentPage(1);
	 	search.setPageSize(10);
		
		userWrapper = userService.listUser(search);
		
		list = userWrapper.getUsers();
		totalCount = (Integer)userWrapper.getTotalCount();
		Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
		
		System.out.println(list);
		System.out.println(totalCount);
				
		// Model 과 View 연결
		model.addAttribute("list", list);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/view/user/listUser.jsp";
	}
	
	
	
}

