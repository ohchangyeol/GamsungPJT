package site.gamsung.service.user;

import java.util.HashMap;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;

public interface UserService {
	
	//회원가입
	public void addUser(User user);
	
	public void addLoginDate(User user);
	
	// 내정보조회 / 로그인
	public User getUser(String id);
	
	//아이디 비밀번호 확인
	public User checkIdPassword(User user);
	
	//salt 값 가져오기
	public String getSaltById(String id);
	
	// 회원정보수정
	public void updateUser(User user);
	
	//회원 정보 리스트
	public UserWrapper listUser(Search search);
	
	//휴면회원 리스트
	public UserWrapper dormantListUser(Search search);
	
	//탈퇴회원 리스트
	public UserWrapper secessionListUser(Search search);
	
	//신고이용정지 리스트
	public UserWrapper reportSuspencionListUser(Search search);
		
	//아이디, 닉네임, 휴대폰번호, 사업자등록번호 중복체크
	public int checkDuplication(User user);
	
	//인증메일 발송
	public void sendEmailAuthNum(String id, String key, String path);
	
	//인증문자 발송
	public void sendPhoneAuthNum(String phone, String phKey);
	
	//사업자회원 승인
	public void approvalBusinessUser(User user, String path);
	
	//임시비밀번호 발송
	public void updateTempPassword(User user, String path);
	
	//카카오 로그인 토큰 얻기
	public String getAccessToken(String code);
	
	//카카오 유저 정보 조회
	public HashMap<String, Object> getUserInfo (String accessToken);
	
	//아이디 찾기
	public String findId(String name, String phone);
	
	//비밀번호 찾기
	public User findPassword(User user);
	
	//이용정지 등록
	public void addSuspensionUser(User user);
	
	//회원탈퇴
	public boolean addSecessionUser(User user);
	
	//회원 휴면전환
	public void addDormantUser();
	
	//휴면회원 일반회원 전환
	public void updateDormantGeneralUserConvert(String id);
	
	//카카오 로그아웃
	public void kakaoLogout(String accessToken);
	
	//카카오 연결끊기
	public void kakaoUnlink(String accessToken);


}
