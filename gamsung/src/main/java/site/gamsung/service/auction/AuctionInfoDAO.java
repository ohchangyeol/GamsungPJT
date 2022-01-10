package site.gamsung.service.auction;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.User;

public interface AuctionInfoDAO {
	
	public void addBidConcern(AuctionInfo auctionInfo);
	
	public int getBidConcern(AuctionInfo auctionInfo);
	
	public void deleteBidConcern(AuctionInfo auctionInfo);
	
	public void finishBidConcern(String bidConcernNo);
	
	public List<AuctionInfo> listBidConcern(Map<String, Object> map);
	
	public int countBidConcern(User user);
	
	public List<AuctionProduct> listAuctionProductByRole(Map<String, Object> map);
	
	public int countAuctionProductByRole(String userId);
	
	public List<AuctionInfo> auctionHistory(Map<String, Object> map);
	
	public int countAuctionHistory(User user);
	
	public AuctionInfo auctionStatusTotalCount(User user);
	
	public List<AuctionInfo> getYearAuctionStatistics();
	
	public List<AuctionInfo> getMonthlyAuctionStatistics(int year);
	
	public AuctionInfo todayAuctionStatistics();
	
	public int getUserAuctionGradeInfo(String userId);	
	
	public void updateUserAuctionGrade(User user);
	
	public List<AuctionInfo> getBidderRanking(AuctionInfo auctionInfo);
	
	public PaymentCode getPaymentInfo(PaymentCode paymentCode);
	
	public void auctionSuspension(User user);
	
	public List<User> auctionSuspensionUserList(Search search);
	
	public int countAuctionSuspensionUser();
	
	public boolean isSuspension(User user);
	
	public boolean deleteAuctionSuspension(User user);
	
	public boolean isSecessionUserAuctionCondition(String userId);
}
