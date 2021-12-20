package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

public interface AuctionUserInfoDAO {
	
	public List<AuctionBidInfo> listBidConcern(String auctionUserId);
	
	public List<AuctionProduct> listAuctionProductByRole(User user);
	
	public List<AuctionBidInfo> AuctionHistory(AuctionBidInfo auctionBidInfo);
	
}
