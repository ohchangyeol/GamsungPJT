package site.gamsung.service.chat.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.chat.impl.ChatMongoDbImpl;
import site.gamsung.service.domain.ChatRoom;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
//										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml",
										"classpath:config/mongo-config.xml"})



public class ChatServiceTest {
	
	@Autowired
	@Qualifier("chatMongoDbImpl")
	private ChatMongoDbImpl chatMongoDbImpl;
	

	@Test
	public void addNoticeServiceTest() throws Exception {
		
		chatMongoDbImpl.addChat(1,"일반","세번째");
		
	}
}
