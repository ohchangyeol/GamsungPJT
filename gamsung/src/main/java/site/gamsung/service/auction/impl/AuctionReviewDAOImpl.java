package site.gamsung.service.auction.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.auction.AuctionReviewDAO;
import site.gamsung.service.domain.RatingReview;

@Repository("auctionReviewDAO")
public class AuctionReviewDAOImpl implements AuctionReviewDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public AuctionReviewDAOImpl() {

	}

	@Override
	public void addAuctionRatingReview(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		sqlSession.insert("AuctionRatingReviewMapper.addAuctionRatingReview",ratingReview);
	}

	@Override
	public int addAuctionRatingReviewComment(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		return sqlSession.update("AuctionRatingReviewMapper.addAuctionRatingReviewComment",ratingReview);
	}

	@Override
	public List<RatingReview> listMyRatingReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionRatingReviewMapper.listMyRatingReview", map);
	}

	@Override
	public int countMyRatingReview(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionRatingReviewMapper.countMyRatingReview", userId);
	}

	@Override
	public List<RatingReview> listAuctionRatingReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AuctionRatingReviewMapper.listAuctionRatingReview", map);
	}

	@Override
	public RatingReview getAuctionRatingReview(int ratingReviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionRatingReviewMapper.getAuctionRatingReview",ratingReviewNo);
	}

	@Override
	public int updateAuctionRatingReview(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		return sqlSession.update("AuctionRatingReviewMapper.updateAuctionRatingReview",ratingReview);
	}

	@Override
	public void deleteAuctionRatingReview(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		sqlSession.update("AuctionRatingReviewMapper.deleteAuctionRatingReview",ratingReview);
	}

	@Override
	public RatingReview getRegistrantAvgRating(String registrantId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AuctionRatingReviewMapper.getRegistrantAvgRating",registrantId);
	}
	
	
}