package site.gamsung.service.auction.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import site.gamsung.service.domain.AuctionProduct;

public class AuctionCrawlingTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		List<String> uri = new ArrayList<String>();
		
		for(int i=1; i<27; i++) {
			uri.add("https://www.coupang.com/np/search?q=%EC%BA%A0%ED%95%91&channel=user&component=&eventCategory=SRP&trcid=&traid=&sorter=scoreDesc&minPrice=&maxPrice=&priceRange=&filterType=&listSize=36&filter=&isPriceRange=false&brand=&offerCondition=&rating=0&page="+i+"&rocketAll=false&searchIndexingToken=1=6&backgroundColor=");
		}
		
		Document doc = null;
		
		List<AuctionProduct> list = Collections.synchronizedList(new ArrayList<AuctionProduct>());
		
		int count = 0;
		
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
			System.out.println("===========================================");
			for(int j=0; j<img.size(); j++) {
				AuctionProduct auctionProduct = new AuctionProduct();
				number ++;
				auctionProduct.setRegistrantId("user"+number+"@gamsung.com");
				auctionProduct.setProductImg1(img.get(j).attr("src"));
				auctionProduct.setAuctionProductName(name.get(j).text());
				auctionProduct.setHopefulBidPrice(hope.get(j).text());
				if(number == 5) {
					number =0;
				}
				
				synchronized (list) {
					list.add(auctionProduct);
				}
					
				count ++;
				
			}
			System.out.println("===========================================");
		
		}
		
		for(AuctionProduct auctionProduct : list) {
			System.out.println(auctionProduct);
		}
		
		System.out.println(count);
	}

}
