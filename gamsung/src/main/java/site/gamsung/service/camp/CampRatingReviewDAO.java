package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.domain.RatingReview;

public interface CampRatingReviewDAO {
	
	public List<RatingReview> listCampRatingReview(Map<String, Object> map) throws Exception;
	
	public int getTotalCount(Map<String, Object> map) throws Exception;
	
	public int addCampRatingReview(RatingReview ratingReview) throws Exception;
	
	public List<Double> getCampRating(int campNo) throws Exception;
	
	public int updateCampAvgRating (Map<String, Object> map) throws Exception;
	
	public int updateCampRatingReview (RatingReview ratingReview) throws Exception;
	
}
