package site.gamsung.service.auction.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
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
	
	@Override
	public void addCrawlingAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionProductMapper.addCrawlingAuctionProduct",auctionProduct);
	}

	@Override
	public String getCrawlingAuctionProductNo(String auctionProductSubDatail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionProductMapper.getCrawlingAuctionProductNo",auctionProductSubDatail);
	}

	//경매 상품 리스트
	@Override
	public List<AuctionProduct> listAuctionProduct(Search search) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("AuctionProductMapper.listAuctionProduct",search);
	}

	@Override
	public List<String> autoComplete(String searchKeyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionProductMapper.autoComplete",searchKeyword);
	}

	//임시 저장 상품 호출
	@Override
	public AuctionProduct getTempSaveAuctionProduct(String registrantId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionProductMapper.getTempSaveAuctionProduct", registrantId);
	}
	
	//경매 상품 정보 임시 저장
	@Override
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionProductMapper.tempSaveAuctionProduct", auctionProduct);
	}

	//경매 상품 정보 수정 및 등록
	@Override
	public void addAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionProductMapper.addAuctionProduct", auctionProduct);
	}
	
	@Override
	public void updateAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionProductMapper.updateAuctionProduct", auctionProduct);
	}

	//상품 정보 호출
	@Override
	public AuctionProduct getAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionProductMapper.getAuctionProduct", auctionProductNo);
	}
	
	//상품 조회수 증가
	@Override
	public void updateAuctionProductViewCounter(String auctionProductNo) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionProductMapper.updateAuctionProductViewCounter", auctionProductNo);
		
	}	
	
	//회원 경매 정보 호출
	@Override
	public AuctionInfo auctionProductBidUserInfo(String bidderId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionProductMapper.auctionProductBidUserInfo", bidderId);
	}
	
	//입찰시 경매 내역에 추가
	@Override
	public void auctionProductBid(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionProductMapper.auctionProductBid", auctionInfo);
	}
	
	//경매 상품 10초 추가
	@Override
	public int updateBidEndTime(String auctionProductNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("AuctionProductMapper.updateBidEndTime", auctionProductNo);
	}
	
	@Override
	public void updateAuctionProductCondition(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionProductMapper.updateAuctionProductCondition", auctionProduct);
	}

	//메인에 표시될 경매 상품정보
	@Override
	public void addMainAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionProductMapper.addMainAuctionProduct",auctionProductNo);
	}
	
	@Override
	public int mainAuctionProductCount(String auctionProductNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionProductMapper.mainAuctionProductCount",auctionProductNo);
	}

	@Override
	public void deleteMainAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionProductMapper.deleteMainAuctionProduct",auctionProductNo);
	}

	//메인 상품 리스트 출력
	@Override
	public List<AuctionProduct> listMainAuctionProduct() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionProductMapper.listMainAuctionProduct");
	}

	@Override
	public int deleteAuctionProduct(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		return sqlSession.update("AuctionProductMapper.deleteAuctionProduct",auctionInfo);
	}

	@Override
	public void viewUserLog(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionProductMapper.viewUserLog",auctionInfo);
	}

	@Override
	public AuctionInfo getUserLog(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionProductMapper.getUserLog",auctionInfo);
	}

	@Override
	public AuctionProduct paymentSubInfo(String registrantId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionProductMapper.paymentSubInfo",registrantId);
	}

}
