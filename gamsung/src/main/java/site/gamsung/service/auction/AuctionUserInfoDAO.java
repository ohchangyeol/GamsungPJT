package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionIntergration;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

public interface AuctionUserInfoDAO {
	
	public List<AuctionBidInfo> listBidConcern(AuctionIntergration auctionList);
	
	public List<AuctionProduct> listAuctionProductByRole(AuctionIntergration auctionList);
	
	public List<AuctionBidInfo> auctionHistory(AuctionIntergration auctionList);
	
	public AuctionBidInfo auctionStatusTotalCount(User user);
	
	public int getUserAuctionGradeInfo(String userId);
	
	public void updateUserAuctionGrade(User user);
	
	public boolean isSecessionUserAuctionCondition(String userId);
}
