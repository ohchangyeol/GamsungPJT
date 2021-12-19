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
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Test
	public void testListCamp() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
//		search.setSearchKeyword("감자");
//		
//		List mainSite = new ArrayList();
//		mainSite.add("오토캠핑");
//		mainSite.add("글램핑");
//		search.setMainSite(mainSite);
		
		List price = new ArrayList();
		price.add(100000);
		price.add(200000);
		
		search.setPrice(price);
					
		Map<String,Object> map = campSearchService.listCamp(search);
		
		List<Object> list = (List<Object>)map.get("list");
		
		Assert.assertEquals(1, list.size());
		
		System.out.println("콘솔 확인 : " +list);
		
		Integer totalCount = (Integer)map.get("totalCount");
				
	 	System.out.println("콘솔 확인 : " +totalCount);
		
	}
}
