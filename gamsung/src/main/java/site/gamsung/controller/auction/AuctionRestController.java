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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionRestService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionProduct;

@RequestMapping("auction/rest/*")
@RestController
public class AuctionRestController {
	
	
	@Autowired
	@Qualifier("auctionRestService")
	private AuctionRestService auctionRestService;
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
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
			map.put("isSuccess", auctionRestService.crawlingData(PATH));
			
			return map;
			
		}else {
			
			map.put("isSuccess", "크롤링 이미 실행된적 있음");
			
			return map;
		}
		
	}
	
	@RequestMapping("infiniteScroll/{page}")
	public List<AuctionProduct> InfiniteScroll(@PathVariable("page") int currentPage){
		
		Search search = new Search();
		
		search.setCurrentPage(currentPage);
		search.setOffset(auctionPageSize);
		search.setPageSize(auctionPageSize);
		
		System.out.println(search);
		
		return auctionProductService.listAuctionProduct(search);
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
	
}
