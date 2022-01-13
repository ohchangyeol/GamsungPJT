package site.gamsung.service.user.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.camp.CampReservationDAO;
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
	
	@Autowired
	@Qualifier("campReservationDAOImpl")
	private CampReservationDAO campDAO;
	
	@Autowired
	@Qualifier("auctionInfoDAO")
	private AuctionInfoDAO auctionDAO;
	
	
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO=userDAO;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user){
	
		String salt = SHA256Util.generateSalt();
		String pw = SHA256Util.getEncrypt(user.getPassword(), salt);
		
		user.setSalt(salt);
		user.setPassword(pw);
		
		userDAO.addUser(user);
		
	}

	@Override
	public User getUser(String id){
		User user = userDAO.getUser(id);
	//	user.setReportTotalCount(userDAO.countReoprt(id));
		return user;
	}

	@Override
	public void updateUser(User user){
		
		if(user.getSalt() !=null) {
		String pw = user.getPassword();
		String newPwd = SHA256Util.getEncrypt(pw, user.getSalt());
		user.setPassword(newPwd);
		}
		
		userDAO.updateUser(user);
		
	}

	@Override
	public UserWrapper listUser(Search search){
		
		UserWrapper userWrapper = new UserWrapper(userDAO.listUser(search), userDAO.getTotalCount(search));
				
		return userWrapper;
	}

	@Override
	public void sendEmailAuthNum(String id, String key){
				
		String info = "인증번호 발송";
		String text = "인증번호는"+key+"입니다.";
		SendMail sendMail = new SendMail();
		sendMail.sendMail(id, info, text);
	}

	@Override
	public void sendPhoneAuthNum(String phone, String phKey){
		
		String text = "[감성캠핑] 인증번호는"+phKey+"입니다.";
		SendMessage sendMessage = new SendMessage();
		sendMessage.sendMessage(phone, text);	  
	}

	@Override
	public void addLoginDate(User user){
		
		userDAO.addLoginDate(user);
	}

	//update와 같이 쓸 수 있는방법 생각해보기. Controller에서 처리하면 됨
	@Override
	public void approvalBusinessUser(User user){
		userDAO.updateUser(user);
		SendMail sendMail = new SendMail();
		String info = "[감성캠핑] 가입승인이 완료되었습니다.";
		String text = "안녕하세요 감성캠핑입니다. 가입승인이 완료되어 사이트 이용이 가능합니다. 감사합니다.";
		sendMail.sendMail(user.getId(), info, text);
	}


	@Override
	public int checkDuplication(User user){
		
		return userDAO.checkDuplication(user);
	}

	@Override
	public String getSaltById(String id){
		
		return userDAO.getSaltById(id);
	}

	@Override
	public void updateTempPassword(User user){
		
		TempKey tmp = new TempKey();
		String pw = tmp.generateKey(10);
		System.out.println("비밀번호"+pw);
		String newPwd = SHA256Util.getEncrypt(pw, user.getSalt());
		user.setPassword(newPwd);
		
		userDAO.updateUser(user);
		
		String info="임시비밀번호 입니다.";
		String text = "고객님의 임시 비밀번호는"+pw+"입니다."+
		"로그인 후 비밀번호를 변경해주세요.";
		
		SendMail sendMail = new SendMail();
		sendMail.sendMail(user.getId(), info, text);
	}

	@Override
	public String getAccessToken (String code) {
        String accessToken = "";
        String refreshToken = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=5069ddcbe63e1882c2df7cc176f1a96f");  				//발급받은 key
            sb.append("&redirect_uri=http://localhost:8080/user/kakaoCallback");     //설정해 놓은 경로
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            accessToken = element.getAsJsonObject().get("access_token").getAsString();
            refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + accessToken);
            System.out.println("refresh_token : " + refreshToken);

            br.close();
            bw.close();
        } catch (IOException ioe) {
            // TODO Auto-generated catch block
            ioe.printStackTrace();
        } catch(Exception e) {
        	e.printStackTrace();
        }

        return accessToken;
    }
	
	 //유저정보조회
    public HashMap<String, Object> getUserInfo (String accessToken) {

        //  요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
            String kakaoId=element.getAsJsonObject().get("id").getAsString();
            
            userInfo.put("accessToken", accessToken);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            userInfo.put("snsId", kakaoId);

        } catch (IOException ioe) {
        	
            // TODO Auto-generated catch block
            ioe.printStackTrace();
        } catch(Exception e) {
        	e.printStackTrace();
        }
        
        return userInfo;
    }

	@Override
	public String findId(String name, String phone){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("phone", phone);

		return userDAO.findId(map);
	}

	@Override
	public User findPassword(User user){
		
		User dbUser=userDAO.getUser(user.getId());
		
		System.out.println("dbUser##########"+dbUser);
		
		if(dbUser != null && !(user.getName().equals(dbUser.getName())&&user.getPhone().equals(dbUser.getPhone()))){
			return null;
		}
			System.out.println("###############user############"+user);
			return dbUser;
	}

	@Override
	public void addSuspensionUser(User user){
		
		System.out.println("이용정지 등록 서비스임쁠");
		userDAO.addSuspensionUser(user);
		
	}

	@Override
	public boolean addSecessionUser(User user){
		System.out.println("탈퇴 서비스임쁠 타는지");
		System.out.println(user);
		if(campDAO.isSecessionUserReservationCondition(user.getId())&&auctionDAO.isSecessionUserAuctionCondition(user.getId())) {
		System.out.println(campDAO.isSecessionUserReservationCondition(user.getId()));
		System.out.println(auctionDAO.isSecessionUserAuctionCondition(user.getId()));
		 userDAO.addSecessionUser(user);
		 return true;
		}else {	
		return false;
		}
	}

	@Override
	public User checkIdPassword(User user){
		
		User dbUser = userDAO.getUser(user.getId());
		if(dbUser!=null) {
			String pw = user.getPassword();
			System.out.println("비밀번호"+pw);
			System.out.println("솔트"+dbUser.getSalt());
			String newPwd = SHA256Util.getEncrypt(pw, dbUser.getSalt());
			System.out.println("암호화"+newPwd);
			System.out.println("db에서 가져온 암호"+dbUser.getPassword());
			if(newPwd.equals(dbUser.getPassword())) {
				return dbUser;
			}
			System.out.println("if문 밖에 유져"+dbUser);
		}
		
		
		return null;
	}

	@Override
	@Scheduled(cron="0 0 9 * * *")
	public void addDormantUser(){
		
		System.out.println("배치 도는지");
		List<User> list=userDAO.listUser(new Search());
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.YEAR , -1);
			cal.add(Calendar.DAY_OF_MONTH, +1);
			String TobeConvertedDate = sdf.format(cal.getTime());
			
			Calendar cal2 = Calendar.getInstance();
			cal.add(Calendar.YEAR , -1);
			cal.add(Calendar.DAY_OF_MONTH, -7);
			String SendMailConvertedDate = sdf.format(cal2.getTime());
			
			for(User user : list) {
				System.out.println("for문이 도는지");
				System.out.println(user);
				
				Date currentDate=user.getCurrentLoginRegDate();
				
				if(currentDate == null) {
					continue;
				}
					String loginDate=currentDate.toString();
					
					System.out.println("들어오나");
					if(user.getSecessionRegDate()==null&&user.getSuspensionDate()==null&&user.getDormantConversionDate()==null&&sdf.parse(SendMailConvertedDate).after(sdf.parse(loginDate))){
					SendMail mail=new SendMail();
					String info="[감성캠핑] 휴면회원 전환예정 안내메일 입니다.";
					String text ="안녕하세요 회원님! 휴면회원으로 전환되기 7일 전입니다. 휴면회원으로 전환되길 원치 않으신다면 사이트 방문 후 로그인 부탁드립니다. 감사합니다^^";
					mail.sendMail(user.getId(), info, text);
					}else if(user.getSecessionRegDate()==null&&user.getSuspensionDate()==null&&user.getDormantConversionDate()==null&&sdf.parse(TobeConvertedDate).after(sdf.parse(loginDate))) {
		            userDAO.addDormantUser(user);
		            }
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		
			return; 
		}
			
	@Override
	public void updateDormantGeneralUserConvert(String id){
		userDAO.updateDormantGeneralUserConver(id);
		
	}

	@Override
	public void kakaoLogout(String accessToken) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout"; 
		try {
			URL url = new URL(reqURL); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
			conn.setRequestMethod("POST"); 
			conn.setRequestProperty("Authorization", "Bearer " + accessToken); 
			int responseCode = conn.getResponseCode(); 
			System.out.println("responseCode : " + responseCode); 
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
			String result = ""; String line = ""; 
			while ((line = br.readLine()) != null) {
				result += line;
				} 
			System.out.println(result);
			} catch (IOException e) {
				e.printStackTrace(); 
			}
		}

	@Override
	public void unlink(String accessToken) {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		try { 
			URL url = new URL(reqURL); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
			conn.setRequestMethod("POST"); 
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String result = ""; String line = ""; 
			while ((line = br.readLine()) != null) { 
				result += line;
				}
			System.out.println(result); 
			} catch (IOException e) { 
			e.printStackTrace();
			}
	}

	@Override
	public UserWrapper reportSuspencionListUser(Search search) {
		
		UserWrapper wrapper = new UserWrapper(userDAO.reportSuspensionListUser(search), userDAO.countReportSuspensionListUser(search));
		
		return wrapper;
	}
	
	@Override
	public UserWrapper dormantListUser(Search search) {
		
		UserWrapper wrapper = new UserWrapper(userDAO.dormantListUser(search), userDAO.countDormantListUser(search));
		
		return wrapper;
	}
	
	@Override
	public UserWrapper secessionListUser(Search search) {
		
		UserWrapper wrapper = new UserWrapper(userDAO.secessionListUser(search), userDAO.countSecessionListUser(search));
		
		return wrapper;
	}

	
	}

