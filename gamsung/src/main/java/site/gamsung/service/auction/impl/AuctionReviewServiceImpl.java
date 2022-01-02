package site.gamsung.service.auction.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.auction.AuctionReviewDAO;
import site.gamsung.service.auction.AuctionReviewService;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.RatingReview;

@Service("auctionReviewService")
public class AuctionReviewServiceImpl implements RatingReviewService, AuctionReviewService{


	@Autowired
	@Qualifier("auctionReviewDAO")
	private AuctionReviewDAO auctionReviewDAO;
	
	@Override
	public void addRatingReview(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		auctionReviewDAO.addAuctionRatingReview(ratingReview);
	}

	@Override
	public AuctionInfo addAuctionRatingReviewComment(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		int isSuccess = auctionReviewDAO.addAuctionRatingReviewComment(ratingReview);
		String info = "";
		
		if(isSuccess != 1) {
			info = "답글 달기 실패하셨습니다. 다시 시도해주세요.";
		}else {
			info = "답글이 정상적으로 등록 되었습니다.";
		}
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setInfo(info);
		
		return auctionInfo;
	}
	
	@Override
	public List<RatingReview> listAuctionRatingReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return auctionReviewDAO.listAuctionRatingReview(map);
	}

	@Override
	public RatingReview getRatingReview(int ratingReviewNo) {
		// TODO Auto-generated method stub
		return auctionReviewDAO.getAuctionRatingReview(ratingReviewNo);
	}

	@Override
	public void updateRatingReview(RatingReview ratingReviewNo) {
		// TODO Auto-generated method stub
		auctionReviewDAO.updateAuctionRatingReview(ratingReviewNo);
	}
	
	@Override
	public AuctionInfo updateAuctionRatingReview(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		
		int isSuccess = auctionReviewDAO.updateAuctionRatingReview(ratingReview);
	
		String info = "";
		
		if(isSuccess != 1) {
			info = "리뷰 수정에 실패하셨습니다. 잠시 후 다시 시도해 주세요.";
		}else {
			info = "리뷰가 정상적으로 수정 되었습니다.";
		}
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setInfo(info);
		
		return auctionInfo;
	}

	@Override
	public void deleteAuctionRatingReview(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		auctionReviewDAO.deleteAuctionRatingReview(ratingReview);
	}

	//empty method
	@Override
	public Map<String, Object> listRatingReview(Search search, int targetNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//empty method
	@Override
	public void deleteRatingReview(int ratingReviewNo) {
		// TODO Auto-generated method stub
		
	}
	
}
