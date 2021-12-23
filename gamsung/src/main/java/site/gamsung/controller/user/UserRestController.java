package site.gamsung.controller.user;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

//	@RequestMapping(value="checkEmail", method=RequestMethod.GET)
//	public 
	
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
	
	@RequestMapping(value="checkDuplication", method=RequestMethod.POST)
	public void checkDuplication(@RequestBody User user) throws Exception{
		
		userService.checkDuplication(user);
		
	}
	
	
}
