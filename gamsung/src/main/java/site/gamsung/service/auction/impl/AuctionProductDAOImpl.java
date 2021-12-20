package site.gamsung.service.auction.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionProduct;

@Repository("auctionProductDAO")
public class AuctionProductDAOImpl implements AuctionProductDAO{
	
	@Autowired(required = false)
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public AuctionProductDAOImpl() {
		// TODO Auto-generated method stub
	}

	//경매 상품 리스트
	@Override
	public List<AuctionProduct> listAuctionProduct(Search search) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("AuctionMapper.listAuctionProduct",search);
	}

	//임시 저장 상품 호출
	@Override
	public AuctionProduct getTempSaveAuctionProduct(String registrant_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionMapper.getTempSaveAuctionProduct", registrant_id);
	}
	
	//경매 상품 정보 임시 저장
	@Override
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionMapper.tempSaveAuctionProduct", auctionProduct);
	}

	//경매 상품 정보 수정 및 등록
	@Override
	public void addAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionMapper.addAuctionProduct", auctionProduct);
	}

	//상품 정보 호출
	@Override
	public AuctionProduct getAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionMapper.getAuctionProduct", auctionProductNo);
	}
	
	//상품 조회수 증가
	@Override
	public void updateAuctionProductViewCounter(String auctionProductNo) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionMapper.updateAuctionProductViewCounter", auctionProductNo);
		
	}	
	
	//회원 경매 정보 호출
	@Override
	public AuctionBidInfo auctionProductBidUserInfo(String bidderId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionMapper.auctionProductBidUserInfo", bidderId);
	}
	
	
	@Override
	public void auctionProductBid(AuctionBidInfo auctionBidInfo) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionMapper.auctionProductBid", auctionBidInfo);
	}
	
	//경매 상품 10초 추가
	@Override
	public void updateBidEndTime(String auctionProductNo) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionMapper.updateBidEndTime", auctionProductNo);
	}

}
