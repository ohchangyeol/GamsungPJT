package site.gamsung.service.auction.test;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
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
public class AuctionProductDAOTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired(required = false)
	@Qualifier("auctionProductDAO")
	private AuctionProductDAO auctionProductDAO;

	//경매 상품 list 호출 테스트
	//@Test
	public void testListAuctionProduct() {
		
		Search auctionSearch = new Search();
		auctionSearch.setSearchKeyword("텐");
		auctionSearch.setPageSize(8);
		auctionSearch.setCurrentPage(1);
		auctionSearch.setSortCondition("희망 낙찰가 낮은 순");
		List<AuctionProduct> list = auctionProductDAO.listAuctionProduct(auctionSearch);
		for(AuctionProduct auctionProduct : list) {
			System.out.println(auctionProduct);
		}
	}
	
	
	//임시저장 데이터 호출 테스트
	//@Test
	public void testGetTempSaveAuctionProduct() {
			
		AuctionProduct auctionProduct = auctionProductDAO.getTempSaveAuctionProduct("user2@gamsung.com");
		System.out.println(auctionProduct);
			
	}
	
	//임시 저장 테스트
	//@Test
	public void testTempSaveAuctionProduct() {
		
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setRegistrantId("user2@gamsung.com");
		auctionProduct.setIsTempSave("Y");
		
		auctionProductDAO.tempSaveAuctionProduct(auctionProduct);
	}
	
	//수정 및 경매 상품 정보 등록 Test
	//@Test
	public void testAddAuctionProduct() {
		
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setAuctionProductNo("PROD00015");
		auctionProduct.setRegistrantId("user1@gamsung.com");
		auctionProduct.setAuctionProductName("텐트");
		auctionProduct.setAuctionProductDatailA("너무 좋아요");
		auctionProduct.setAuctionStartTime("2021-12-23 15:00:00");
		auctionProduct.setAuctionEndTime("2021-12-25 15:00:00");
		auctionProduct.setHashtag1("1111");
		auctionProduct.setBidableGrade(12);
		auctionProduct.setBidUnit(1000);
		auctionProduct.setStartBidPrice(5000);
		auctionProduct.setProductImg1("111");
		
		auctionProductDAO.addAuctionProduct(auctionProduct);
		
	}
	
	//상품 정보 호출 테스트
	//@Test
	public void testGetAuctionProduct() {
		
		AuctionProduct auctionProduct = auctionProductDAO.getAuctionProduct("PROD00001");
		System.out.println(auctionProduct);
		
	}
	
	//상품 조회수 1증가 테스트
	//@Test
	public void testUpdateAuctionProductViewCounter() {
		
		auctionProductDAO.updateAuctionProductViewCounter("PROD00001");
		
		this.testGetAuctionProduct();
		
	}
		
	//회원 경매 정보 호출 테스트
	//@Test
	public void testAuctionProductBidUserInfo() {
		
		AuctionInfo auctionBidInfo = auctionProductDAO.auctionProductBidUserInfo("user2@gamsung.com");
		System.out.println(auctionBidInfo);
		
	}
	
	//경매 상품 10초 추가 테스트
	//@Test
	public void testUpdateBidEndTime() {
		
		auctionProductDAO.updateBidEndTime("PROD00001");
		
	}
	
	//입찰 내역 추가 test
	//@Test
	public void testAuctionProductBid() {
		
		AuctionInfo auctionBidInfo = new AuctionInfo();
		User user = new User();
		user.setId("user1@gamsung.com");
		auctionBidInfo.setUser(user);
		auctionBidInfo.setAuctionProductNo("PROD00015");
		auctionBidInfo.setBidPrice(100000);
		
		auctionProductDAO.auctionProductBid(auctionBidInfo);
		
	}
	
	//경매 상품 메인리스트에 추가
	//@Test
	public void testAddMainAuctionProduct() {
		
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setAuctionProductNo("PROD00001");
		auctionProduct.setAuctionEndTime("2021-12-20 23:59:59");
		
		auctionProductDAO.addMainAuctionProduct(auctionProduct);
		
	}

	//메인 경매 상품 목록 조회
	//@Test
	public void listMainAuctionProduct() {
		
		List<AuctionProduct> list = auctionProductDAO.listMainAuctionProduct();
		
		for(AuctionProduct auctionProduct : list) {
			System.out.println(auctionProduct);
		}
		
	}
}
	