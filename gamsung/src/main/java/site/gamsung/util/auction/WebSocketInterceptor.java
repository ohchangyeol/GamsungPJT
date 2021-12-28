package site.gamsung.util.auction;

import java.util.HashSet;
import java.util.Set;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;

@Configuration
public class WebSocketInterceptor implements ChannelInterceptor{

	Set<String> sessionSet = new HashSet<>();

	@Override
	public Message<?> preSend(Message<?> message, MessageChannel channel) {
		// TODO Auto-generated method stub
		
		String str = new String((byte[])message.getPayload());
		StompHeaderAccessor stompHeaderAccessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
		String sessionId = stompHeaderAccessor.getSessionId();        
		System.out.println(stompHeaderAccessor.getCommand()+" : "+str);
        
        switch (stompHeaderAccessor.getCommand()) {
            case CONNECT: // 유저가 Websocket으로 connect()를 한 뒤 호출됨
            	sessionSet.add(sessionId); 
                break;
            case DISCONNECT:// 유저가 Websocket으로 disconnect() 를 한 뒤 호출됨 or 세션이 끊어졌을 때 발생함(페이지 이동~ 브라우저 닫기 등)
            	sessionSet.remove(sessionId);
            	break;
            default:
                break;
        }
       		
        int realTimeViewCount = sessionSet.size();
        System.out.println(realTimeViewCount);
        
        stompHeaderAccessor.addNativeHeader("realTimeViewCount", Integer.toString(realTimeViewCount));
        System.out.println(message);
        System.out.println(stompHeaderAccessor);
        System.out.println(stompHeaderAccessor.getDestination());
        
		return message;

	}
 
}
