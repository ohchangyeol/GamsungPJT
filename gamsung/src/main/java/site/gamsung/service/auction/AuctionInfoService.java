package site.gamsung.service.auction;

import java.util.List;
import java.util.Map;

import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.User;

public interface AuctionInfoService {
	
	public String addBidConcern(AuctionInfo auctionBidInfo);
	
	public List<AuctionInfo> listBidConcern(Map<String, Object> map);
	
	public Map<String,Object> listAuctionProductByRole(Map<String, Object> map);
	
	public List<AuctionInfo> auctionHistory(Map<String, Object> map);
	
	public AuctionInfo getAuctionTotalStatistics(User user);
	
	public void checkAndUpdateUserAuctionGrade(User user);
	
	public AuctionInfo getBidderRanking(AuctionInfo auctionInfo);
}
