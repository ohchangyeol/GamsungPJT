package site.gamsung.controller.user;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import site.gamsung.service.domain.User;
import site.gamsung.service.user.UserService;
import site.gamsung.util.user.TempKey;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserRestController() {
	}
	
	@RequestMapping(value="rest/getUser")
	public String getUser(@RequestBody User user) {
		System.out.println("rest getUser");
		System.out.println(user);
		user=userService.getUser(user.getId());
		String content = user.getSuspensionContent();
		System.out.println(content);
		return content;
	}
	
	@RequestMapping(value = "rest/sendEmailAuthNum/{id:.+}", method = RequestMethod.GET)
	public String sendEmailAuthNum(@PathVariable String id, HttpSession session) {
		System.out.println("rest로 넘어오는지");

		TempKey tmp = new TempKey();
		String key = tmp.generateKey(6);
		String path=session.getServletContext().getRealPath("/");

		try {
			session.setAttribute(id, key);

			userService.sendEmailAuthNum(id, key, path);

			System.out.println("id" + id);
			System.out.println("mailAuthKey&&" + key);

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("리턴될 키 값%%" + key);
		return key;
	}

	@RequestMapping(value = "rest/sendPhoneAuthNum/{phone}", method = RequestMethod.GET)
	public String sendPhoneAuthNum(@PathVariable String phone, HttpSession session) {

		System.out.println("넘어오는가");

		Random rand = new Random();

		String numStr = "";

		for (int i = 0; i < 4; i++) {

			String num = Integer.toString(rand.nextInt(10));

			numStr += num;
		}

		session.setAttribute(phone, numStr);

		userService.sendPhoneAuthNum(phone, numStr);

		return numStr;
	}

	@RequestMapping(value = "rest/checkDuplication", method = RequestMethod.POST)
	public int checkDuplication(@RequestBody User user) {
	
		System.out.println("rest/checkDuplication 실행");
		System.out.println(user);
		int isSuccess = 0;

		int check = userService.checkDuplication(user);

		System.out.println("check" + check);
		if (check != 0) { // 중복
			isSuccess = 1;
		}
		System.out.println("str" + isSuccess);
		return isSuccess;
	}

	// 아이디찾기
	@RequestMapping(value = "rest/findId", method = RequestMethod.POST)
	public String findId(@RequestParam("name") String name, @RequestParam("phone") String phone) {

		System.out.println("rest실행되나");

		String id = userService.findId(name, phone);

		System.out.println(name);
		System.out.println(phone);
		System.out.println(id + "return 되나");

		if(id != null) {
			return id;
		}else {
			return null;
		}
		
	}

	// 비밀번호 찾기
	@RequestMapping(value = "rest/findPassword", method = RequestMethod.POST)
	public int findPassword(@RequestBody User user, HttpSession session) {

		System.out.println("rest로 넘어오나");

		
		  User newUser = userService.findPassword(user);
		  String path=session.getServletContext().getRealPath("/");
		  
		  if (newUser != null) 
		  {
		  userService.updateTempPassword(newUser, path);
		  System.out.println("여기까지 되는지");
		  return 1;
		  }else {
			  return 0;
		  }
			 
	}

	@RequestMapping(value = "rest/addSecessionUser", method = RequestMethod.POST)
	public int addSecessionUser(@RequestBody User user, HttpSession session) {
		
		System.out.println("회원탈퇴 rest");
		System.out.println("회원탈퇴 회원정보"+user);

		User dbUser = userService.checkIdPassword(user);
		
		if (dbUser != null && userService.addSecessionUser(dbUser)) {
			if(dbUser.getSnsId()!=null) {
				System.out.println("어딜 타는거지");
				//System.out.println("세션에 토큰값 없나"+session.getAttribute("kakaoToken"));
				//session.setAttribute("user", dbUser);
				return 5;
			}else {
				System.out.println("탈퇴가능");
			}
			return 0;
		}else {
			System.out.println("탈퇴불가");
			return 1 ;
		}
	}
	
	@RequestMapping(value="rest/kakaounlink") 
	public int kakaoUnlink(HttpSession session) { 
		
		System.out.println("들어오긴 하는건가");
		System.out.println("토큰"+(String)session.getAttribute("kakaoToken"));
		String kakaoToken=(String)session.getAttribute("kakaoToken");
		User kakaoUser=(User)session.getAttribute("user");
			userService.kakaoUnlink(kakaoToken); 
			userService.addSecessionUser(kakaoUser);
			//	userService.kakaoLogout(kakaoToken);
				System.out.println("카카오 토큰"+kakaoToken);
				session.invalidate();
				return 0;		
		}

	@RequestMapping(value = "rest/updateDormantGeneralUserConvert", method = RequestMethod.POST)
	public int updateDormantGeneralUserConvert(@RequestParam("id") String id, HttpSession session) {
		System.out.println("실행되는가");
		System.out.println(id);
		if(id!=null) {
			userService.updateDormantGeneralUserConvert(id);
			if(id!=null) {
				return 1;
			}
		} return 0;
		
	}
	
	@RequestMapping(value = "rest/approvalBusinessUser", method = RequestMethod.POST)
	public int approvalBusinessUser(@RequestParam("id") String id, HttpSession session) {
		System.out.println("실행되는가");
		System.out.println(id);
		String path=session.getServletContext().getRealPath("/");
		User user=userService.getUser(id);
		if(user!=null) {
			userService.approvalBusinessUser(user, path);
			if(id!=null) {
				return 1;
			}
		} return 0;
		
	}
	
	@RequestMapping(value="rest/addSuspensionUser", method= RequestMethod.POST)
	public int addSuspensionUser(@RequestBody User user) {
		
		System.out.println("이용정지 rest 컨트롤러");
		System.out.println("이용정지 유저"+user.getId());
		if(user.getId() != null && user.getId()!="") {
			userService.addSuspensionUser(user);
			return 0;
		}	
		return 1;
	}
	
	@RequestMapping(value="rest/checkIdPassword", method= RequestMethod.POST)
	public int checkIdPassword(@RequestBody User user) {
		
		System.out.println("idpwed 체크 rest 컨트롤러");
		
		if(user.getId() != null && user.getId()!="") {
			
			if(userService.checkIdPassword(user)!=null) {
				User dbUser = userService.getUser(user.getId());
				if(dbUser.getDormantConversionDate() != null) {
					System.out.println("휴면회원 아이디"+user.getId());
					System.out.println("휴면회원임");
					return 11;
				}else if(dbUser.getSecessionRegDate() != null) {
					System.out.println("탈퇴회원");
					return 12;
				}else if(dbUser.getSuspensionDate() != null) {
					System.out.println("이용정지 회원");
					return 13;
				}else if(dbUser.getCampName() != null && !(dbUser.getBusinessUserApprovalFlag().equals("Y"))) {
					return 14;
				}
				return 0;
			}
		}	
		return 1;
	}
	

}
