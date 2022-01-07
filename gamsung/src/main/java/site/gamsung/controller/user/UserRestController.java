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

//	@RequestMapping(value = "rest/sendEmailAuthNum/{id:.+}", method = RequestMethod.GET)
//	public Map<String, Object> sendEmailAuthNum(@PathVariable String id, HttpSession session){
//		System.out.println("rest로 넘어오는지");
//		
//		TempKey tmp = new TempKey();
//		String key=tmp.generateKey(6);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		map.put("key", key);
//		
//		try {
//			session.setAttribute(id, key);
//			
//			userService.sendEmailAuthNum(id, key);
//			
//			System.out.println("id"+id);
//			System.out.println("mailAuthKey&&"+key);
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//			System.out.println("리턴될 키 값%%"+key);
//			return map;
//	}

	@RequestMapping(value = "rest/sendEmailAuthNum/{id:.+}", method = RequestMethod.GET)
	public String sendEmailAuthNum(@PathVariable String id, HttpSession session) {
		System.out.println("rest로 넘어오는지");

		TempKey tmp = new TempKey();
		String key = tmp.generateKey(6);

		try {
			session.setAttribute(id, key);

			userService.sendEmailAuthNum(id, key);

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

	@RequestMapping(value = "findIdPhoneAuthNum", method = RequestMethod.POST)
	public String findIdPhoneAuthNum(@RequestBody User user, Model model) {

		try {
			String userId = userService.findId(user.getName(), user.getPhone());
			if (userId == null) {
				return "redirect:./addUser";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("phone", user.getPhone());
		return "forward:./sendPhoneAuthNum";
	}

	@RequestMapping(value = "rest/checkDuplication", method = RequestMethod.POST)
	public int checkDuplication(@RequestBody User user) {
		System.out.println("1111");
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
	/*
	 * @RequestMapping(value = "rest/findId", method = RequestMethod.GET) public
	 * String findId(){ return "forward:/view/user/findIdModal.jsp"; }
	 */

	// 아이디찾기
	@RequestMapping(value = "rest/findId", method = RequestMethod.POST)
	public String findId(@RequestParam("name") String name, @RequestParam("phone") String phone) {

		System.out.println("rest실행되나");

		String id = userService.findId(name, phone);

		System.out.println(name);
		System.out.println(phone);
		System.out.println(id + "return 되나");

		return id;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "rest/findPassword", method = RequestMethod.POST)
	public int findPassword(@RequestBody User user) {

		System.out.println("rest로 넘어오나");

		
		  User newUser = userService.findPassword(user);
		  
		  if (newUser != null) 
		  {
		  userService.updateTempPassword(newUser);
		  System.out.println("여기까지 되는지");
		  return 1;
		  }else {
			  return 0;
		  }
		 
		
		/*
		 * User user = new User(); user.setId(id); user.setName(name);
		 * user.setPhone(phone);
		 */
		  
//		  User newUser=userService.findPassword(user); 

		/*
		 * if (newUser != null) { userService.updateTempPassword(newUser);
		 * System.out.println("여길타는지"); }
		 */
		 
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
	public int unlink(HttpSession session) { 
		
		System.out.println("들어오긴 하는건가");
		System.out.println("토큰"+(String)session.getAttribute("kakaoToken"));
		userService.unlink((String)session.getAttribute("kakaoToken")); 
		userService.kakaoLogout((String)session.getAttribute("kakaoToken"));
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


}
