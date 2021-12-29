package site.gamsung.service.transfer.test;

import java.sql.Date;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.domain.User;
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

	 @Test
	public void testMyReservationList() throws Exception {

	Search search = new Search();
	String id = "user2@gamsung.com";
		
		 Map<String, Object> list	= campReservationService.listMyReservation(search, id);
		 System.out.println("list::::::::::"+list);
	}
	
	//@Test
		 public void testAddTransfer() throws Exception {

		Transfer transfer = new Transfer();	
		User user = new User();
		CampReservation campReservation = new CampReservation();
		
		
		transfer.setTransferTitle("오감자를 양도합니다."); //양도제목 1
		transfer.setTransferCampname("오감자");  //캠핑장명 2 
		transfer.setTransferMainsiteType("카라반");  //캠핑장메인시설 3 
		transfer.setTransferStartDate("2021-12-31");  //예약시작날짜 4 
		transfer.setTransferEndDate("2022-01-15");  //예약끝날짜 5 
		transfer.setTransferCampCall("03112345678");  //캠핑장번호 6 
		transfer.setTransferUserNum(5);  //예약인원 7
		transfer.setTransferPrice(10000);  //양도금액 8 
		transfer.setTransferContent("오감자와 오구마를 만나고싶다면 오감자네 카라반을 양도합니다");  //양도내용 9
		transfer.setTransferAddContent("오감자를 만나면 손을 흔들어주세요");  //양도특이사항  10 
		transfer.setPaymentImg("AABBCCDDEEFFGGHHIIJJKKLL");  //결제이미지 11
		transfer.setHashtag1("#오감자");  //해시태그1 12
		transfer.setHashtag2("#오구마");  //해시태그2 13 
		transfer.setHashtag3("#오사과");  //해시태그3 14 
		
		
		/*
		 * campReservation.setReservationNo("R00002");
		 * transfer.setTransferReservationNo(campReservation);
		 */
		
		user.setId("user2@gamsung.com");
		transfer.setTransferOr(user); //양도자 15
		
		int TRANSFER = transferService.addTransfer(transfer);
		
		System.out.println("TRANSFER:::::::::::::::::"+TRANSFER);
		
		
	}
	
		/*//@Test
		 public void testUpdateReservationStatus() throws Exception {
			 
			 
		if (reservation_status =! null && 
		CampReservation campReservation = new CampReservation();
		campReservation.setReservationNo("R00005");
		
		
		
		int TRANSFER = transferService.addTransfer(transfer);
		
		System.out.println("TRANSFER:::::::::::::::::"+TRANSFER);*/
		
		
}

