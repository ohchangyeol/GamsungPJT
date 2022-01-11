package site.gamsung.service.camp.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.camp.CampRatingReviewDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.RatingReview;

@Repository("campRatingReviewDAOImpl")
public class CampRatingReviewDAOImpl implements CampRatingReviewDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public CampRatingReviewDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int addCampRatingReview(RatingReview ratingReview) {
		return sqlSession.insert("CampRatingReviewMapper.addCampRatingReview", ratingReview);
	}
	
	@Override
	public List<RatingReview> listCampRatingReview(Search search) {
		return sqlSession.selectList("CampRatingReviewMapper.listCampRatingReview", search);
	}
	
	@Override
	public List<RatingReview> listMyRatingReview(Search search) {
		return sqlSession.selectList("CampRatingReviewMapper.listMyRatingReview", search);
	}

	@Override
	public int getTotalCount(Search search) {
		return sqlSession.selectOne("CampRatingReviewMapper.getTotalCount", search);
	}

	@Override
	public List<Double> getCampRating(int campNo) {
		return sqlSession.selectList("CampRatingReviewMapper.getCampRating", campNo);
	}

	@Override
	public int updateCampAvgRating(Map<String, Object> map) {
		return sqlSession.update("CampRatingReviewMapper.updateCampAvgRating", map);
	}

	@Override
	public int updateCampRatingReview(RatingReview ratingReview) {
		return sqlSession.update("CampRatingReviewMapper.updateCampRatingReview", ratingReview);
	}
	
	@Override
	public int deleteCampRatingReviewComment(RatingReview ratingReview) {
		return sqlSession.update("CampRatingReviewMapper.deleteCampRatingReviewComment", ratingReview);
	}

	@Override
	public RatingReview getCampRatingReview(int ratingReviewNo) {
		return sqlSession.selectOne("CampRatingReviewMapper.getCampRatingReview", ratingReviewNo);
	}
	
	
	
}
