package site.gamsung.service.auction.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.auction.AuctionRestDAO;
import site.gamsung.service.auction.AuctionRestService;
import site.gamsung.service.domain.AuctionProduct;

@Service("auctionRestService")
public class AuctionRestServiceImpl implements AuctionRestService{
	
	@Autowired
	@Qualifier("auctionRestDAO")
	private AuctionRestDAO auctionRestDAO;
	
	public AuctionRestServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String coupangCrawlingData() {
		// TODO Auto-generated method stub
		
		List<String> uri = new ArrayList<String>();
		
		for(int i=1; i<27; i++) {
			uri.add("https://www.coupang.com/np/search?q=%EC%BA%A0%ED%95%91&channel=user&component=&eventCategory=SRP&trcid=&traid=&sorter=scoreDesc&minPrice=&maxPrice=&priceRange=&filterType=&listSize=36&filter=&isPriceRange=false&brand=&offerCondition=&rating=0&page="+i+"&rocketAll=false&searchIndexingToken=1=6&backgroundColor=");
		}
		
		System.out.println("uri make complete : "+uri.size());
		
		Document doc = null;
		
		List<AuctionProduct> list = new ArrayList<AuctionProduct>();
		
		for(String str : uri) {
			
			try {
				doc = Jsoup.connect(str).get();				
			
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			Elements img = doc.select(".search-product-wrap-img");
			Elements name = doc.select(".name");
			Elements hope = doc.select(".price-value");
			
			
			int number = 0;
			int tmp = 1000;
			for(int j=0; j<img.size(); j++) {
				
				AuctionProduct auctionProduct = new AuctionProduct();
				number ++;
				tmp =+ 100;
				auctionProduct.setRegistrantId("user"+number+"@gamsung.com");
				auctionProduct.setProductImg1(img.get(j).attr("src"));
				auctionProduct.setAuctionProductName(name.get(j).text());
				auctionProduct.setHopefulBidPrice(hope.get(j).text());
				auctionProduct.setStartBidPrice(tmp);
//				auctionProduct.setAuctionEndTime();
				if(number == 5) {
					number = 0;
					tmp = 1000;
				}
				
				list.add(auctionProduct);
			}
		}
		
		
		try{
						
			if(auctionRestDAO.coupangCrawlingData(list)) {
				System.out.println(list.size());
				return "크롤링 성공";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return "크롤링 중 문제 발생";
		}
		
		return "크롤링 성공";
	}

	
	
}
