package site.gamsung.service.camp.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.camp.CampRatingReviewDAO;
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
	public List<RatingReview> listCampRatingReview(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("CampRatingReviewMapper.listCampRatingReview", map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("CampRatingReviewMapper.getTotalCount", map);
	}
	
}
