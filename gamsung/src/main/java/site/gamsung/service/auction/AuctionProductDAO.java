package site.gamsung.service.auction;

import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionProduct;
public interface AuctionProductDAO {
	
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct);
	
	public AuctionProduct getTempSaveAuctionProduct(String registrant_id);
	
	public void addAuctionProduct(AuctionProduct auctionProduct);
	
	public AuctionProduct getAuctionProduct(String auctionProductNo);
	
	public AuctionBidInfo auctionProductBidUserInfo(String bidderId);
	
	public void updateBidEndTime(String auctionProductNo);
	
	public void auctionProductBid(AuctionBidInfo auctionBidInfo);
}
