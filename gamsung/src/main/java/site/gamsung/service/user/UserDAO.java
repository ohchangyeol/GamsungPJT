package site.gamsung.service.user;

import site.gamsung.service.domain.User;

public interface UserDAO {
	
	//INSERT
	public void addUser(User user) throws Exception;
	
	//SELECT ONE
	public User getUser(String id) throws Exception;
	
	//UPDATE
	public void updateUser(User user) throws Exception;
	
	

}
