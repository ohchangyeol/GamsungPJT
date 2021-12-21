package site.gamsung.service.auction.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

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
	public String crawlingData(String PATH) {
		// TODO Auto-generated method stub
		
		Document doc = null;
		String img = null;
		String[] goodsNoList = null;
		String goodsNo = null;
		String detailUri = null;
		Document getDoc = null;
		Elements photoSlide = null;
		String mainImg = null;
		String name = null;
		String[] hashtags = null;
		String startBidPrice = null;
		String hopefulBidPrice = null;
		String detail1 = null;
		String detail2 = null;
		
		AuctionProduct auctionProduct = null;
		List<String> uri = new ArrayList<String>();
		List<AuctionProduct> list = new ArrayList<AuctionProduct>();
		
		for(int i=1; i<6; i++) {
			uri.add("https://www.campingon.co.kr/goods/goods_search.php?page="+i+"&keyword=%EC%BA%A0%ED%95%91&recentCount=10");
		}
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		
		String startDate = null;
		String endDate = null;
		
		int min = 0;
		int num = 0;
		int grade = 0;
		for(String str : uri) {
			
			try {
				doc = Jsoup.connect(str).get();				
			
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			Elements imgTag = doc.select(".gd_image_lazy");
			
			for(int j=0; j<imgTag.size(); j++) {
				
				auctionProduct = new AuctionProduct();
				
				img = imgTag.get(j).attr("data-original");
				goodsNoList = img.split("/");
				goodsNo = goodsNoList[goodsNoList.length-2];
				detailUri = "https://www.campingon.co.kr/goods/goods_view.php?goodsNo="+goodsNo;
				
				try {
					
					getDoc = Jsoup.connect(detailUri).get();
					
					mainImg = getDoc.select("#mainImage").select("img").attr("src");
					
					auctionProduct.setProductImg1(downLoadImg(mainImg,PATH));
					
					
					name = getDoc.select(".item_detail_tit").select("h3").text();
					auctionProduct.setAuctionProductName(name);
					
					grade++;
					auctionProduct.setBidableGrade(grade);
					
					if(grade == 100) {
						grade = 0;
					}
					
					num ++;
					auctionProduct.setRegistrantId("user"+num+"@gamsung.com");
					
					if(num == 5) {
						num = 0;
					}
					
					hashtags = name.split(" ");
					
					if(hashtags.length == 1) {
						
						auctionProduct.setHashtag1("#"+hashtags[0]);
						
					}else if(hashtags.length == 2) {
						
						auctionProduct.setHashtag1("#"+hashtags[0]);
						auctionProduct.setHashtag2("#"+hashtags[1]);
						
					}else if(hashtags.length > 2) {
						
						auctionProduct.setHashtag1("#"+hashtags[0]);
						auctionProduct.setHashtag2("#"+hashtags[1]);
						auctionProduct.setHashtag3("#"+hashtags[2]);
						
					}
					
					hopefulBidPrice = getDoc.select(".item_detail_list").select("span").get(0).text();
					if(hopefulBidPrice.indexOf(",") != -1 && hopefulBidPrice != null) {
						auctionProduct.setHopefulBidPrice(Integer.parseInt(hopefulBidPrice.replaceAll("," , "")));						
					}else {
						auctionProduct.setStartBidPrice(Integer.parseInt(startBidPrice.replaceAll("," , ""))*2);						
					}
					
					
					startBidPrice = getDoc.select(".item_price").select("strong").get(0).text();
					if(startBidPrice != null) {
						auctionProduct.setStartBidPrice(Integer.parseInt(startBidPrice.replaceAll("," , "")));						
					}else {
						auctionProduct.setHopefulBidPrice(Integer.parseInt(hopefulBidPrice.replaceAll("," , ""))/2);
					}
					
					auctionProduct.setBidUnit(1000);
					
					photoSlide = getDoc.select(".item_photo_slide").select("img");
					
					for(int k=0; k<photoSlide.size(); k++) {
						if((photoSlide.get(k).attr("src")).indexOf("goods") != -1) {
							
							switch(k) {
							case 1:
								auctionProduct.setProductImg2(downLoadImg(photoSlide.get(k).attr("src"),PATH));
								break;
							case 2:
								auctionProduct.setProductImg3(downLoadImg(photoSlide.get(k).attr("src"),PATH));
								break;
							case 3:
								auctionProduct.setProductImg4(downLoadImg(photoSlide.get(k).attr("src"),PATH));
								break;
							case 4:
								auctionProduct.setProductImg4(downLoadImg(photoSlide.get(k).attr("src"),PATH));
								break;
							case 5:
								auctionProduct.setProductImg5(downLoadImg(photoSlide.get(k).attr("src"),PATH));
								break;
								
							}		
						}
					}
					
					if(getDoc.select(".txt-manual").select("img").size() > 0)
					detail1 = getDoc.select(".txt-manual").select("img").get(0).attr("src");
					auctionProduct.setAuctionProductDatailA(downLoadImg(detail1,PATH));
					
					if(getDoc.select(".txt-manual").select("img").size() > 1) {
						detail2 = getDoc.select(".txt-manual").select("img").get(1).attr("src");
						auctionProduct.setAuctionProductDatailB(downLoadImg(detail2,PATH));						
					}
					
					startDate = sdf.format(date);
					auctionProduct.setAuctionStartTime(startDate);
					
					cal.setTime(date);
					
					min ++;
					cal.add(Calendar.MINUTE, min);
					date = cal.getTime();
					
					endDate = sdf.format(date);
					auctionProduct.setAuctionEndTime(endDate);
					
					list.add(auctionProduct);
					
					if(min == 30) {
						min = 0;
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
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
	
	public static String downLoadImg(String fileName, String PATH) {
		
		String originFileName = null;
		
		try {
			
			URL imgUrl = new URL("https://www.campingon.co.kr/"+fileName);
			BufferedImage jpg = ImageIO.read(imgUrl);
			
			String[] originImg = fileName.split("/");
			
			originFileName = originImg[originImg.length-1];
			
			File file = new File(PATH+originFileName);
		
			ImageIO.write(jpg, "jpg", file);
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return originFileName;
	}	
	
}
