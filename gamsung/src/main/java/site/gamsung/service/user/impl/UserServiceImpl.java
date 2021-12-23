package site.gamsung.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;
import site.gamsung.service.user.UserDAO;
import site.gamsung.service.user.UserService;
import site.gamsung.util.user.SHA256Util;
import site.gamsung.util.user.SendMail;
import site.gamsung.util.user.SendMessage;
import site.gamsung.util.user.TempKey;

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
	
		String salt = SHA256Util.generateSalt();
		String pw = SHA256Util.getEncrypt(user.getPassword(), salt);
		
		user.setSalt(salt);
		user.setPassword(pw);
		
		userDAO.addUser(user);
		
	}

	@Override
	public User getUser(String id) throws Exception {
		return userDAO.getUser(id);
	}

	@Override
	public void updateUser(User user) throws Exception {
		
		String pw = user.getPassword();
		String newPwd = SHA256Util.getEncrypt(pw, user.getSalt());
		user.setPassword(newPwd);
		
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

	@Override
	public void addLoginDate(User user) throws Exception {
		
		userDAO.addLoginDate(user);
	}

	//update와 같이 쓸 수 있는방법 생각해보기. Controller에서 처리하면 됨
	@Override
	public void approvalBusinessUser(User user) throws Exception {
		userDAO.updateUser(user);
	}


	@Override
	public String checkDuplication(User user) throws Exception {
		
		return userDAO.checkDuplication(user);
	}

	@Override
	public String getSaltById(String id) throws Exception {
		return userDAO.getSaltById(id);
	}

	@Override
	public void updateTempPassword(User user) throws Exception {
		
		TempKey tmp = new TempKey();
		String pw = tmp.generateKey(10);
		
		String newPwd = SHA256Util.getEncrypt(pw, user.getSalt());
		user.setPassword(newPwd);
		
		userDAO.updateUser(user);
		
		String info="임시비밀번호 입니다.";
		String text = "고객님의 임시 비밀번호는"+pw+"입니다."+
		"로그인 후 비밀번호를 변경해주세요.";
		
		SendMail sendMail = new SendMail();
		sendMail.mailSend(user.getId(), pw, info, text);
	}
	
	

}
