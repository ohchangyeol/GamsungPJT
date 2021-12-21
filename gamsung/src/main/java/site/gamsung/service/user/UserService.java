package site.gamsung.service.user;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;

public interface UserService {
	
	//회원가입
	public void addUser(User user) throws Exception;
	
	// 내정보조회 / 로그인
	public User getUser(String id) throws Exception;
	
	// 회원정보수정
	public void updateUser(User user) throws Exception;
	
	//회원 정보 리스트
	public UserWrapper listUser(Search search) throws Exception;
	
	//메일인증
	public void sendEmailAuthNum(String id, String key) throws Exception;
	

}
