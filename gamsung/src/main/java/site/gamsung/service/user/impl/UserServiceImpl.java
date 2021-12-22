package site.gamsung.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;
import site.gamsung.service.user.UserDAO;
import site.gamsung.service.user.UserService;
import site.gamsung.util.user.SendMail;
import site.gamsung.util.user.SendMessage;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	///Field
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO=userDAO;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		userDAO.addUser(user);
		
	}

	@Override
	public User getUser(String id) throws Exception {
		return userDAO.getUser(id);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDAO.updateUser(user);
		
	}

	@Override
	public UserWrapper listUser(Search search) throws Exception {
		
		UserWrapper userWrapper = new UserWrapper(userDAO.listUser(search), userDAO.getTotalCount(search));
				
		return userWrapper;
	}

	@Override
	public void sendEmailAuthNum(String id, String key) throws Exception {
				
		String info = "인증번호 발송";
		String text = "인증번호는"+key+"입니다.";
		SendMail mailSend = new SendMail();
		mailSend.mailSend(id, key, info, text);
	
	}

	@Override
	public void sendPhoneAuthNum(String phone, String phKey) throws Exception {
		
		String text = "[감성캠핑] 인증번호는"+phKey+"입니다.";
		SendMessage sendMessage = new SendMessage();
		sendMessage.sendMessage(phone, text);
		
		  
	}


}
