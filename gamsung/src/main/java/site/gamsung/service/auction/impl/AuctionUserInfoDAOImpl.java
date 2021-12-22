package site.gamsung.service.auction.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionUserInfoDAO;
import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionIntergration;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;

@Repository("auctionUserInfoDAO")
public class AuctionUserInfoDAOImpl implements AuctionUserInfoDAO{

	@Autowired(required = false)
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public AuctionUserInfoDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<AuctionBidInfo> listBidConcern(AuctionIntergration auctionIntergration) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionUserInfoMapper.listBidConcern",auctionIntergration);

	}

	@Override
	public List<AuctionProduct> listAuctionProductByRole(AuctionIntergration auctionIntergration) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionUserInfoMapper.listAuctionProductByRole",auctionIntergration);
	}

	@Override
	public List<AuctionBidInfo> auctionHistory(AuctionIntergration auctionIntergration) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionUserInfoMapper.AuctionHistory", auctionIntergration);
	}

	@Override
	public AuctionBidInfo auctionStatusTotalCount(User user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionUserInfoMapper.auctionStatusTotalCount",user);
	}

	@Override
	public int getUserAuctionGradeInfo(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionUserInfoMapper.getUserAuctionGradeInfo",userId);
	}

	@Override
	public void updateUserAuctionGrade(User user) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionUserInfoMapper.updateUserAuctionGrade",user);
	}

	@Override
	public boolean isSecessionUserAuctionCondition(String userId) {
		// TODO Auto-generated method stub
		
		List<AuctionProduct> list = sqlSession.selectList("AuctionUserInfoMapper.isSecessionUserAuctionCondition", userId);
		
		if(list == null) {
			return true;
		}
		
		return false;
	}
	

}
