package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionList;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

public interface AuctionUserInfoDAO {
	
	public List<AuctionBidInfo> listBidConcern(AuctionList auctionList);
	
	public List<AuctionProduct> listAuctionProductByRole(AuctionList auctionList);
	
	public List<AuctionBidInfo> AuctionHistory(AuctionList auctionList);
	
}
