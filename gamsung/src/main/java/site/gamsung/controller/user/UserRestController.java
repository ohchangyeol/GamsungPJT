package site.gamsung.controller.user;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
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
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserRestController() {}

	
	//@RequestMapping(value = "json/sendEmailAuthNum/{inputEmail:.+}", method = RequestMethod.GET)
	@RequestMapping(value="sendEmailAuthNum", method=RequestMethod.GET)
	public void sendEmailAuthNum(@RequestParam("id") String id, HttpSession session) throws Exception{
		
		TempKey tmp = new TempKey();
		String key=tmp.generateKey(6);
			
		session.setAttribute(id, key);
		
		userService.sendEmailAuthNum(id, key);

	}
	
	@RequestMapping(value="sendPhoneAuthNum", method=RequestMethod.POST)
	public void sendPhoneAuthNum(@RequestParam("phone") String phone, HttpSession session) throws Exception{
		
		Random rand  = new Random();
        
        String numStr = "";
        
        for(int i=0; i<4; i++) {
        	
            String num = Integer.toString(rand.nextInt(10));
            
            numStr += num;
        }	  
        
        session.setAttribute(phone, numStr);
        
        userService.sendPhoneAuthNum(phone, numStr);
	}
	
	@RequestMapping(value="findIdPhoneAuthNum", method=RequestMethod.POST)
	public String findIdPhoneAuthNum(@RequestBody User user, Model model) throws Exception{
	
		String userId=userService.findId(user.getName(), user.getPhone());
		if(userId == null) {
			return "redirect:./addUser";
			}
		model.addAttribute("phone", user.getPhone());
		return "forward:./sendPhoneAuthNum";
	}	
		
	
	@RequestMapping(value="checkDuplication", method=RequestMethod.POST)
	public void checkDuplication(@RequestBody User user) throws Exception{
		
		userService.checkDuplication(user);
		
	}
	
	//아이디찾기
	@RequestMapping(value="findId")
	public String findId(String name, String phone) throws Exception{
		
		String id = userService.findId(name, phone);
				
		return id;
	}
	
	//비밀번호 찾기
	@RequestMapping(value="findPassword")
	public void findPassword(@RequestBody User user) throws Exception{
		User newUser = userService.findPassword(user);
		if(newUser != null) {
			userService.updateTempPassword(user);
		}
	}
	
	@RequestMapping(value="addSecessionUser")
	public String addSecessionUser(@RequestBody User user) throws Exception{

		user = userService.checkIdPassword(user);
		if(user != null && userService.addSecessionUser(user)) {
			
			return "탈퇴";		
		}
		return "탈퇴안됨";
	}
	
	@RequestMapping(value="updateDormantGeneralUserConvert", method=RequestMethod.GET)
	public void updateDormantGeneralUserConvert(HttpSession session) throws Exception{
		userService.updateDormantGeneralUserConvert(session.getId());
	}
	
	
}
