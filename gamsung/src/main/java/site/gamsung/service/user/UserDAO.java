package site.gamsung.service.user;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;

public interface UserDAO {
	
	//INSERT
	public void addUser(User user) throws Exception;
	
	//SELECT ONE
	public User getUser(String id) throws Exception;
	
	//UPDATE
	public void updateUser(User user) throws Exception;
	
	//SELECT LIST
	public List<User> listUser(Search search) throws Exception;
	
	//page 처리를 위한 전체 row return
	public int getTotalCount(Search search) throws Exception;
	
	//아이디 중복체크
	public int checkEmail(String id) throws Exception;
	
	//닉네임 중복체크
	public int checkNickName(String nickName) throws Exception;
	
}
