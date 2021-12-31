package site.gamsung.controller.auction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionRestService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

@RequestMapping("auction/rest/*")
@RestController
public class AuctionRestController {
	
	
	@Autowired
	@Qualifier("auctionRestService")
	private AuctionRestService auctionRestService;
	
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
	
	@RequestMapping("crawling")
	public Map<String,String> crawlingData(HttpSession session) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		String isCrawl = (String)session.getAttribute("crawling");
		
		if(isCrawl != "true") {
			
			session.setAttribute("crawling", "true");	
					
			map.put("isCrawl", isCrawl);
			
			
			return map;
			
		}else {
			
			map.put("isSuccess", "크롤링 이미 실행된적 있음");
			
			return map;
		}
		
	}
	
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
		
	
	@MessageMapping("/join")
	@SendTo("/topic/join")
	public AuctionInfo auctionJoin(String message, AuctionInfo auctionInfo, StompHeaderAccessor stompHeaderAccessor) {
		
		List<String> list = stompHeaderAccessor.getNativeHeader("realTimeViewCount");
		for(String string : list) {
			auctionInfo.setRealTimeViewCount(Integer.parseInt(string));
		}
		
		System.out.println(auctionInfo);
		
		return auctionInfo;
	}
	
	@MessageMapping("/bid")
	@SendTo("/topic/bid")
	public AuctionInfo auctionBid(@Payload AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {
		System.out.println("입찰함");
		
		HttpSession httpSession = (HttpSession)simpMessageHeaderAccessor.getSessionAttributes().get("session");
		User user = (User)httpSession.getAttribute("user");
		
		auctionInfo.setUser(user);
		
		String info = auctionProductService.auctionProductBid(auctionInfo);
		
		int bidPrice = auctionInfo.getBidPrice();
		
		auctionInfo = auctionInfoService.getBidderRanking(auctionInfo);
		auctionInfo.setBidPrice(bidPrice);
		
		
		System.out.println(auctionInfo);
		System.out.println(info);
		auctionInfo.setInfo(info);
		
		return auctionInfo;
	}
	
	@MessageMapping("/delete")
	@SendTo("/topic/delete")
	public AuctionInfo auctionDelete(@Payload AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {
		System.out.println("중도철회");
		
		HttpSession httpSession = (HttpSession)simpMessageHeaderAccessor.getSessionAttributes().get("session");
		User user = (User)httpSession.getAttribute("user");
		
		auctionInfo.setUser(user);
		
		auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		
		auctionInfo.setInfo("해당 상품은 중도 철회 되었습니다.");
		
		return auctionInfo;
	}
	
	@MessageMapping("/exit")
	@SendTo("/topic/exit")
	public AuctionInfo exitAuction(String message, AuctionInfo auctionInfo, StompHeaderAccessor stompHeaderAccessor) {
		
		System.out.println("/topic/exit");
		List<String> list = stompHeaderAccessor.getNativeHeader("realTimeViewCount");
		for(String string : list) {
			auctionInfo.setRealTimeViewCount(Integer.parseInt(string));
		}
		
		System.out.println(auctionInfo);
		
		return auctionInfo;
	}
}
