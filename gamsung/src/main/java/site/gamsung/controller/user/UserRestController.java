package site.gamsung.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import site.gamsung.service.domain.TempKey;
import site.gamsung.service.user.UserService;

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
			
		session.setAttribute("id", key);
		
		userService.sendEmailAuthNum(id, key);

	}
}
