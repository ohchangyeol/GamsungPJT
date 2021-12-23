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
import site.gamsung.service.domain.RatingReview;


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
	@Qualifier("ratingReviewServiceImpl")
	private RatingReviewService ratingReviewService;
	
	@Value("#{commonProperties['campPageSize']}")
	int campPageSize;
	
	//캠핑장 별 리뷰 목록(o)
	//@Test
	public void testListRatingReview() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(campPageSize);
		
		int campNo = 10000;
		
		Map<String, Object> map = ratingReviewService.listRatingReview(search, campNo);
		
		List<RatingReview> list = (List<RatingReview>)map.get("list");
		
		System.out.println("콘솔 확인 : " + list);
		
		Integer totalcount = (Integer)map.get("totalCount");
		
		System.out.println("콘솔 확인 : " + totalcount);
	}
	
}
