package site.gamsung.service.common;

import java.util.Map;

import site.gamsung.service.domain.RatingReview;

public interface RatingReviewService {
	
	public void addRatingReview(RatingReview ratingReview) throws Exception;
	
	public Map<String, Object> listRatingReview(Search search, int targetNo) throws Exception;
	
	public RatingReview getRatingReview(int ratingReviewNo) throws Exception;
	
	public void updateRatingReview(RatingReview ratingReview) throws Exception;
	
	public void deleteRatingReview(int ratingReviewNo) throws Exception;
}
