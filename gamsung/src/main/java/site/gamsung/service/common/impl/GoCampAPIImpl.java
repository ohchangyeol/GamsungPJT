package site.gamsung.service.common.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.campbusiness.CampBusinessDAO;
import site.gamsung.service.common.GoCampAPI;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.User;
import site.gamsung.service.user.UserDAO;

@Service("GoCampAPI")
public class GoCampAPIImpl implements GoCampAPI{
	
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	
	@Autowired
	@Qualifier("campBusinessDAOImpl")
	private CampBusinessDAO campBusinessDAO;
	
	public GoCampAPIImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addData() throws Exception{
		// TODO Auto-generated method stub
		// y좌표
				String[] listy = new String[9];
				listy[0] = "37.54952712111832"; // 서울
				listy[1] = "37.82832050740937"; // 강원도
				listy[2] = "35.82287536854721"; // 경상북도
				listy[3] = "35.463480822772475"; // 경상남도
				listy[4] = "35.83564585017946"; // 전라북도
				listy[5] = "35.16094979867836"; // 전라남도
				listy[6] = "37.00588380261841"; // 충청북도
				listy[7] = "36.33343217007672"; // 충청남도
				listy[8] = "33.38432712814269"; // 제주도

				// x좌표
				String[] listx = new String[9];
				listx[0] = "127.00343545409437"; // 서울
				listx[1] = "128.14326692723978"; // 강원도
				listx[2] = "128.56898709902947"; // 경상북도
				listx[3] = "128.2169227149006"; // 경상남도
				listx[4] = "127.10868397321649"; // 전라북도
				listx[5] = "126.81666787418474"; // 전라남도
				listx[6] = "127.71343188145346"; // 충청북도
				listx[7] = "127.39345003114697"; // 충청남도
				listx[8] = "126.5534206694416"; // 제주도
				
				StringBuilder urlBuilder = null;
				URL url = null;
				JSONObject jsonObject = null;
				
				ArrayList<JSONArray> jsonList = new ArrayList<JSONArray>();
				
				for(int i = 0; i<listx.length; i++) {

					urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/locationBasedList"); /* URL */
					urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=NL6p1g6TiGQu2oAQK2nasxe7gF5HRfB%2FpF45NK%2FduGCKp%2BlFwaz07E1j6DoRoDJTNv8uCduj6LhOJtfE9dKFyA%3D%3D");
					urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 현재 페이지번호 */
					urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="+ URLEncoder.encode("3", "UTF-8")); /* 한 페이지 결과 수 */
					urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /* IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC */
					urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
					urlBuilder.append("&" + URLEncoder.encode("radius", "UTF-8") + "=" + URLEncoder.encode("20000", "UTF-8")); /* 거리 반경(단위:m) Max값 20000m=20km */
					urlBuilder.append("&" + URLEncoder.encode("mapX", "UTF-8") + "=" + URLEncoder.encode(listx[i], "UTF-8")); /* GPS X좌표(WGS84 경도 좌표) */
					urlBuilder.append("&" + URLEncoder.encode("mapY", "UTF-8") + "=" + URLEncoder.encode(listy[i], "UTF-8")); /* GPS Y좌표(WGS84 위도 좌표) */
					
					url = new URL(urlBuilder.toString());
					HttpURLConnection conn = (HttpURLConnection) url.openConnection();
					conn.setRequestMethod("GET");
					conn.setRequestProperty("Accept", "application/json");
					conn.setRequestProperty("Content-type", "application/json");
				
					BufferedReader rd;
					if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
						rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					} else {
						rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
					}
					StringBuilder sb = new StringBuilder();
					String line;
					
					while ((line = rd.readLine()) != null) {
						sb.append(line);
					}
					rd.close();
					conn.disconnect();
					
					JSONParser jsonParser = new JSONParser();
					
					jsonObject = (JSONObject) jsonParser.parse(sb.toString());
					jsonObject = (JSONObject) jsonObject.get("response");
					jsonObject = (JSONObject) jsonObject.get("body");
					jsonObject = (JSONObject) jsonObject.get("items");
					JSONArray jsonArray = (JSONArray) jsonObject.get("item");
					
					jsonList.add(jsonArray);
					
				}
				
				JSONArray jsonArray = null;
				
				ArrayList<User> users = new ArrayList<User>();
				ArrayList<Camp> camps = new ArrayList<Camp>();
				
				User user = null;
				Camp camp = null;
				
				System.out.println(jsonList.get(0).get(0));
				
				String firstE = "";
				String lastE = "@gamsung.site";
				
					
				for(int k=0; k<jsonList.size(); k++) {
					firstE = "camp"+k;
					jsonArray = jsonList.get(k);
					for(int j=0; j<jsonArray.size(); j++) {
						jsonObject = (JSONObject) jsonArray.get(j);
						
						user = new User();
						user.setId(firstE+j+lastE);
						user.setPassword(firstE+j);
						user.setRole("BUSINESS");
						
						if(jsonObject.get("facltNm") != null) {
							user.setCampName(jsonObject.get("facltNm").toString());					
							user.setName(jsonObject.get("facltNm").toString());
						}else {
							user.setCampName(firstE+j);
							user.setName(firstE+j);
						}
						
						if(jsonObject.get("tel") != null) {
							user.setCampCall(jsonObject.get("tel").toString().replaceAll("-", ""));	
							user.setPhone(jsonObject.get("tel").toString().replaceAll("-", ""));
						}else {
							user.setCampCall("0212345678");
							user.setPhone("0212345678");
						}
						
						if(jsonObject.get("bizrno") != null) {
							user.setcampBusinessNum(jsonObject.get("bizrno").toString().replaceAll("-", ""));					
						}else {
							user.setcampBusinessNum("1234567890");
						}
						
						if(jsonObject.get("addr1") == null) {
							user.setAddr("서울시 비트캠프");
						}else if(jsonObject.get("addr2") == null){
							user.setAddr(jsonObject.get("addr1").toString());
						}else {
							user.setAddr(jsonObject.get("addr1").toString()+jsonObject.get("addr2").toString());
						}
						
						users.add(user);
						
						camp = new Camp();
						
						camp.setUser(user);
			
						
						if(jsonObject.get("lineIntro") != null) {
							camp.setCampSummery(jsonObject.get("lineIntro").toString());				
						}else {
							camp.setCampSummery("편리하고 안락한 캠핑장입니다.");
						}
						
						if(jsonObject.get("intro") != null) {
							camp.setCampDetail(jsonObject.get("intro").toString());					
						}else {
							camp.setCampDetail("즐거운 캠핑되세요.");
						}
						
						LocalDate now = LocalDate.now();
						java.sql.Date date = java.sql.Date.valueOf(now);
						camp.setCampRegDate(date);
						camp.setCampTheme1("가을");
						camp.setCampTheme2("일출");
						camp.setCampNature1("호수");
						camp.setCampNature2("도시");
						camp.setCampOperation1("상시");
						camp.setCampOperation2("여름");
						
						camp.setCampMapImg("map1.jpg");
						camp.setCampImg1("img1.jpg");
						camp.setCampImg2("img2.jpg");
						camp.setCampImg3("img3.jpg");
						camp.setCampImg4("img4.jpg");
						camp.setCampImg5("img5.jpg");
						
						camps.add(camp);
						
					}
				}

		         
		         for(int k=0; k<users.size(); k++) {
		        	 userDAO.addUser(users.get(k));
		        	 campBusinessDAO.addCamp(camps.get(k));
		         }
	}
	
	
}
