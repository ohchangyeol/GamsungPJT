package site.gamsung.service.auction.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

@Service("auctionInfoService")
public class AuctionInfoServiceImpl implements AuctionInfoService{
	
	@Autowired
	@Qualifier("auctionInfoDAO")
	private AuctionInfoDAO auctionInfoDAO;
	
	@Autowired
	@Qualifier("auctionProductDAO")
	private AuctionProductDAO auctionProductDAO;
	
	
	public AuctionInfoServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String addBidConcern(AuctionInfo auctionBidInfo) {
		// TODO Auto-generated method stub
		
		int isActive = auctionInfoDAO.getBidConcern(auctionBidInfo);
		String productName = auctionProductDAO.getAuctionProduct(auctionBidInfo.getAuctionProductNo()).getAuctionProductName();
		
		String info = "";
		
		if(isActive == 0) {
			auctionInfoDAO.addBidConcern(auctionBidInfo);
			info = "선택하신 \""+productName+"\"의 응찰 관심이 활성화 되었습니다.";
		}else {
			auctionInfoDAO.deleteBidConcern(auctionBidInfo);
			info = "선택하신 \""+productName+"\"의 응찰 관심 비활성화 되었습니다.";
		}
		
		return info;
	}

	@Override
	public Map<String,Object> listBidConcern(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		List<AuctionInfo> list = auctionInfoDAO.listBidConcern(map);
		int totalCount = auctionInfoDAO.countBidConcern((User)map.get("user"));
		
		map.put("totalCount", totalCount);
		map.put("list", list);
		
		return map;
	}

	@Override
	public Map<String,Object> listAuctionProductByRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		User user = (User)map.get("user");
		int totalCount = auctionInfoDAO.countAuctionProductByRole(user.getId());
		List<AuctionProduct> list = auctionInfoDAO.listAuctionProductByRole(map);
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}

	@Override
	public Map<String,Object> auctionHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		int totalCount = auctionInfoDAO.countAuctionHistory((User)map.get("user"));
		List<AuctionInfo> list = auctionInfoDAO.auctionHistory(map);
		
		map.put("totalCount", totalCount);
		map.put("list", list);
		return map;
	}

	@Override
	public AuctionInfo getAuctionTotalStatistics(User user) {
		// TODO Auto-generated method stub
		 		
		return auctionInfoDAO.auctionStatusTotalCount(user);
	}

	@Override
	public void checkAndUpdateUserAuctionGrade(User user) {
		// TODO Auto-generated method stub
		
		AuctionInfo auctionInfo = auctionInfoDAO.auctionStatusTotalCount(user);
		
		int addProductCount = auctionInfo.getAddProductCount()/2;
		int addReviewCount = auctionInfo.getAddReviewCount()/4;
		int auctionConfirmCount = auctionInfo.getAuctionConfirmCount()/2;
		int topRankCount = auctionInfo.getTopRankCount()/4;
		int midwayWithdrawalCount =auctionInfo.getMidwayWithdrawalCount();
		int cancelSuccessfulBidCount = auctionInfo.getCancelSuccessfulBidCount();
		
		int userAuctionGrade = addProductCount + addReviewCount + auctionConfirmCount + topRankCount
								- midwayWithdrawalCount - cancelSuccessfulBidCount + 1;
		if(userAuctionGrade < 1) {
			userAuctionGrade = 1;
		}
		user.setAuctionGrade(userAuctionGrade);
		
		auctionInfoDAO.updateUserAuctionGrade(user);		
	}

	@Override
	public AuctionInfo getBidderRanking(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		List<AuctionInfo> list = auctionInfoDAO.getBidderRanking(auctionInfo);
		
		if(list.size() == 0) {
			return auctionInfo;
		}
		
		return auctionInfoDAO.getBidderRanking(auctionInfo).get(0);
	}
	
	

}
