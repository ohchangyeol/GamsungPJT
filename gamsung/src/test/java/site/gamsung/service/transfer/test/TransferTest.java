package site.gamsung.service.transfer.test;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.transfer.TransferService;

/*
 *	FileName :  CommunityTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", 
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml" })
public class TransferTest {
	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI

	@Autowired
	@Qualifier("transferServiceImpl")
	private TransferService transferService;
	
	@Autowired
	@Qualifier("campReservationServiceImpl")
	private CampReservationService campReservationService;

	 //@Test
	public void testMyReservationList() throws Exception {

	Search search = new Search();
	String id = "user2@gamsung.com";
		
		 Map<String, Object> list	= campReservationService.listMyReservation(search, id);
		 System.out.println("list::::::::::"+list);
		 
		 
		 
		 
		 
		 
		 
	}
}
