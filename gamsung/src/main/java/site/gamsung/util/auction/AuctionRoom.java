package site.gamsung.util.auction;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

public class AuctionRoom {
	
	private String roomId;
	private Set<String> sessions = new HashSet<>();
	
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	

	public Set<String> getSessions() {
		return sessions;
	}

	public void setSessions(Set<String> sessions) {
		this.sessions = sessions;
	}

	public static AuctionRoom create(String roomId) {
		
		AuctionRoom auctionRoom = new AuctionRoom();

		auctionRoom.roomId = roomId;
		
		return auctionRoom;
	}
	
}
