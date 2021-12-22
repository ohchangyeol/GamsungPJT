package site.gamsung.service.camp.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.ReservationStatistics;
//import site.gamsung.service.domain.ReservationStatistics;
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

public class CampReservationServiceTest {

	@Autowired(required = false)
	@Qualifier("campReservationServiceImpl")
	private CampReservationService campReservationService;
	
	@Value("#{commonProperties['campPageSize']}")
	int campPageSize;
	
	//캠핑장 예약 가능한 주요시설 리스트(O)
	@Test
	public void testPossibleReservationList() throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("campNo", 10004);
		map.put("startDate", "2021-12-25");
		
		List<MainSite> list = (List<MainSite>)campReservationService.listPossibleReservation(map);
		
		System.out.println(list);
		
	}
	
	//캠핑장 예약 :: 등록(O), 주요시설 예약일 입력(O) 
	//@Test
	public void testAddReservation() throws Exception{
		
		CampReservation campReservation = new CampReservation();
		User user = new User();
		Camp camp = new Camp();
		MainSite mainSite = new MainSite();
		
		Payment payment = new Payment();
				
		user.setId("user5@gamsung.com");
		camp.setCampNo(10004);
		mainSite.setMainSiteNo(10004);
		
		campReservation.setUser(user);
		campReservation.setCamp(camp);
		campReservation.setMainSite(mainSite);
		campReservation.setReservationStatus(1);
		campReservation.setReservationRegDate(java.sql.Date.valueOf("2021-12-20"));
		campReservation.setReservationUserName("오감자");
		campReservation.setReservationStartDate(java.sql.Date.valueOf("2021-12-24"));
		campReservation.setReservationEndDate(java.sql.Date.valueOf("2021-12-25"));
		campReservation.setUseNum(2);
		campReservation.setReservationUserPhone("01077777777");
		campReservation.setReservationRegCarNum("77조7777");
		campReservation.setReservationRequest("욜라뽕따이");
		campReservation.setTotalPaymentPrice(1000000);
		campReservation.setTotalReservationRegCar(2);
		campReservation.setPaymentType(3);
		
		campReservationService.addReservation(campReservation);
		
	}
	
	//캠핑장 예약 리스트 :: 캠핑장업체 별 예약(O), 일반회원 별 예약(O)
	//@Test
	public void testlistReservation() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(campPageSize);
		
//		String id = "user1@gamsung.com";
//		Map<String, Object> map = campReservationService.listMyReservation(search, id);

		int campNo = 10000;
		Map<String, Object> map = campReservationService.listReservation(search, campNo);
		
		List<CampReservation> list = (List<CampReservation>)map.get("list");
		
		System.out.println("콘솔 확인 : " + list);
		
		Integer totalcount = (Integer)map.get("totalCount");
		
		System.out.println("콘솔 확인 : " + totalcount);
		
	}
	

	//캠핑장 예약 통계 :: 일, 주, 월, 년, 전년일, 전년주, 전년월, 전년(O)
//	@Test
//	public void testReservationStatistics() throws Exception{
//		ReservationStatistics reservationStatistics = campReservationService.getReservationStatistics();
//		System.out.println("콘솔 확인 : " + reservationStatistics);
//	}

	//캠핑장 예약 통계 :: 총, 일, 주, 월, 년, 전년일, 전년주, 전년월, 전년(O)
	//@Test
	public void testReservationStatistics() throws Exception{
		ReservationStatistics reservationStatistics = campReservationService.getReservationStatistics();
		System.out.println("콘솔 확인 : " + reservationStatistics);
	}
	
	//캠핑장 별 일일 예약자수(O)
	//@Test
	public void testListCampReservationStatisticsByDay() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(campPageSize);
		search.setSearchKeyword("오감");
		search.setSortCondition("예약자 수 많은 순");
		
		Map<String, Object> map = campReservationService.listCampReservationStatisticsByDay(search);
		
		List<ReservationStatistics> listCampReservationByDay = (List<ReservationStatistics>)map.get("listCampReservationByDay");
		
		System.out.println("콘솔 확인 : " + listCampReservationByDay);
		
		Integer totalCampReservationCountByDay = (Integer)map.get("totalCampReservationCountByDay");
		
		System.out.println("콘솔 확인 : " + totalCampReservationCountByDay);
	}
	
	//캠핑장 별 주간 예약자수(O)
	//@Test
	public void testListCampReservationStatisticsByWeek() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(campPageSize);
		search.setSearchKeyword("오감");
		search.setSortCondition("예약자 수 많은 순");
		
		Map<String, Object> map = campReservationService.listCampReservationStatisticsByWeek(search);
		
		List<ReservationStatistics> listCampReservationByWeek = (List<ReservationStatistics>)map.get("listCampReservationByWeek");
		
		System.out.println("콘솔 확인 : " + listCampReservationByWeek);
		
		Integer totalCampReservationCountByWeek = (Integer)map.get("totalCampReservationCountByWeek");
		
		System.out.println("콘솔 확인 : " + totalCampReservationCountByWeek);
		
	}
	
	//캠핑장 별 월간 예약자수(O)
	//@Test
	public void testListCampReservationStatisticsByMonth() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(campPageSize);
		search.setSearchKeyword("오감");
		search.setSortCondition("예약자 수 많은 순");
		
		Map<String, Object> map = campReservationService.listCampReservationStatisticsByMonth(search);
		
		List<ReservationStatistics> listCampReservationByMonth = (List<ReservationStatistics>)map.get("listCampReservationByMonth");
		
		System.out.println("콘솔 확인 : " + listCampReservationByMonth);
		
		Integer totalCampReservationCountByMonth = (Integer)map.get("totalCampReservationCountByMonth");
		
		System.out.println("콘솔 확인 : " + totalCampReservationCountByMonth);
		
	}
	
	//예약 정보()
	//@Test
	public void testgetReservation() throws Exception{
		
		String reservationNo = "R00001";
		CampReservation campReservation = campReservationService.getReservation(reservationNo);
		
		System.out.println("콘솔 확인 : " + campReservation);
		
	}

}
