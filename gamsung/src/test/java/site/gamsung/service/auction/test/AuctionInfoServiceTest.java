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

import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =  {"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class AuctionInfoServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired(required = false)
	@Qualifier("auctionInfoService")
	private AuctionInfoService auctionInfoService;
	
	//응찰 관심 등록을 확인하여 취소 및 조회 test
	//@Test
	public void testAddBidConcern() {
		
		AuctionInfo auctionBidInfo = new AuctionInfo();
		User user = new User();
		user.setId("user1@gamsung.com");
		auctionBidInfo.setUser(user);
		auctionBidInfo.setAuctionProductNo("PROD00001");
		
		String info = auctionInfoService.addBidConcern(auctionBidInfo);
		
		System.out.println(info);
	}
	
	//응찰 관심을 등록한 상품을 출력 test
	//@Test
	@SuppressWarnings("unchecked")
	public void testListBidConcern() {
		
		User user = new User();
		user.setId("test44@test.com");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setOffset(10);
		search.setPageSize(10);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("search", search);
		
		map = auctionInfoService.listBidConcern(map);
		List<AuctionInfo> list = (List<AuctionInfo>) map.get("list");
		int count = (int) map.get("totalCount");
		
		System.out.println(count);
		
		for(AuctionInfo auctionInfo : list) {
			System.out.println(auctionInfo);
		}
	}
	
	//role에 따라 상품 리스트를 출력해줌, 마이페이지, 관리자페이지 test
	//@Test
	public void testListAuctionProductByRole() {
		
		User user = new User();
		user.setId("user1@gamsung.com");
		user.setRole("ADMIN");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10);
		search.setOffset(10);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("search", search);
		
//		List<AuctionProduct> list = auctionInfoService.listAuctionProductByRole(map);
//		
//		for(AuctionProduct auctionProduct : list) {
//			System.out.println(auctionProduct);
//		}
		
	}
	
	//상품 입찰 내역 출력 test
	//@Test
	public void testAuctionHistory() {
		
		User user = new User();
		user.setId("aa@a.com");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10);
		search.setOffset(10);
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setUser(user);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("auctionInfo", auctionInfo);
		map.put("search", search);
		
		auctionInfoService.auctionHistory(map);
			
	}
	
	//경매 통계 출력 test
	@Test
	@SuppressWarnings("unchecked")
	public void testGetAuctionStatistics() {
		
		Map<String, Object> map = auctionInfoService.getAuctionStatistics();
		
		List<String> yearList = (List<String>)map.get("yearList");
		List<String> lastYearList = (List<String>)map.get("lastYearList");
		List<String> currentYearList = (List<String>)map.get("currentYearList");
			
		for(String str : yearList) {
			System.out.println("yearList : "+str+"\n");
		}
		
		for(String str : lastYearList) {
			System.out.println("lastYearList : "+str+"\n");
		}
		
		for(String str : currentYearList) {
			System.out.println("currentYearList : "+str+"\n");
		}
	
	}
	
	//@Test
	public void testGetBidderRanking() {
		
		User user = new User();
		user.setId("user1@gamsung.com");

		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo("PROD00001");
		auctionInfo.setUser(user);
		
		auctionInfoService.getBidderRanking(auctionInfo);
		
	}
	
	//@Test
	public void testCheckAndUpdateUserGrade() {
		
		User user = new User();
		user.setId("yim3370@gmail.com");
		user.setRole("GENERAL");
		auctionInfoService.checkAndUpdateUserAuctionGrade(user);
	}


}
