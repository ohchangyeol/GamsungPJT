package site.gamsung.service.camp.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import junit.framework.Assert;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;

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

public class CampSearchServiceTest {

	@Autowired(required = false)
	@Qualifier("campSearchServiceImpl")
	private CampSearchService campSearchService;
	
	@Value("#{commonProperties['campPageSize']}")
	int campPageSize;
	
	//캠핑장 리스트 :: 간단검색(o), 상세검색(o), 소팅(o), 리미트(o), 토탈카운트(o)
	@Test
	public void testListCamp() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(3);
		search.setPageSize(campPageSize);
//		search.setSearchKeyword("감자");
		search.setSortCondition("평점 높은순");
		
//		List mainSite = new ArrayList();
//		mainSite.add("오토캠핑");
//		mainSite.add("글램핑");
//		search.setMainSite(mainSite);
		
		List price = new ArrayList();
		price.add(0);
		price.add(200000);
		
		search.setPrice(price);
					
		Map<String,Object> map = campSearchService.listCamp(search);
		
		List<Camp> list = (List<Camp>)map.get("list");
		
		Assert.assertEquals(1, list.size());
		
		System.out.println("콘솔 확인 : " + list);
		
		Integer totalCount = (Integer)map.get("totalCount");
				
	 	System.out.println("콘솔 확인 : " + totalCount);
		
	}
	
	//캠핑장 상세검색 :: 캠핑장(O), 주요시설(O), 부가시설(O), 조회수 증가(O)
	//@Test
	public void testGetCamp() throws Exception{
		
		int campNo = 10000;
		
		Map<String, Object> map = campSearchService.getCamp(campNo);
		
		Camp camp = (Camp)map.get("camp");
		
		System.out.println("콘솔 확인 : " + camp);
		
		List<MainSite> mainSiteList = (List<MainSite>)map.get("mainSite");
		
		System.out.println("콘솔 확인 : " + mainSiteList);
		
		List<SubSite> subSiteList = (List<SubSite>) map.get("subSite");
		
		System.out.println("콘솔 확인 : " + subSiteList);

	}
	
	//메인화면 :: 조회수(O), 평점(O), 예약수(O) 별 탑 캠핑장 검색.
	//@Test
	public void testGetTopCamp() throws Exception{
		
		Map<String, Object> map = campSearchService.getTopCamp();
		
		Camp topRating = (Camp)map.get("topRating");
		
		System.out.println("콘솔 확인 : " + topRating);
		
		Camp topView = (Camp)map.get("topView");
		
		System.out.println("콘솔 확인 : " + topView);
		
		Camp topReservation = (Camp)map.get("topReservation");
		
		System.out.println("콘솔 확인 : " + topReservation);
	}
}
