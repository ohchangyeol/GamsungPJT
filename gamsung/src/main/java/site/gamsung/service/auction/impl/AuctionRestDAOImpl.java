package site.gamsung.service.auction.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionRestDAO;
import site.gamsung.service.domain.AuctionProduct;

@Repository("auctionRestDAO")
public class AuctionRestDAOImpl implements AuctionRestDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public AuctionRestDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean coupangCrawlingData(List<AuctionProduct> list) throws SQLException {
		// TODO Auto-generated method stub
			
		sqlSession.insert("AuctionRestMapper.crawlingData",list);
	
		return true;
	}
	
	

}
