package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionProduct;

public interface AuctionProductDAO {
	
	public List<AuctionProduct> listAuctionProduct(Search search);
	
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct);
	
	public AuctionProduct getTempSaveAuctionProduct(String registrantId);
	
	public void addAuctionProduct(AuctionProduct auctionProduct);
	
	public AuctionProduct getAuctionProduct(String auctionProductNo);
	
	public void updateAuctionProductViewCounter(String auctionProductNo);
	
	public AuctionBidInfo auctionProductBidUserInfo(String bidderId);
	
	public void auctionProductBid(AuctionBidInfo auctionBidInfo);

	public void updateBidEndTime(String auctionProductNo);
	
	public void addMainAuctionProduct(AuctionProduct auctionProduct);
	
	public List<AuctionProduct> listMainAuctionProduct(Search search);
}
