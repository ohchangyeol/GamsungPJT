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
import site.gamsung.service.domain.User;

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
	public Map<String, Object> listMyRatingReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<RatingReview> list = auctionReviewDAO.listMyRatingReview(map);
		
		User user = (User)map.get("user");
		int totalCount = auctionReviewDAO.countMyRatingReview(user.getId());
		
		map.clear();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
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
	public AuctionInfo deleteAuctionRatingReview(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		String info = "";
		AuctionInfo auctionInfo = new AuctionInfo();
		
		if(ratingReview.getRatingReviewStatus() == 0) {
			RatingReview tmpRatingReview = auctionReviewDAO.getAuctionRatingReview(ratingReview.getRatingReviewNo());
			if(tmpRatingReview.getCommentRegDate() != null) {
				info = "판매자의 답글이 달려 삭제 불가능 합니다.";
			}else {
				auctionReviewDAO.deleteAuctionRatingReview(ratingReview);
				info = "삭제 완료하였습니다.";				
			}
			auctionInfo.setInfo(info);
			return auctionInfo;
		}
		
		auctionReviewDAO.deleteAuctionRatingReview(ratingReview);
		
		info = "삭제 완료하였습니다.";
		auctionInfo.setInfo(info);
		return auctionInfo;
	}

	//empty method
	@Override
	public Map<String, Object> listRatingReview(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	//empty method
	@Override
	public void deleteRatingReview(RatingReview ratingReview) {
		// TODO Auto-generated method stub
		
	}

}
