package site.gamsung.util.user;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SendMessage {
	
	public void sendMessage() {}
	
	 public void sendMessage(String phone, String text) {
		    
		 	String api_key = "NCSEPG6DZGAOTFNJ";
		    String api_secret = "CRJKZH5PM5QCNZ6N9RR7RAFOT81TDCMO";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", phone);
			 
			params.put("from", "010-4515-2520");
			params.put("type", "SMS");
			params.put("text", text);
			params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException ce) {
		      System.out.println(ce.getMessage());
		      System.out.println(ce.getCode());
		      ce.printStackTrace();
		    } catch(Exception e) {
		    	e.printStackTrace();	    }
		  }
		

}
