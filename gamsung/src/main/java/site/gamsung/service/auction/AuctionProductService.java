package site.gamsung.service.auction;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.NaverProduct;

public interface AuctionProductService {
	
	public List<NaverProduct> listNaverAuctionProduct(Search search);
	
	public AuctionProduct convertNaverToAuctionProduct(AuctionProduct auctionProduct);
	
	public Map<String,Object> listAuctionProduct(Map<String,Object> map);
	
	public List<String> autoComplete(String searchKeyword);
	
	public Map<String, Object> getAuctionProduct(AuctionInfo auctionInfo);
	
	public AuctionProduct getTempSaveAuctionProduct(String registrantId);
	
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct);
	
	public void addAuctionProduct(AuctionProduct auctionProduct);
	
	public void updateAuctionProduct(AuctionProduct auctionProduct);
	
	public String auctionProductBid(AuctionInfo auctionInfo);
	
	public String addMainAuctionProduct(String auctionProductNo);
	
	public List<AuctionProduct> listMainAuctionProduct();
	
	public AuctionProduct auctionProductImgs(AuctionProduct auctionProduct, List<String> fileList);
	
	public AuctionInfo deleteAuctionProduct(AuctionInfo auctionInfo);
	
	public AuctionInfo updateBidEndTime(String auctionProductNo);
	
	//EC2 크롤링에 문제 발생
	public List<AuctionProduct> listCrawlingAuctionProduct(Search search);
	
	public AuctionProduct getCrawlingAuctionProductNo(AuctionProduct auctionProduct);
}
