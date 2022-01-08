package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;

public interface AuctionProductDAO {
	
	public void addCrawlingAuctionProduct(AuctionProduct auctionProduct);
	
	public String getCrawlingAuctionProductNo(String auctionProductSubDatail);
	
	public List<AuctionProduct> listAuctionProduct(Search search);
	
	public List<String> autoComplete(String searchKeyword);
	
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct);
	
	public AuctionProduct getTempSaveAuctionProduct(String registrantId);
	
	public void addAuctionProduct(AuctionProduct auctionProduct);
	
	public void updateAuctionProduct(AuctionProduct auctionProduct);
	
	public AuctionProduct getAuctionProduct(String auctionProductNo);
	
	public void updateAuctionProductViewCounter(String auctionProductNo);
	
	public AuctionInfo auctionProductBidUserInfo(String bidderId);
	
	public void auctionProductBid(AuctionInfo auctionInfo);

	public int updateBidEndTime(String auctionProductNo);
	
	public void updateAuctionProductCondition(AuctionProduct auctionProduct);
	
	public void addMainAuctionProduct(String auctionProductNo);
	
	public int mainAuctionProductCount(String auctionProductNo);
	
	public void deleteMainAuctionProduct(String auctionProductNo);
	
	public List<AuctionProduct> listMainAuctionProduct();
	
	public int deleteAuctionProduct(AuctionInfo auctionInfo);
	
	public void viewUserLog(AuctionInfo auctionInfo);
	
	public AuctionInfo getUserLog(AuctionInfo auctionInfo);
	
	public AuctionProduct paymentSubInfo(String registrantId);
}
