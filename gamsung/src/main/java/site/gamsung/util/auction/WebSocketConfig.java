package site.gamsung.util.auction;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	public WebSocketConfig() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry stompEndpointRegistry) {
		// TODO Auto-generated method stub
		stompEndpointRegistry.addEndpoint("/realtime").withSockJS();
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry messageBrokerRegistry) {
		// TODO Auto-generated method stub
		messageBrokerRegistry
		.setApplicationDestinationPrefixes("/app")
		.enableSimpleBroker("/queue","/topic");
	}

}
