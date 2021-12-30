package site.gamsung.service.user;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;

public interface UserDAO {
	
	//INSERT
	public void addUser(User user) throws Exception;
	
	public void addLoginDate(User user) throws Exception;
	
	//SELECT ONE
	public User getUser(String id) throws Exception;
	
	//salt 값 가져오기
	public String getSaltById(String id) throws Exception;
	
	//UPDATE
	public void updateUser(User user) throws Exception;
	
	//SELECT LIST
	public List<User> listUser(Search search) throws Exception;
	
	//page 처리를 위한 전체 row return
	public int getTotalCount(Search search) throws Exception;
	
	//아이디, 닉네임, 휴대폰번호 중복체크
	public String checkDuplication(User user) throws Exception;
	
	//아이디 찾기
	public String findId(Map<String, Object> map) throws Exception;
	
	//회원 이용정지 등록
    public void addSuspensionUser(User user) throws Exception;
    
    //회원탈퇴
    public void addSecessionUser(User user) throws Exception;
    
    //회원 휴면전환
    public void addDormantUser(User user) throws Exception;
    
    //휴면회원 일반회원 전환
    public void updateDormantGeneralUserConver(String id) throws Exception;

		
}
