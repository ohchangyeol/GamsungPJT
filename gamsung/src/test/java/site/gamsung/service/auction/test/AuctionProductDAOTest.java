package site.gamsung.service.auction.test;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.domain.AuctionProduct;



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
	@Qualifier("AuctionProductDAO")
	private AuctionProductDAO auctionProductDAO;

	@Test
	public void testAddProduct() throws Exception {
		AuctionProduct auctionProduct = new AuctionProduct();
		auctionProduct.setAuctionProductName("텐트");
		auctionProduct.setAuctionProductDatail("너무 좋아요");
		auctionProduct.setAuctionStartTime("2021-12-18 15:00:00");
		auctionProduct.setAuctionStartTime("2021-12-25 15:00:00");
		auctionProduct.setHashtag1("1111");
		auctionProduct.setBidableGrade(12);
		auctionProduct.setBidUnit(1000);
		auctionProduct.setStartBidPrice(5000);
		auctionProduct.setProductImg1("111");
		
		auctionProductDAO.addAuctionProduct(auctionProduct);
		
	}
		
		
}
	