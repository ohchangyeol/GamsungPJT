package site.gamsung.util.auction;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import org.springframework.stereotype.Repository;

@Repository
public class AuctionRepository {
	
	private Map<String, AuctionRoom> auctionRoomMap;
	
	@PostConstruct
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
