package site.gamsung.service.auction.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionUserInfoDAO;
import site.gamsung.service.domain.AuctionBidInfo;
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
	public List<AuctionBidInfo> listBidConcern(String auctionUserId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionUserInfoMapper.listBidConcern",auctionUserId);

	}

	@Override
	public List<AuctionProduct> listAuctionProductByRole(User user) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionUserInfoMapper.listAuctionProductByRole",user);
	}

	@Override
	public List<AuctionBidInfo> AuctionHistory(AuctionBidInfo auctionBidInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionUserInfoMapper.AuctionHistory",auctionBidInfo);
	}
	
	

}
