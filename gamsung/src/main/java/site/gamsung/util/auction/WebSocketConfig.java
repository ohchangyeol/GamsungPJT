package site.gamsung.util.auction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	
	@Autowired
	@Qualifier("webSocketInterceptor") 
	private WebSocketInterceptor webSocketInterceptor;
	 

	public WebSocketConfig() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry stompEndpointRegistry) {
		// TODO Auto-generated method stub
		stompEndpointRegistry.addEndpoint("/realtime").setAllowedOrigins("https://gamsung.site", "http://localhost:8080").withSockJS();
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry messageBrokerRegistry) {
		// TODO Auto-generated method stub

		messageBrokerRegistry.enableSimpleBroker("/queue", "/topic");
		messageBrokerRegistry.setApplicationDestinationPrefixes("/app");
	}

	
	@Override
	public void configureClientInboundChannel(ChannelRegistration registration) { // TODO Auto-generated method stub
		registration.interceptors(webSocketInterceptor);
	}
	 

}
