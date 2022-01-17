package site.gamsung.util.auction;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Value;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionProduct;

public class CrawlingData {
	
	@Value("#{auctionProperties['coupang']}")
	String coupang;
	
	@Value("#{auctionProperties['coupangDetail']}")
	String coupangDetail;

	public CrawlingData() {
		// TODO Auto-generated constructor stub
	}
	
	public synchronized List<AuctionProduct> crawlingList(Search search){
		
		
		int page = search.getCurrentPage()/4;
		int unit = search.getCurrentPage()%4;
		
		if(unit==0){
			page --;
			unit= 4;
		}
		
		String url = coupang+(page+1);
				
		Document doc = null;
		String detail = null;
		String img = null;
		String name = null;
		
		String[] hashtags = null;

		AuctionProduct auctionProduct = null;
		
		List<AuctionProduct> list = Collections.synchronizedList(new ArrayList<AuctionProduct>());

		try {
			doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36")
					.header("scheme", "https")
		            .header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")
		            .header("accept-encoding", "gzip, deflate, br")
		            .header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7,es;q=0.6")
		            .header("cache-control", "no-cache")
		            .header("pragma", "no-cache")
		            .header("upgrade-insecure-requests", "1")
					.get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements prodList = doc.select("#productList");
		Elements prodTag = prodList.select(".search-product-link");
		Elements imgTag = prodList.select(".search-product-wrap-img");
		Elements nameTag = doc.select(".name");
		
		System.out.println("unit : "+unit);

		for (int j = 8*(unit-1); j < 8*(unit) ; j++) {

			auctionProduct = new AuctionProduct();
			
			detail = prodTag.get(j).attr("href");
			img = imgTag.get(j).attr("data-img-src");
			if(img != null && img.equals("")) {
				img = imgTag.get(j).attr("src");
			}
			name = nameTag.get(j).text();
			
			auctionProduct.setProductImg1(img);
			auctionProduct.setAuctionProductName(name);
			auctionProduct.setAuctionProductSubDetail(detail);

			hashtags = name.split(" ");

			if (hashtags.length == 1) {

				auctionProduct.setHashtag1("#" + hashtags[0]);

			} else if (hashtags.length == 2) {

				auctionProduct.setHashtag1("#" + hashtags[0]);
				auctionProduct.setHashtag2("#" + hashtags[1]);

			} else if (hashtags.length > 2) {

				auctionProduct.setHashtag1("#" + hashtags[0]);
				auctionProduct.setHashtag2("#" + hashtags[1]);
				auctionProduct.setHashtag3("#" + hashtags[2]);

			}
			
			System.out.println(auctionProduct);
			
			list.add(auctionProduct);

		}
		
		return list;
	}
	
	public synchronized AuctionProduct crawling(AuctionProduct auctionProduct){
		
		String url = coupangDetail+auctionProduct.getAuctionProductSubDetail();
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();

		try {
			Document doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36")
												.header("scheme", "https")
									            .header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")
									            .header("accept-encoding", "gzip, deflate, br")
									            .header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7,es;q=0.6")
									            .header("cache-control", "no-cache")
									            .header("pragma", "no-cache")
									            .header("upgrade-insecure-requests", "1")
												.get();

					Elements photos = doc.select(".lazy-load-img");
					
					for(int j=0; j<photos.size(); j++) {
						
				
						auctionProduct.setProductImg1(doc.select(".prod-image__detail").get(0).attr("data-preload-img-src"));
						
						switch (j) {
						case 1:
							auctionProduct.setProductImg2(photos.get(j).attr("data-src"));
							break;
						case 2:
							auctionProduct.setProductImg3(photos.get(j).attr("data-src"));
							break;
						case 3:
							auctionProduct.setProductImg4(photos.get(j).attr("data-src"));
							break;
						case 4:
							auctionProduct.setProductImg5(photos.get(j).attr("data-src"));
							break;
						}
					}
					System.out.println(doc.select(".total-price").text());
					String price = doc.select(".total-price").text().replaceAll(",","").replaceAll("원","").trim();
					int intPrice = 0;
					
					if(price.indexOf(" ") != -1) {
						String[] str = price.split(" ");
						intPrice = Integer.parseInt(str[0]);
					}else {
						intPrice = Integer.parseInt(price);
						
					}
					auctionProduct.setHopefulBidPrice(intPrice);
					auctionProduct.setStartBidPrice(intPrice/2);
					auctionProduct.setBidUnit(intPrice/10);
					
					String startDate = sdf.format(date);
					auctionProduct.setAuctionStartTime(startDate);
		
					cal.setTime(date);
		
					
					cal.add(Calendar.MINUTE, 10);
					date = cal.getTime();
		
					String endDate = sdf.format(date);
					auctionProduct.setAuctionEndTime(endDate);
					
		} catch (IOException e) {
			e.printStackTrace();
		}

		return auctionProduct;
	}
}
