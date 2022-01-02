package site.gamsung.service.auction.test;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.auction.AuctionReviewDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.RatingReview;
import site.gamsung.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =  {"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class AuctionRatingReviewDAOTest {
	
	@Autowired
	@Qualifier("auctionReviewDAO")
	private AuctionReviewDAO auctionReviewDAO;
	
	//@Test
	public void testAddAuctionRatingReview() {
		
		RatingReview ratingReview = new RatingReview();
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo("PROD00004");
		
		User user = new User();
		user.setId("test44@nate.com");
		
		ratingReview.setAuctionInfo(auctionInfo);
		ratingReview.setUser(user);
		ratingReview.setKindnessRating(4.5);
		ratingReview.setStatusRating(3);
		ratingReview.setPriceRating(5);
		ratingReview.setRatingReviewContent("매우좋아연");
		ratingReview.setImg1("1234.jpg");
		
		
		auctionReviewDAO.addAuctionRatingReview(ratingReview);
	}
	
	
	//@Test
	public void testAddAuctionRatingReviewComment() {
		RatingReview ratingReview = new RatingReview();
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo("PROD00004");
		
		ratingReview.setAuctionInfo(auctionInfo);
		ratingReview.setComment("감사합니다.");
		
		auctionReviewDAO.addAuctionRatingReviewComment(ratingReview);
		
	}
	
	//@Test
	public void testListAuctionRatingReview() {
		
		Map<String, Object> map = new HashedMap<String, Object>();
		
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setRegistrantId("admin");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		map.put("auctionProduct", auctionProduct);
		map.put("search", search);
		List<RatingReview> list = null;
		
		try {
			list = auctionReviewDAO.listAuctionRatingReview(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			for(RatingReview ratingReview : list) {
				System.out.println("=====================");
				System.out.println(ratingReview);
			}
		}
	}
	
	//@Test
	public void getAuctionRatingReview() {
		System.out.println(auctionReviewDAO.getAuctionRatingReview(25)); 
	}
	
	//@Test
	public void testUpdateAuctionRatingReview() {
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo("PROD00004");
		
		RatingReview ratingReview = new RatingReview();
		ratingReview.setAuctionInfo(auctionInfo);
		ratingReview.setRatingReviewContent("나쁘지 않아요");
		ratingReview.setStatusRating(5);
		ratingReview.setPriceRating(5);
		ratingReview.setKindnessRating(5);
		
		System.out.println(auctionReviewDAO.updateAuctionRatingReview(ratingReview));
		
	}
	
	@Test
	public void testDeleteAuctionRatingReview() {
		
		RatingReview ratingReview = new RatingReview();
		ratingReview.setRatingReviewNo(25);
//		ratingReview.setRatingReviewStatus(0);
		ratingReview.setRatingReviewStatus(1);
		
		auctionReviewDAO.deleteAuctionRatingReview(ratingReview);
		
		
	}
}
