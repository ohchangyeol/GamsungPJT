package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.AuctionSearch;
public interface AuctionProductDAO {
	
	public List<AuctionProduct> listAuctionProduct(AuctionSearch auctionSearch);
	
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct);
	
	public AuctionProduct getTempSaveAuctionProduct(String registrant_id);
	
	public void addAuctionProduct(AuctionProduct auctionProduct);
	
	public AuctionProduct getAuctionProduct(String auctionProductNo);
	
	public AuctionBidInfo auctionProductBidUserInfo(String bidderId);
	
	public void updateBidEndTime(String auctionProductNo);
	
	public void auctionProductBid(AuctionBidInfo auctionBidInfo);
	
}
