package site.gamsung.service.camp.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.RatingReview;
import site.gamsung.service.domain.User;


/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =  {"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})

public class CampRatingReviewTest {

	@Autowired
	@Qualifier("campRatingReviewServiceImpl")
	private RatingReviewService ratingReviewService;
	
	@Value("#{commonProperties['campPageSize']}")
	int campPageSize;
	
	//캠핑장 리뷰 등록(O), 캠핑장 평점 리스트 가져와서 평균평점 계산 후 캠핑장 평균평점 등록(O)
	//@Test
	public void testAddRatingReview() throws Exception{

		RatingReview ratingReview = new RatingReview();
		User user = new User();
		user.setId("user1@gamsung.com");
		Camp camp = new Camp();
		camp.setCampNo(10000);
		
		ratingReview.setUser(user);
		ratingReview.setCamp(camp);
//		ratingReview.setRatingReviewStatus(1);
		ratingReview.setRatingReviewStatus(2);
		ratingReview.setRatingReviewTitle("test");
		ratingReview.setRatingReviewContent("testtest");
		ratingReview.setStatusRating(4.5);
		ratingReview.setImg1("imgTest");
		
		ratingReviewService.addRatingReview(ratingReview);
				
	}
	
	//캠핑장 별 리뷰 목록(o)
	//@Test
	public void testListRatingReview() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(campPageSize);
		
		int campNo = 10000;
		
		search.setCampNo(campNo);
		
		Map<String, Object> map = ratingReviewService.listRatingReview(search);
		
		List<RatingReview> list = (List<RatingReview>)map.get("list");
		
		System.out.println("콘솔 확인 : " + list);
		
		Integer totalcount = (Integer)map.get("totalCount");
		
		System.out.println("콘솔 확인 : " + totalcount);
	}
	
	//캠핑장 답글 등록(), 캠핑장 리뷰 내용수정(), 캠핑장 리뷰 & 답글 블라인드()
	//@Test
	public void testUpdateCampRatingReview() throws Exception{
		
		RatingReview ratingReview = new RatingReview();
		ratingReview.setRatingReviewNo(11);
//		ratingReview.setRatingReviewTitle("수정테스트제목333");
//		ratingReview.setRatingReviewContent("수정테스트본문");
//		ratingReview.setComment("답글 테스트");
//		ratingReview.setReviewDeleteFlag("Y");
		ratingReview.setCommentDeleteFlag("Y");
		
		ratingReviewService.updateRatingReview(ratingReview);
	}
}
