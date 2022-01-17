package site.gamsung.service.auction;

import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

public interface AuctionInfoService {
	
	public String addBidConcern(AuctionInfo auctionBidInfo);
	
	public Map<String,Object> listBidConcern(Map<String, Object> map);
	
	public Map<String,Object> listAuctionProductByRole(Map<String, Object> map);
	
	public Map<String,Object> auctionHistory(Map<String, Object> map);
	
	public Map<String, Object> getAuctionStatistics();
	
	public User checkAndUpdateUserAuctionGrade(User user);
	
	public AuctionInfo getBidderRanking(AuctionInfo auctionInfo);
	
	public Map<String, Object> listAuctionSuspensionUser(User user, Search search);
	
	public AuctionInfo deleteAuctionSuspension(User user);
	
	public Object makePaymentInfo(User user, String option, AuctionProduct auctionProduct);
	
}
