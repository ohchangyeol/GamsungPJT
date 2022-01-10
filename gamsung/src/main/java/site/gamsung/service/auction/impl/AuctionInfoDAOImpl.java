package site.gamsung.service.auction.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.User;

@Repository("auctionInfoDAO")
public class AuctionInfoDAOImpl implements AuctionInfoDAO{

	@Autowired(required = false)
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public AuctionInfoDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addBidConcern(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionInfoMapper.addBidConcern",auctionInfo);
	}

	@Override
	public int getBidConcern(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.getBidConcern", auctionInfo);
	}

	@Override
	public void deleteBidConcern(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionInfoMapper.deleteBidConcern",auctionInfo);
	}

	@Override
	public void finishBidConcern(String bidConcernNo) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionInfoMapper.finishBidConcern",bidConcernNo);
	}

	@Override
	public List<AuctionInfo> listBidConcern(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.listBidConcern",map);
	}

	@Override
	public int countBidConcern(User user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.countBidConcern",user);
	}

	@Override
	public List<AuctionProduct> listAuctionProductByRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.listAuctionProductByRole", map);
	}

	@Override
	public int countAuctionProductByRole(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.countAuctionProductByRole",userId);
	}

	@Override
	public List<AuctionInfo> auctionHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.AuctionHistory", map);
	}

	@Override
	public int countAuctionHistory(User user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.countAuctionHistory",user);
	}

	@Override
	public AuctionInfo auctionStatusTotalCount(User user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.auctionStatusTotalCount",user);
	}

	@Override
	public List<AuctionInfo> getYearAuctionStatistics() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.getYearAuctionStatistics");
	}

	@Override
	public List<AuctionInfo> getMonthlyAuctionStatistics(int year) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.getMonthlyAuctionStatistics",year);
	}
	
	@Override
	public AuctionInfo todayAuctionStatistics() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.todayAuctionStatistics");
	}
	
	@Override
	public int getUserAuctionGradeInfo(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.getUserAuctionGradeInfo",userId);
	}
	
	@Override
	public void updateUserAuctionGrade(User user) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionInfoMapper.updateUserAuctionGrade",user);
	}

	@Override
	public List<AuctionInfo> getBidderRanking(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.getBidderRanking",auctionInfo);
	}
	
	@Override
	public PaymentCode getPaymentInfo(PaymentCode paymentCode) {
		return sqlSession.selectOne("AuctionInfoMapper.getPaymentInfo",paymentCode);
	}
	
	@Override
	public void auctionSuspension(User user) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionInfoMapper.auctionSuspension",user);
	}

	@Override
	public List<User> auctionSuspensionUserList(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.auctionSuspensionUserList",search);
	}
	
	@Override
	public int countAuctionSuspensionUser() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.countAuctionSuspensionUser");
	}

	@Override
	public boolean isSuspension(User user) {
		// TODO Auto-generated method stub
		if((int)sqlSession.selectOne("AuctionInfoMapper.isSuspension",user) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteAuctionSuspension(User user) {
		// TODO Auto-generated method stub
		if( sqlSession.update("AuctionInfoMapper.deleteAuctionSuspension",user) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isSecessionUserAuctionCondition(String userId) {
		// TODO Auto-generated method stub
		
		List<AuctionProduct> list = sqlSession.selectList("AuctionInfoMapper.isSecessionUserAuctionCondition", userId);
		
		if(list.size()==0) {
			return true;
		}
		return false;
	}
	

}
