package site.gamsung.service.chat;

import java.util.Map;

import com.mongodb.client.MongoClient;

import site.gamsung.service.domain.ChatRoom;
import site.gamsung.service.domain.Notice;

public interface ChatMongoDb {
	
	public void addChat(int type, String sender, String receiver) throws Exception;

}
