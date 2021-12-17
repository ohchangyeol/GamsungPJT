package site.gamsung.service.auction.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.domain.AuctionProduct;


public class AuctionProductDAOImpl implements AuctionProductDAO{
	
	@Autowired
	@Qualifier("sqlSessionTamplate")
	private SqlSession sqlSession;
	
	public AuctionProductDAOImpl() {
		// TODO Auto-generated method stub
	}

	//경매 상품 정보 등록
	@Override
	public void addAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		sqlSession.insert("AucitonMapper.addAuctionProduct", auctionProduct);
	}
	
	

}
