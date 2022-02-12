package site.gamsung.service.domain;

import java.util.List;
import java.util.UUID;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class ChatRoom {
	
	@Id
	private String _id;
	
	private String room;
	private List<String> members;

	public ChatRoom() {
	}

	
	
	public ChatRoom(String room, List<String> members) {
		this.room = room;
		this.members = members;
	}



	public String getRoom() {
		return room;
	}

	public List<String> getMembers() {
		return members;
	}



	@Override
	public String toString() {
		return "ChatRoom [ _id=" + _id + "room=" + room + ", members=" + members + "]";
	}
	
	
	
}
