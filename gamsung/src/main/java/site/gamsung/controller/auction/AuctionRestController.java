package site.gamsung.controller.auction;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionRestService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;
import site.gamsung.util.auction.AuctionRepository;

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
	
	@Autowired
	@Qualifier("auctionRepository")
	private AuctionRepository auctionRepository;
	
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
	
	@RequestMapping("infiniteScroll")
	public synchronized List<AuctionProduct> InfiniteScroll(@RequestBody Search search){
	
		search.setOffset(auctionPageSize);
		search.setPageSize(auctionPageSize);
		
		return auctionProductService.listCrawlingAuctionProduct(search);
	}
	
	@RequestMapping("previewAuctionProductImageFile")
	public String previewAuctionProductImageFile(@RequestParam(value = "fileUpload", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().isEmpty()) {
			try {
				
				file.transferTo(new File(PATH, file.getOriginalFilename()));
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return file.getOriginalFilename();
		
	}
	
	@RequestMapping("getBidderRanking")
	public AuctionInfo getBidderRanking(@RequestBody AuctionInfo auctionInfo, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		return auctionInfoService.getBidderRanking(auctionInfo);
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
