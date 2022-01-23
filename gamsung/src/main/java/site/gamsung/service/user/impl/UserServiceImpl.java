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
import site.gamsung.service.transfer.TransferDAO;
import site.gamsung.service.user.UserDAO;
import site.gamsung.service.user.UserService;
import site.gamsung.util.user.SHA256Util;
import site.gamsung.util.user.SendMailHtml;
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
	
	@Autowired
	@Qualifier("transferDAOImpl")
	private TransferDAO transDAO;
	
	
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
		
		userDAO.updateUser(user);
		
	}

	@Override
	public UserWrapper listUser(Search search){
		
		UserWrapper userWrapper = new UserWrapper(userDAO.listUser(search), userDAO.getTotalCount(search));
				
		return userWrapper;
	}
	
	

	@Override
	public void sendEmailAuthNum(String id, String key, String path){
				
		String info = "[감성캠핑] 인증번호 입니다.";
		String text="<img src=\"cid:image\"><div class=\"container\" style=\"width: 1008px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
        		+ "		        <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">감성캠핑</div>\r\n"
        		+ "		        <div class=\"color-text\">안녕하세요!    감성캠핑 입니다!</div>\r\n"
        		+ "		        <div>회원님이 감성캠핑에 회원가입을 하려고 합니다.</div>\r\n"
        		+ "		        <div>다음 아래 인증번호를 입력해주세요</div>\r\n"
        		+ "		        <div class=\"number\" style=\"display: inline-block; padding: 5px 10px; margin-top: 20px;border: 1px solid #ddd; border-radius: 5px;\">"+key+"</span>";
//		String text = "인증번호는"+key+"입니다.";
//		SendMail sendMail = new SendMail();
//		sendMail.sendMail(id, info, text);
		
		SendMailHtml html=new SendMailHtml();
		try {
			html.sendMailHtml(id, info, text, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendPhoneAuthNum(String phone, String phKey){
		
		String text = "[감성캠핑] 인증번호는 ["+phKey+"] 입니다.";
		
		SendMessage sendMessage = new SendMessage();
		sendMessage.sendMessage(phone, text);	  
	}

	@Override
	public void addLoginDate(User user){
		
		userDAO.addLoginDate(user);
	}

	//update와 같이 쓸 수 있는방법 생각해보기. Controller에서 처리하면 됨
	@Override
	public void approvalBusinessUser(User user, String path){
		user.setBusinessUserApprovalFlag("Y");
		userDAO.updateUser(user);
		SendMailHtml sendMail = new SendMailHtml();
		String info = "[감성캠핑] 가입승인이 완료되었습니다.";
		String text = "<img src=\\\"cid:image\\\"><div class=\"container\" style=\"width: 1008px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
				+ "    <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">감성캠핑</div>\r\n"
				+ "    <div class=\"color-text\">안녕하세요 감성캠핑입니다~</div>\r\n"
				+ "    <div>가입승인이 왼료되었습니다:)</div>\r\n"
				+ "    <div>승인이 완료되어 사이트 이용이 가능합니다 감사합니다~</div>\r\n"
				+ "    <a href=\"http://127.0.0.1:8080\"><button type=\"button\"  style=\"animation: gradient1 5s ease infinite;  background: linear-gradient(-45deg, #00ffed 0%, #00bbff 100%);  position: relative;\r\n"
				+ "    border: none;  display: inline-block;  border-radius: 15px;  font-family: 'paybooc-Light', sans-serif;  box-shadow: 0 15px 35px rgb(0 0 0 / 20%);\r\n"
				+ "    text-decoration: none;  font-weight: 600;  transition: 0.25s;  margin: 0;  padding: 0;  box-sizing: border-box;  width: 200px;  height: 70px;  font-size: 20px;\r\n"
				+ "    color: floralwhite; \"> 감성캠핑 바로가기</button></a>";
	    path="D:\\Main\\GamsungPJT\\gamsung\\src\\main\\webapp";
		try {
			sendMail.sendMailHtml(user.getId(), info, text, path);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
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
	public void updateTempPassword(User user, String path){
		
		TempKey tmp = new TempKey();
		String pw = tmp.generateKey(10);
		System.out.println("비밀번호"+pw);
		String newPwd = SHA256Util.getEncrypt(pw, user.getSalt());
		user.setPassword(newPwd);
		
		userDAO.updateUser(user);
		
		String info="[감성캠핑] 임시비밀번호 입니다.";
		
		String text="<img src=\"cid:image\"><div class=\"container\" style=\"width: 1008px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
        		+ "		        <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">감성캠핑</div>\r\n"
        		+ "		        <div class=\"color-text\">감성캠핑 입니다!</div>\r\n"
        		+ "		        <div>임시 비밀번호 입니다.</div>\r\n"
        		+ "		        <div>하단의 임시 비밀번호로 로그인 후 비밀번호를 변경해 주세요.</div>\r\n"
        		+ "		        <div class=\"number\" style=\"display: inline-block; padding: 5px 10px; margin-top: 20px;border: 1px solid #ddd; border-radius: 5px;\">"+pw+"</span>";
//		String text = "고객님의 임시 비밀번호는"+pw+"입니다."+
//		"로그인 후 비밀번호를 변경해주세요.";
		try {
			SendMailHtml sendMail = new SendMailHtml();
			sendMail.sendMailHtml(user.getId(), info, text, path);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
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
            String kakaoId=element.getAsJsonObject().get("id").getAsString();
            if(kakaoAccount.getAsJsonObject().get("email")!=null) {
            String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
            userInfo.put("email", email);
            }
            
            userInfo.put("accessToken", accessToken);
            userInfo.put("nickname", nickname);
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
		try {
			if(campDAO.isSecessionUserReservationCondition(user.getId())&&auctionDAO.isSecessionUserAuctionCondition(user.getId())&& transDAO.isSecessionTransferCondition(user.getId())) {
			System.out.println("캠핑장 예약내역 있는지"+campDAO.isSecessionUserReservationCondition(user.getId()));
			System.out.println("완료되지 않은 옥션 거래내역 있는지"+auctionDAO.isSecessionUserAuctionCondition(user.getId()));
			System.out.println("완료되지 않은 양도양수 거래내역 있는지"+transDAO.isSecessionTransferCondition(user.getId()));
			 userDAO.addSecessionUser(user);
			 return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
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
					SendMailHtml mail=new SendMailHtml();
					String info="[감성캠핑] 휴면회원 전환예정 안내메일 입니다.";
					String text ="<img src=\\\"cid:image\\\"><div class=\"container\" style=\"width: 1008px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
							+ "    <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">감성캠핑</div>\r\n"
							+ "    <div class=\"color-text\">안녕하세요 감성캠핑입니다~</div>\r\n"
							+ "    <div>정보통신망 이용촉진 및 정보보호 등에 관한 법률 제29조(개인정보의 파기)에 따라 회원님의 개인정보가 별로 분리저장되어 아이디가 7일 후 휴면계정으로 전환될 예정입니다.</div>\r\n"
							+ "    <div>휴면계정으로 전환을 원치 않으시면 7일 이내에 사이트에 방문하에 로그인 부탁드립니다~</div>\r\n"
							+ "    <a href=\"http://127.0.0.1:8080\"><button type=\"button\"  style=\"animation: gradient1 5s ease infinite;  background: linear-gradient(-45deg, #00ffed 0%, #00bbff 100%);  position: relative;\r\n"
							+ "    border: none;  display: inline-block;  border-radius: 15px;  font-family: 'paybooc-Light', sans-serif;  box-shadow: 0 15px 35px rgb(0 0 0 / 20%);\r\n"
							+ "    text-decoration: none;  font-weight: 600;  transition: 0.25s;  margin: 0;  padding: 0;  box-sizing: border-box;  width: 200px;  height: 70px;  font-size: 20px;\r\n"
							+ "    color: floralwhite; \"> 감성캠핑 바로가기</button></a>";
					String path="D:\\Main\\GamsungPJT\\gamsung\\src\\main\\webapp";
					mail.sendMailHtml(user.getId(), info, text, path);
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

	//카카오 로그아웃
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
			String result = ""; 
			String line = ""; 
			while ((line = br.readLine()) != null) {
				result += line;
				} 
			System.out.println(result);
			} catch (IOException e) {
				e.printStackTrace(); 
			}
		}

	@Override
	public void kakaoUnlink(String accessToken) {
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

