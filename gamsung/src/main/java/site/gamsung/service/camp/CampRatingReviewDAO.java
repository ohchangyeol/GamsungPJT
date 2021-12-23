package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.domain.RatingReview;

public interface CampRatingReviewDAO {
	
	public List<RatingReview> listCampRatingReview(Map<String, Object> map) throws Exception;
	
	public int getTotalCount(Map<String, Object> map) throws Exception;
	
}
