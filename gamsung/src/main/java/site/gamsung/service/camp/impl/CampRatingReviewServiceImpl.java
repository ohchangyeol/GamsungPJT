package site.gamsung.service.camp.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.camp.CampRatingReviewDAO;
import site.gamsung.service.camp.CampSearchDAO;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.RatingReview;

@Service("campRatingReviewServiceImpl")
public class CampRatingReviewServiceImpl implements RatingReviewService{

	@Autowired
	@Qualifier("campRatingReviewDAOImpl")
	private CampRatingReviewDAO campRatingReviewDAO;
	
	@Autowired
	@Qualifier("campSearchDAOImpl")
	private CampSearchDAO campSearchDAO;
	
	public void setCampRatingReviewDAO(CampRatingReviewDAO campRatingReviewDAO) {
		this.campRatingReviewDAO = campRatingReviewDAO;
	}

	public CampRatingReviewServiceImpl() {
		System.out.println(this.getClass());
	}
	

	@Override
	public void addRatingReview(RatingReview ratingReview) {
		campRatingReviewDAO.addCampRatingReview(ratingReview);
		int campNo = ratingReview.getCamp().getCampNo();
		List<Double> ratingList = campRatingReviewDAO.getCampRating(campNo);
		double avgRating = 0;
		
		for (Double rl : ratingList) {
			avgRating += rl;
		}
		
		avgRating /= ratingList.size();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("campNo", campNo);
		map.put("avgRating", avgRating);
		
		campRatingReviewDAO.updateCampAvgRating(map);
	}

	@Override
	public Map<String, Object> listRatingReview(Search search) {
		
		List<RatingReview> list = new ArrayList<RatingReview>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(search.getCampNo() != 0) {
			list = campRatingReviewDAO.listCampRatingReview(search);
			Camp camp = campSearchDAO.getCamp(search.getCampNo());
			double campRating = camp.getCampRate();
			map.put("campRating", campRating);
			
		}else {
			list = campRatingReviewDAO.listMyRatingReview(search);
		}
		
		int totalCount = campRatingReviewDAO.getTotalCount(search);
				
		map.put("list", list);
		map.put("totalCount", totalCount);
				
		return map;
	}
	
	@Override
	public void updateRatingReview(RatingReview ratingReview) {
		campRatingReviewDAO.updateCampRatingReview(ratingReview);
	}
		
	@Override
	public void deleteRatingReview(RatingReview ratingReview) {
		campRatingReviewDAO.deleteCampRatingReviewComment(ratingReview);
	}

	@Override
	public RatingReview getRatingReview(int ratingReviewNo) {
		return campRatingReviewDAO.getCampRatingReview(ratingReviewNo);
	}
	
}
