package site.gamsung.service.auction;

import java.util.List;
import java.util.Map;

import site.gamsung.service.domain.RatingReview;

public interface AuctionReviewDAO {
	
	public void addAuctionRatingReview(RatingReview ratingReview);
	
	public int addAuctionRatingReviewComment(RatingReview ratingReview);
	
	public List<RatingReview> listMyRatingReview(Map<String, Object> map);
	
	public int countMyRatingReview(String userId);
	
	public List<RatingReview> listAuctionRatingReview(Map<String, Object> map);
	
	public RatingReview getAuctionRatingReview(int ratingReviewNo);
	
	public int updateAuctionRatingReview(RatingReview ratingReview);
	
	public void deleteAuctionRatingReview(RatingReview ratingReview);
	
	public RatingReview getRegistrantAvgRating(String registrantId);
}

