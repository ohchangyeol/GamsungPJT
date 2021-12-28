package site.gamsung.util.auction;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

public class HttpHandshakeInterceptor implements HandshakeInterceptor{

	@Override
	public boolean beforeHandshake(	ServerHttpRequest request, ServerHttpResponse response, 
									WebSocketHandler wsHandler, Map<String, Object> attributes) {
		// TODO Auto-generated method stub
		
		if( request instanceof ServletServerHttpRequest) {
			System.out.println("beforeHandshake");
			ServletServerHttpRequest servletServerHttpRequest = (ServletServerHttpRequest)request;
			HttpSession session = servletServerHttpRequest.getServletRequest().getSession();
			attributes.put("session", session);
		}
		
		return true;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		// TODO Auto-generated method stub
		
	}
	

}
