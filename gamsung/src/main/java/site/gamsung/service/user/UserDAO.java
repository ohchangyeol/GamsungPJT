package site.gamsung.service.user;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;

public interface UserDAO {
	
	//INSERT
	public void addUser(User user);
	
	public void addLoginDate(User user);
	
	//SELECT ONE
	public User getUser(String id);
	
	//salt 값 가져오기
	public String getSaltById(String id);
	
	//UPDATE
	public void updateUser(User user);
	
	//SELECT LIST
	public List<User> listUser(Search search);
	
	//휴면 리스트
	public List<User> dormantListUser(Search search);
		
	//휴면  totalcount
	public int countDormantListUser(Search search);
	
	//탈퇴 리스트
	public List<User> secessionListUser(Search search);
			
	//탈퇴  totalcount
	public int countSecessionListUser(Search search);
	
	//신고이용정지 리스트
	public List<User> reportSuspensionListUser(Search search);
	
	//신고이용정지  totalcount
	public int countReportSuspensionListUser(Search search);
	
	//page 처리를 위한 전체 row return
	public int getTotalCount(Search search);
	
	//아이디, 닉네임, 휴대폰번호, 사업자등록번호 중복체크
	public int checkDuplication(User user);
	
	//아이디 찾기
	public String findId(Map<String, Object> map);
	
	//회원 이용정지 등록
    public void addSuspensionUser(User user);
    
    //회원탈퇴
    public void addSecessionUser(User user);
    
    //회원 휴면전환
    public void addDormantUser(User user);
    
    //휴면회원 일반회원 전환
    public void updateDormantGeneralUserConver(String id);

		
}
