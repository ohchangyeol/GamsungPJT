//package site.gamsung.service.chat.impl;
//
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.UUID;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.data.mongodb.core.MongoOperations;
//import org.springframework.data.mongodb.core.MongoTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.mongodb.client.MongoClient;
//import com.mongodb.client.MongoClients;
//
//import site.gamsung.service.chat.ChatMongoDb;
//import site.gamsung.service.domain.ChatRoom;
//
//
//@Repository("chatMongoDbImpl")
//public class ChatMongoDbImpl implements ChatMongoDb {
//	
//	@Autowired
//	@Qualifier("mongoTemplate")
//	 private MongoTemplate mongoTemplate;
//	
//	
////	public void setMongoTemplate(MongoTemplate mongoTemplate) {
////		this.mongoTemplate = mongoTemplate;
////	}
//	
//	
//	public ChatMongoDbImpl() {
//		System.out.println("@Repository 채팅 연결 :: " + this.getClass());
//	}
//
//	@Override
//	public void addRoom(ChatRoom chatRoom) throws Exception {
////		 MongoOperations mongoOps = new MongoTemplate(MongoClients.create(), "message-database");
////		System.out.println(mongoOps);
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		UUID room = UUID.randomUUID();
//		
//		List<String> members = new ArrayList<String>();
//		members.add("일반");
//		members.add("니코");
//		
//		map.put("room", room);
//		map.put("members", members);
//		mongoTemplate.insert(map, "rooms");
//		
////		mongoTemplate.find(null, null);
////		System.out.println(mongoTemplate.findAll(ChatRoom.class));
//		
//
//	}
//
//	@Override
//	public void addMessage(Object input) throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//
//}
