package site.gamsung.controller.auction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import site.gamsung.service.auction.AuctionRestService;
import site.gamsung.service.domain.AuctionProduct;

@RequestMapping("auction/rest/*")
@RestController
public class AuctionRestController {
	
	
	@Autowired
	@Qualifier("auctionRestService")
	private AuctionRestService auctionRestService;
	
	@RequestMapping("crawling")
	public Map<String,String> coupangCrawlingData(HttpSession session) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		String isCrawl = (String)session.getAttribute("crawling");
		
		if(isCrawl != "true") {
			
			session.setAttribute("crawling", "true");	
					
			map.put("isCrawl", isCrawl);
			map.put("isSuccess", auctionRestService.coupangCrawlingData());
			
			return map;
		}else {
			
			map.put("isSuccess", "크롤링 이미 실행된적 있음");
			
			return map;
		}
		
	}
	
	@RequestMapping("InfiniteScroll")
	public List<AuctionProduct> InfiniteScroll(){
		
		
		
		return null;
	}
	
}
