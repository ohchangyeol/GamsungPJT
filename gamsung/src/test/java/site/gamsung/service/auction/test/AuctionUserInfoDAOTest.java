package site.gamsung.service.auction.test;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.auction.AuctionUserInfoDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionList;
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
public class AuctionUserInfoDAOTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired(required = false)
	@Qualifier("auctionUserInfoDAO")
	private AuctionUserInfoDAO auctionUserInfoDAO;
	
	//응찰 관심 리스트 출력 test
	//@Test
	public void testListBidConcern() {
		
		AuctionList auctionList = new AuctionList();
		auctionList.setStringdata("");
		List<AuctionBidInfo> list = auctionUserInfoDAO.listBidConcern("");
		
		for(AuctionBidInfo auctionBidInfo : list) {
			System.out.println(auctionBidInfo);
		}
		
	}
	
	//role에 따라 상품 리스트 출력
	//@Test
	public void testListAuctionProductByRole() {
		
		User user = new User();
		List<AuctionProduct> list = auctionUserInfoDAO.listAuctionProductByRole(user);
		
	}
	
	//@Test
	public void testAuctionHistory() {
		
		AuctionBidInfo auctionBidInfo = new AuctionBidInfo();
		List<AuctionBidInfo> list = auctionUserInfoDAO.AuctionHistory(auctionBidInfo);
		
	}
	
}
	