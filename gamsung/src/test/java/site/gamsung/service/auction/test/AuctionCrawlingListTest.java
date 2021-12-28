package site.gamsung.service.auction.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionProduct;

public class AuctionCrawlingListTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String url = "https://www.coupang.com/np/search?q=%EC%BA%A0%ED%95%91&page=1";

		Document doc = null;
		String prod = null;
		String img = null;
		String name = null;
		
		String[] hashtags = null;

		AuctionProduct auctionProduct = null;
		
		List<AuctionProduct> list = Collections.synchronizedList(new ArrayList<AuctionProduct>());

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements prodList = doc.select("#productList");
		Elements prodTag = prodList.select(".search-product-link");
		Elements imgTag = prodList.select(".search-product-wrap-img");
		Elements nameTag = doc.select(".name");

		for (int j = 0; j <36; j++) {

			auctionProduct = new AuctionProduct();
			
			prod = prodTag.get(j).attr("data-product-id");
			img = imgTag.get(j).attr("data-img-src");
			name = nameTag.get(j).text();
			
			auctionProduct.setProductImg1(img);
			auctionProduct.setAuctionProductName(name);
			auctionProduct.setAuctionProductNo(prod);
			
			auctionProduct.setRegistrantId("admin");

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

			list.add(auctionProduct);

		}

		for (AuctionProduct ap : list) {
			System.out.println(ap);
		}
	}

}
