package site.gamsung.controller.auction;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;

@RestController
public class AuctionInfoController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	public AuctionInfoController() {
		System.out.println(this.getClass());
	}
	Map<String,Object> product = null;
	
	@MessageMapping("/join")
	@SendTo("/topic/join")
	public Map<String,Object> auctionJoin(AuctionProduct auctionProduct) {
		System.out.println("접속함");
		
		return product;
	}
	
	@MessageMapping("/bid")
	@SendTo("/topic/bid")
	public AuctionInfo auctionBid(AuctionInfo auctionInfo) {
		System.out.println("입찰함 ");
		
		auctionProductService.auctionProductBid(auctionInfo);
		return auctionInfo;
	}

}

