package site.gamsung.controller.auction;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

@RequestMapping("auction/rest/*")
@RestController
public class AuctionRestController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	@Autowired
	@Qualifier("auctionInfoService")
	private AuctionInfoService auctionInfoService;
	
	@Value("#{commonProperties['auctionPageSize']}")
	int auctionPageSize;
	
	@Value("#{commonProperties['path']}")
	private String PATH;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@PostMapping("infiniteScroll")
	public synchronized List<AuctionProduct> InfiniteScroll(@RequestBody Search search){
	
		search.setOffset(auctionPageSize);
		search.setPageSize(auctionPageSize);
		
		return auctionProductService.listCrawlingAuctionProduct(search);
	}
	
	
	@PostMapping("getBidderRanking")
	public AuctionInfo getBidderRanking(@RequestBody AuctionInfo auctionInfo, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		return auctionInfoService.getBidderRanking(auctionInfo);
	}
	
	@GetMapping(value = "updateAuctionStatus/{auctionProductNo}/{status}")
	public AuctionInfo updateAuctionStatus(	@PathVariable("auctionProductNo") String auctionProductNo,
											@PathVariable("status") String status) {
			
		 return auctionProductService.deleteAuctionProduct(auctionProductNo,status);
		
	}
	
	@GetMapping(value = "updateBidEndTime/{auctionProductNo}")
	public AuctionInfo updateBidEndTime(@PathVariable("auctionProductNo") String auctionProductNo) {
		
		return auctionProductService.updateBidEndTime(auctionProductNo);
	}
	
	@MessageMapping("/join/{auctionProductNo}")
	public void auctionJoin(AuctionInfo auctionInfo, StompHeaderAccessor stompHeaderAccessor) {
		
		List<String> list = stompHeaderAccessor.getNativeHeader("realTimeViewCount");
		for(String string : list) {
			auctionInfo.setRealTimeViewCount(Integer.parseInt(string));
		}
		
		simpMessagingTemplate.convertAndSend("/topic/join/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
	
	@MessageMapping("/bid/{auctionProductNo}")
	public void auctionBid(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {

		HttpSession httpSession = (HttpSession)simpMessageHeaderAccessor.getSessionAttributes().get("session");
		User user = (User)httpSession.getAttribute("user");
		
		auctionInfo.setUser(user);
		
		String info = auctionProductService.auctionProductBid(auctionInfo);
		int bidPrice = auctionInfo.getBidPrice();
		
		auctionInfo = auctionInfoService.getBidderRanking(auctionInfo);
		
		auctionInfo.setBidPrice(bidPrice);
		auctionInfo.setInfo(info);
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		auctionInfo.setBidDateTime(auctionProduct.getAuctionEndTime());
		
		simpMessagingTemplate.convertAndSend("/topic/bid/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
	
	@MessageMapping("/update/{auctionProductNo}")
	public void auctionUpdate(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		simpMessagingTemplate.convertAndSend("/topic/update/"+auctionInfo.getAuctionProductNo(), auctionProduct);
		
	}
	
	@MessageMapping("/delete/{auctionProductNo}")
	public void auctionDelete(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {
		System.out.println("중도철회");
		
		HttpSession httpSession = (HttpSession)simpMessageHeaderAccessor.getSessionAttributes().get("session");
		User user = (User)httpSession.getAttribute("user");
		
		auctionInfo.setUser(user);
		
		auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		
		auctionInfo.setInfo("해당 상품은 중도 철회 되었습니다.");
		
		simpMessagingTemplate.convertAndSend("/topic/delete/"+auctionInfo.getAuctionProductNo(),auctionInfo);

	}
	
	@MessageMapping("/exit/{auctionProductNo}")
	public void exitAuction(AuctionInfo auctionInfo, StompHeaderAccessor stompHeaderAccessor) {
		
		System.out.println("/topic/exit");
		List<String> list = stompHeaderAccessor.getNativeHeader("realTimeViewCount");
		for(String string : list) {
			auctionInfo.setRealTimeViewCount(Integer.parseInt(string));
		}
		
		simpMessagingTemplate.convertAndSend("/topic/exit/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
}
