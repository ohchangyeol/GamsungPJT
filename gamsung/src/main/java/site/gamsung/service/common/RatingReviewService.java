package site.gamsung.service.common;

import java.util.Map;

import site.gamsung.service.domain.RatingReview;

public interface RatingReviewService {
	
	public void addRatingReview(RatingReview ratingReview);
	
	public Map<String, Object> listRatingReview(Search search);
	
	public RatingReview getRatingReview(int ratingReviewNo);
	
	public void updateRatingReview(RatingReview ratingReview);
	
	public void deleteRatingReview(RatingReview ratingReview);

}
