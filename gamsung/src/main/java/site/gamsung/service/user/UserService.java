package site.gamsung.service.user;

import site.gamsung.service.domain.User;

public interface UserService {
	
	//회원가입
	public void addUser(User user) throws Exception;
	
	// 내정보조회 / 로그인
	public User getUser(String id) throws Exception;
	
	// 회원정보수정
	public void updateUser(User user) throws Exception;

}
