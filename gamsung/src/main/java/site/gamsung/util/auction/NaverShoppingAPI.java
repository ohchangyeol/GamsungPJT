package site.gamsung.util.auction;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.NaverProduct;

public class NaverShoppingAPI{


    public NaverProduct naverShopping(Search search) {
        String clientId = "Ux_OHaUROmZLAGeU8Bry"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "fER_OpgDVl"; //애플리케이션 클라이언트 시크릿값"


        String text = null;
        try {
            text = URLEncoder.encode("캠핑", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        int currentPage = search.getCurrentPage();
        String apiURL = "https://openapi.naver.com/v1/search/shop.json?query="+text+"&display=10&start="+currentPage+1;    // json 결과


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        
        ObjectMapper objectMapper = new ObjectMapper();
        NaverProduct naverProduct = null;
        
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = null;
        try {
			jsonObject = (JSONObject)jsonParser.parse(responseBody);
			jsonObject.remove("lastBuildDate");
			jsonObject.remove("total");
			jsonObject.remove("start");
			jsonObject.remove("display");
			
	
			
			naverProduct = objectMapper.readValue(jsonObject.toJSONString(), NaverProduct.class);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return naverProduct;
    }


    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    
    public AuctionProduct convertNaverToAuctionProduct(AuctionProduct auctionProduct) {
    	
    	int price = auctionProduct.getStartBidPrice();
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		
		auctionProduct.setHopefulBidPrice(price);
		auctionProduct.setStartBidPrice(price/2);
		auctionProduct.setBidUnit(price/10);
		
		String startDate = sdf.format(date);
		auctionProduct.setAuctionStartTime(startDate);

		cal.setTime(date);

		
		cal.add(Calendar.MINUTE, 10);
		date = cal.getTime();

		String endDate = sdf.format(date);
		auctionProduct.setAuctionEndTime(endDate);
		
    	return auctionProduct;
    }
}