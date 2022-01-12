package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.RatingReview;

public interface CampRatingReviewDAO {
	
	public List<RatingReview> listCampRatingReview(Search search);
	
	public List<RatingReview> listMyRatingReview(Search search);
	
	public int getTotalCount(Search search);
	
	public int addCampRatingReview(RatingReview ratingReview);
	
	public List<Double> getCampRating(int campNo);
	
	public RatingReview getCampRatingReview(int ratingReviewNo);
	
	public int updateCampAvgRating (Map<String, Object> map);
	
	public int updateCampRatingReview (RatingReview ratingReview);
	
	public int deleteCampRatingReviewComment (RatingReview ratingReview);
	
}
