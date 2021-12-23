package site.gamsung.service.auction.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
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
		sqlSession.delete("AuctionInfoMapper.deleteBidConcern",auctionInfo);
	}

	@Override
	public List<AuctionInfo> listBidConcern(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.listBidConcern",map);
	}

	@Override
	public List<AuctionProduct> listAuctionProductByRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.listAuctionProductByRole", map);
	}

	@Override
	public List<AuctionInfo> auctionHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.AuctionHistory", map);
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
	public List<AuctionInfo> getMonthAuctionStatistics(String year) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionInfoMapper.getMonthAuctionStatistics",year);
	}

	@Override
	public AuctionInfo getDayAuctionStatistics() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionInfoMapper.getDayAuctionStatistics");
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
	public boolean isSecessionUserAuctionCondition(String userId) {
		// TODO Auto-generated method stub
		
		List<AuctionProduct> list = sqlSession.selectList("AuctionInfoMapper.isSecessionUserAuctionCondition", userId);
		
		if(list == null) {
			return true;
		}
		
		return false;
	}
	

}
