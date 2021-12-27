package site.gamsung.util.auction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import site.gamsung.service.domain.User;

public class WebSocketHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		String senderId = getId(session);
		
		/*
		 * for(WebSocketSession sess : sessions) { sess.sendMessage(new
		 * TextMessage(senderId+" : "+message.getPayload())); }
		 */
		//protocol : command, 입찰자, 등록자, no (reply, user2, user1, PROD00001) 
		
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 4) {
				String cmd = strs[0];
				String bidder = strs[1];
				String register = strs[2];
				String no = strs[4];
				
				WebSocketSession registerSession = userSessions.get(register);
				if("reply".equals(cmd) && registerSession != null) {
					TextMessage tmpMsg = new TextMessage(bidder+"님이"+no+"번 상품을 입찰하였습니다.");
					registerSession.sendMessage(tmpMsg);
				}
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	private String getId(WebSocketSession session) {
		
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User)httpSession.get("user");
		
		if(loginUser == null) {
			return session.getId();
		}else {
			return loginUser.getId();
		}
	}
	

}
