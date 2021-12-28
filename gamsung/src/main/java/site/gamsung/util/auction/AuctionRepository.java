package site.gamsung.util.auction;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class AuctionRepository {
	
	private Map<String, AuctionRoom> auctionRoomMap;
	
	private void init() {
		auctionRoomMap = new LinkedHashMap<String, AuctionRoom>();
	}
	
	public AuctionRoom getRoom(String roomId) {
		return auctionRoomMap.get(roomId);
	}
	
	public AuctionRoom createAuctionRoom(String name) {
		AuctionRoom auctionRoom = AuctionRoom.create(name);
		auctionRoomMap.put(auctionRoom.getRoomId(), auctionRoom);
		return auctionRoom;
	}
}
