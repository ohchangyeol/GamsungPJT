package site.gamsung.service.auction.test;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;


/*
 *	FileName :  AuctionInfoDAOTest.java
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
public class AuctionInfoDAOTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired(required = false)
	@Qualifier("auctionInfoDAO")
	private AuctionInfoDAO auctionInfoDAO;
	
	//응찰 관심 등록 error 발생 확인 필요/////////////////////////////
	//@Test
	public void testAddBidConcern() {
		
		AuctionInfo auctionBidInfo = new AuctionInfo();
		User user = new User();
		user.setId("user1@gamsung.com");
		auctionBidInfo.setUser(user);
		auctionBidInfo.setAuctionProductNo("PROD00001");
		
		auctionInfoDAO.addBidConcern(auctionBidInfo);
		
	}
	
	// 응찰 관심 활성화 체크 test
	//@Test
	public void testGetBidConcern() {
		
		AuctionInfo auctionBidInfo = new AuctionInfo();
		User user = new User();
		user.setId("user1@gamsung.com");
		auctionBidInfo.setUser(user);
		auctionBidInfo.setAuctionProductNo("PROD00001");
		
		int isActive = auctionInfoDAO.getBidConcern(auctionBidInfo);
		
		System.out.println(isActive);
	}
	
	// 응찰 관심 삭제 test
	//@Test
	public void testDeleteBidConcern() {
		AuctionInfo auctionBidInfo = new AuctionInfo();
		User user = new User();
		user.setId("user1@gamsung.com");
		auctionBidInfo.setUser(user);
		auctionBidInfo.setAuctionProductNo("PROD00001");
		
		auctionInfoDAO.deleteBidConcern(auctionBidInfo);
	}
	
	
	//응찰 관심 리스트 출력 test
	//@Test
	public void testListBidConcern() {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setOffset(10);
		search.setPageSize(10);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "user1@gamsung.com");
		map.put("search", search);
		List<AuctionInfo> list = auctionInfoDAO.listBidConcern(map);
		
		for(AuctionInfo auctionBidInfo : list) {
			System.out.println(auctionBidInfo);
		}
		
	}
	
	//role에 따라 상품 리스트 출력 test
	//@Test
	public void testListAuctionProductByRole() {
		
		User user = new User();
		user.setId("user1@gamsung.com");
		user.setRole("GENERAL");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10);
		search.setOffset(10);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("search", search);
		
		List<AuctionProduct> list = auctionInfoDAO.listAuctionProductByRole(map);
		
		for(AuctionProduct auctionProduct : list) {
			System.out.println(auctionProduct);
		}
		
	}
	
	//상품 입찰 내역 출력 test
	//@Test
	public void testAuctionHistory() {
		
		User user = new User();
		user.setId("user1@gamsung.com");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10);
		search.setOffset(10);
		
		AuctionInfo auctionBidInfo = new AuctionInfo();
		auctionBidInfo.setAuctionProductNo("PROD00001");
		auctionBidInfo.setUser(user);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("auctionBidInfo", auctionBidInfo);
		map.put("search", search);
		
		List<AuctionInfo> list = auctionInfoDAO.auctionHistory(map);
		
		for(AuctionInfo bidInfo : list) {
			System.out.println(bidInfo);
		}	
	}
	
	// 경매에 관련된 횟수 role에 따라 구분 test
	//@Test
	public void testAuctionStatusTotalCount() {
		
		User user = new User();
		user.setId("user1@gamsung.com");
		user.setRole("GENERAL");
//		user.setRole("ADMIN");
		
		AuctionInfo auctionBidInfo = auctionInfoDAO.auctionStatusTotalCount(user);
		System.out.println(auctionBidInfo);
	}
	
	//@Test
	public void testGetYearAuctionStatistics() {
		
		List<AuctionInfo> list = auctionInfoDAO.getYearAuctionStatistics();
		
		for(AuctionInfo auctionInfo : list) {
			System.out.println(auctionInfo);
		}
	}

	//user 경매 등급 출력 test
	//@Test
	public void getUserAuctionGradeInfo() {
		
		int userGrade = auctionInfoDAO.getUserAuctionGradeInfo("user1@gamsung.com");
		
		if(userGrade != 0) {
			System.out.println(userGrade); 
		}else {			
			System.out.println("사용자 정보 없음");
		}
		
		
	}
	
	//user 경매 등급 업데이트 test
	//@Test
	public void updateUserAuctionGrade() {
		
		User user = new User();
		user.setId("user1@gamsung.com");
		user.setAuctionGrade(12);
		
		auctionInfoDAO.updateUserAuctionGrade(user);
		
	}
	
	// 탈퇴회원 경매 상태 test
	//@Test
	public void testIsSecessionUserAuctionCondition() {
		
		System.out.println(auctionInfoDAO.isSecessionUserAuctionCondition("user1@gamsung.com")); 
		
	}
	
	
	@Test
	public void testGetBidderRanking() {
		
		AuctionInfo auctionInfo = new AuctionInfo();
		User user = new User();
		user.setId("TEST44@NATE.COM");
		auctionInfo.setUser(user);
		auctionInfo.setAuctionProductNo("PROD00001");
		
		auctionInfoDAO.getBidderRanking(auctionInfo);
		System.out.println(auctionInfoDAO.getBidderRanking(auctionInfo));
	}
	
}
	