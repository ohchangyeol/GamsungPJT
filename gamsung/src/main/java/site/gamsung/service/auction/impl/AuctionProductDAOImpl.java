package site.gamsung.service.auction.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.domain.AuctionProduct;

@Repository("auctionProductDAO")
public class AuctionProductDAOImpl implements AuctionProductDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public AuctionProductDAOImpl() {
		// TODO Auto-generated method stub
	}

	//경매 상품 정보 등록
	@Override
	public void addAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		System.out.println("sqlSession : "+sqlSession );
		sqlSession.insert("AuctionMapper.addAuctionProduct", auctionProduct);
	}
	
	

}
