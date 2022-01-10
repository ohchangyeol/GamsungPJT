package site.gamsung.util.auction;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;

@Configuration
public class WebSocketInterceptor implements ChannelInterceptor{

	Map<String,Set<String>> sessionMap = new HashMap<String,Set<String>>();

	@SuppressWarnings("incomplete-switch")
	@Override
	public Message<?> preSend(Message<?> message, MessageChannel channel) {
		// TODO Auto-generated method stub
		
		StompHeaderAccessor stompHeaderAccessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class); 
		Set<String> sessionSet = null;
		String sessionId = stompHeaderAccessor.getSessionId();
		
		switch(stompHeaderAccessor.getCommand()) {
		
		case CONNECT:
//			System.out.println("==============================================================");
//			System.out.println("getAck : "+stompHeaderAccessor.getAck());
//			System.out.println("getDestination : "+stompHeaderAccessor.getDestination());
//			System.out.println("getHost : "+stompHeaderAccessor.getHost());
//			System.out.println("getLogin : "+stompHeaderAccessor.getLogin());
//			System.out.println("getMessage : "+stompHeaderAccessor.getMessage());
//			System.out.println("getMessageId : "+stompHeaderAccessor.getMessageId());
//			System.out.println("getNack : "+stompHeaderAccessor.getNack());
//			System.out.println("getPasscode : "+stompHeaderAccessor.getPasscode());
//			System.out.println("getReceipt : "+stompHeaderAccessor.getReceipt());
//			System.out.println("getReceiptId : "+stompHeaderAccessor.getReceiptId());
//			System.out.println("getReplyChannel : "+stompHeaderAccessor.getReplyChannel());
//			System.out.println("getSessionId : "+stompHeaderAccessor.getSessionId());
//			System.out.println("getSubscriptionId : "+stompHeaderAccessor.getSubscriptionId());
//			System.out.println("getVersion : "+stompHeaderAccessor.getVersion());
//			System.out.println("getAcceptVersion : "+stompHeaderAccessor.getAcceptVersion());
//			System.out.println("getCommand : "+stompHeaderAccessor.getCommand());
//			System.out.println("getContentLength : "+stompHeaderAccessor.getContentLength());
//			System.out.println("getContentType : "+stompHeaderAccessor.getContentType());
//			System.out.println("getHeartbeat : "+stompHeaderAccessor.getHeartbeat());
//			System.out.println("getId : "+stompHeaderAccessor.getId());
//			System.out.println("getMessageHeaders : "+stompHeaderAccessor.getMessageHeaders());
//			System.out.println("getMessageType : "+stompHeaderAccessor.getMessageType());
//			System.out.println("getSessionAttributes : "+stompHeaderAccessor.getSessionAttributes());
//			System.out.println("getTimestamp : "+stompHeaderAccessor.getTimestamp());
//			System.out.println("getUser : "+stompHeaderAccessor.getUser());
//			System.out.println("==============================================================");
			break;
		
		case SEND:
			if(stompHeaderAccessor.getDestination().indexOf("/app/join") != -1) {

				String[] no = stompHeaderAccessor.getDestination().split("/");
				
				sessionSet = sessionMap.get(no[3]);
				
				if(sessionSet == null) {
					
					sessionSet = new HashSet<String>();

				}
				sessionSet.add(sessionId);
				
				sessionMap.put(no[3], sessionSet);
				stompHeaderAccessor.addNativeHeader("realTimeViewCount", Integer.toString(sessionSet.size()));		
				
			}else if(stompHeaderAccessor.getDestination().indexOf("/app/exit") != -1) {
				
				String[] no = stompHeaderAccessor.getDestination().split("/");
				
				System.out.println("before : "+sessionSet);
				sessionSet = sessionMap.get(no[3]);
				System.out.println("after : "+sessionSet);
				
				if(sessionSet == null) {

					sessionSet = new HashSet<String>();

				}
				sessionSet.remove(sessionId);
				
				sessionMap.put(no[3], sessionSet);
				stompHeaderAccessor.addNativeHeader("realTimeViewCount", Integer.toString(sessionSet.size()));				
			}
		break;
		
		case DISCONNECT:
//			System.out.println("==============================================================");
//			System.out.println("getAck : "+stompHeaderAccessor.getAck());
//			System.out.println("getDestination : "+stompHeaderAccessor.getDestination());
//			System.out.println("getHost : "+stompHeaderAccessor.getHost());
//			System.out.println("getLogin : "+stompHeaderAccessor.getLogin());
//			System.out.println("getMessage : "+stompHeaderAccessor.getMessage());
//			System.out.println("getMessageId : "+stompHeaderAccessor.getMessageId());
//			System.out.println("getNack : "+stompHeaderAccessor.getNack());
//			System.out.println("getPasscode : "+stompHeaderAccessor.getPasscode());
//			System.out.println("getReceipt : "+stompHeaderAccessor.getReceipt());
//			System.out.println("getReceiptId : "+stompHeaderAccessor.getReceiptId());
//			System.out.println("getReplyChannel : "+stompHeaderAccessor.getReplyChannel());
//			System.out.println("getSessionId : "+stompHeaderAccessor.getSessionId());
//			System.out.println("getSubscriptionId : "+stompHeaderAccessor.getSubscriptionId());
//			System.out.println("getVersion : "+stompHeaderAccessor.getVersion());
//			System.out.println("getAcceptVersion : "+stompHeaderAccessor.getAcceptVersion());
//			System.out.println("getCommand : "+stompHeaderAccessor.getCommand());
//			System.out.println("getContentLength : "+stompHeaderAccessor.getContentLength());
//			System.out.println("getContentType : "+stompHeaderAccessor.getContentType());
//			System.out.println("getHeartbeat : "+stompHeaderAccessor.getHeartbeat());
//			System.out.println("getId : "+stompHeaderAccessor.getId());
//			System.out.println("getMessageHeaders : "+stompHeaderAccessor.getMessageHeaders());
//			System.out.println("getMessageType : "+stompHeaderAccessor.getMessageType());
//			System.out.println("getSessionAttributes : "+stompHeaderAccessor.getSessionAttributes());
//			System.out.println("getTimestamp : "+stompHeaderAccessor.getTimestamp());
//			System.out.println("getUser : "+stompHeaderAccessor.getUser());
			
			break;
		}
		
		
		
		return message;

	}
 
}
