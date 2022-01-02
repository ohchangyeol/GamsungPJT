package site.gamsung.service.auction;

import java.util.List;
import java.util.Map;

import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.RatingReview;

public interface AuctionReviewService {
	
	public AuctionInfo addAuctionRatingReviewComment(RatingReview ratingReview);
	
	public List<RatingReview> listAuctionRatingReview(Map<String, Object> map);
	
	public AuctionInfo updateAuctionRatingReview(RatingReview ratingReview);
	
	public void deleteAuctionRatingReview(RatingReview ratingReview);
	
}
