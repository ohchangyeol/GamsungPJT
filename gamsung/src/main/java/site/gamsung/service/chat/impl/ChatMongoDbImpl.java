package site.gamsung.service.chat.impl;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import site.gamsung.service.chat.ChatMongoDb;


@Repository("chatMongoDbImpl")
public class ChatMongoDbImpl implements ChatMongoDb {
	
//	@Autowired
//	@Qualifier("mongoTemplate")
//	private MongoTemplate mongoTemplate;
	
	private MongoClient mongoClient;
	private MongoDatabase database;
	private MongoCollection<Document> collection;
	
	public ChatMongoDbImpl() {
		System.out.println("@Repository 채팅DB 연결 :: " + this.getClass());
		this.mongoClient = MongoClients.create("mongodb+srv://gamsung:gam0323@cluster0.rj4km.mongodb.net/");
		this.database = mongoClient.getDatabase("message-database");
	}


	@Override
	public void addChat(int type, String sender , String receiver) throws Exception {

		// type = 1 경매
		
		collection = database.getCollection("rooms");
		
		String room =  UUID.randomUUID().toString().replace("-", "");
		
		List<String> members = new ArrayList<String>();
		members.add(sender);
		members.add(receiver);
		
		collection.insertOne(new Document().append("room", room).append("members" , members));
		
		// 방 생성 되고 메세지 전달
		
		if(type == 1) {
			collection = database.getCollection("msgs");
			
			Document innerData = new Document();
			Document data = new Document();
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();        
			String dateToStr = dateFormat.format(date);
			
			innerData.append("sender",sender);
			innerData.append("receiver",receiver);
			innerData.append("message","구매자, 판매자 연결");
			
			data.append("room", room);
			data.append("content", innerData);
			data.append("date", dateToStr );
			
			collection.insertOne(data);
			
		}
		
	}

}
