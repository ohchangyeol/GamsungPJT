package site.gamsung.service.auction.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.auction.AuctionProductService;
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
public class AuctionProductServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	//경매 상품 출력 service test
	//@Test
	public void testListAuctionProduct() {
		
		Search search = new Search();
		search.setPageSize(10);
		search.setCurrentPage(2);
		
		List<AuctionProduct> list = auctionProductService.listAuctionProduct(search);
		
		for(AuctionProduct auctionProduct : list) {
			System.out.println(auctionProduct);
		}	
	}
	
	//상품 상세정보 조회 및 조회수 증가 service test
	//@Test
	public void testGetAuctionProduct() {
		
//		
//		Map<String, Object> map = auctionProductService.getAuctionProduct("PROD00010");
//		System.out.println(map.get("auctionProduct"));
//		System.out.println(map.get("auctionInfo"));
//		
	}
	
	//임시 저장된 상품 정보 조회 service test
	//@Test
	public void testGetTempSaveAuctionProduct() {
		
		AuctionProduct auctionProduct = auctionProductService.getTempSaveAuctionProduct("user1@gamsung.com");
		System.out.println(auctionProduct);
		
	}
	
	//임시저장 service test
	//@Test
	public void tempSaveAuctionProduct() {
		
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setRegistrantId("user1@gamsung.com");
		auctionProduct.setAuctionProductName("감자");
		auctionProduct.setStartBidPrice(10000);
		auctionProduct.setHopefulBidPrice(1000000);
		auctionProduct.setBidUnit(20000);
		auctionProduct.setAuctionStartTime("2021-12-30 15:00:00");
		auctionProduct.setAuctionEndTime("2021-12-25 19:00:00");
		auctionProduct.setHashtag1("#a");
		auctionProduct.setHashtag2("#b");
		auctionProduct.setHashtag3("#c");
		auctionProduct.setProductImg1("가나다123.jpg");
		auctionProductService.tempSaveAuctionProduct(auctionProduct);
		
	}
	
	//상품 등록 service test
	//@Test
	public void testAddAuctionProduct() {
		
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setAuctionProductNo("PROD00101");
		auctionProduct.setRegistrantId("user1@gamsung.com");
		auctionProduct.setAuctionProductName("감자");
		auctionProduct.setAuctionProductDetail("dididi");
		auctionProduct.setAuctionProductSubDetail("adada");
		auctionProduct.setStartBidPrice(10000);
		auctionProduct.setHopefulBidPrice(1000000);
		auctionProduct.setBidUnit(20000);
		auctionProduct.setAuctionStartTime("2021-12-30 15:00:00");
		auctionProduct.setAuctionEndTime("2021-12-30 19:00:00");
		auctionProduct.setHashtag1("#a");
		auctionProduct.setHashtag2("#b");
		auctionProduct.setHashtag3("#c");
		auctionProduct.setProductImg1("가나다123.jpg");
		auctionProduct.setProductImg2("aaaa.jpg");
		auctionProduct.setProductImg3("bbb123.jpg");
		auctionProduct.setProductImg4("ccc123.jpg");
		auctionProduct.setProductImg5("ddcc다123.jpg");
		
		auctionProductService.addAuctionProduct(auctionProduct);
		
//		Map<String, Object> map = auctionProductService.getAuctionProduct("PROD00001");
//		System.out.println(map.get("auctionProduct"));
		
	}
	
	//입찰 시도 service test
	//@Test
	public void testAuctionProductBid() {
		
		User user = new User();
		user.setId("user5@gamsung.com");
		user.setAuctionGrade(12);
		
		AuctionInfo auctionBidInfo = new AuctionInfo();
		auctionBidInfo.setUser(user);
		auctionBidInfo.setAuctionProductNo("PROD00101");
		
		//화면 단에서 처리 예정
		auctionBidInfo.setBidPrice(100000);
		
		auctionProductService.auctionProductBid(auctionBidInfo);
	}
	
	//경매 상태 업데이트 service test
	//@Test
	public void testUpdateAuctionProductCondition() {
		
		AuctionInfo auctionBidInfo = new AuctionInfo();
		auctionBidInfo.setAuctionProductNo("PROD00001");
		auctionBidInfo.setAuctionStatus("WITHDRAWAL");
		
		auctionProductService.updateAuctionProductCondition();
		
	}
	
	//
	//@Test
	public void testAddMainAuctionProduct() {
		
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setAuctionProductNo("PROD00006");
		auctionProduct.setAuctionEndTime("2021-12-21 03:00:00");
		String info = auctionProductService.addMainAuctionProduct(auctionProduct);
		System.out.println(info);
	}
	
	//@Test
	public void testListMainAuctionProduct() {
		
		List<AuctionProduct> list = auctionProductService.listMainAuctionProduct();
		for(AuctionProduct auctionProduct : list) {
			System.out.println(auctionProduct);
		}
		
	}
	
	//@Test
	public void testTempSaveAuctionProduct() {
		
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setRegistrantId("test44@nate.com");
		
		auctionProductService.tempSaveAuctionProduct(auctionProduct);
	}
	
	//@Test
	public void testUpdateAuctionProduct() {
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setRegistrantId("test44@nate.com");
		auctionProduct.setAuctionProductName("코멧 매직 30g, 5개");
		auctionProductService.updateAuctionProduct(auctionProduct);
	}
	
	@Test
	public void testDeleteAuctionProduct() {
		System.out.println(auctionProductService.deleteAuctionProduct("PROD00010")); 
	}
}
	