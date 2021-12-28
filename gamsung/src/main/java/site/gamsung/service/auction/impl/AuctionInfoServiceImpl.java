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
	public List<AuctionInfo> listBidConcern(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return auctionInfoDAO.listBidConcern(map);
	}

	@Override
	public List<AuctionProduct> listAuctionProductByRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return auctionInfoDAO.listAuctionProductByRole(map);
	}

	@Override
	public List<AuctionInfo> auctionHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return auctionInfoDAO.auctionHistory(map);
	}

	@Override
	public AuctionInfo getAuctionTotalStatistics(User user) {
		// TODO Auto-generated method stub
		 		
		return auctionInfoDAO.auctionStatusTotalCount(user);
	}

}
