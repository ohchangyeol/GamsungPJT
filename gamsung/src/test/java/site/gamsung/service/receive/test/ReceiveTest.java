package site.gamsung.service.receive.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Receive;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.domain.User;
import site.gamsung.service.transfer.ReceiveService;
/*
 *	FileName :  CommunityTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })

public class ReceiveTest {
	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI

	@Autowired
	@Qualifier("receiveServiceImpl")
	private ReceiveService receiveService;

	// @Test

	/* 양수글 등록 */
	public void testAddReceive() throws Exception {

	Receive receive = new Receive();

	Transfer transfer = new Transfer();
	transfer.setTransferNo(2);
	receive.setTransferNo(transfer);

	receive.setReceiveTitle("꼭한번양도받고싶습니다");
	receive.setReceiveContent("제 제일 친한친구가 생일이라서 꼭 같이 놀러가고싶어요");
	User user = new User();
	user.setId("user1@gamsung.com");
	receive.setTransferee(user);

	receive.setReceivePhone("01012345678");

	int RECEIVE = receiveService.addReceive(receive);

	System.out.println("RECEIVE:::::::::::::::::" + RECEIVE);

	}

	
	//@Test 
	public void testGetReceive() throws Exception {
	 	  
	int receiveNo = 1;
	  
	Receive Get = receiveService.getReceive(receiveNo);
	  
	System.out.println("Get:::::::::::::::::"+Get);
	  
	}
	  
	@Test 
	public void testUpdateReceive() throws Exception {
	  
	Receive receive = receiveService.getReceive(1);

	receive.setReceiveTitle("화장실가고싶다.");
	receive.setReceiveContent("다들 변비조심하세요");
	receive.setReceivePhone("12345678910");
	receive.setReceiveNo(1);
	  
	int RECEIVE = receiveService.updateReceive(receive);
	  
	System.out.println("RECEIVE:::::::::::::::::::::::::::::::::" + RECEIVE); 
	  
    }
	  

	//@Test
	public void testListReceive() throws Exception {

	Search search = new Search();
		
	search.setCurrentPage(1);
	search.setPageSize(10);
	
	search.setId("user1@gamsung.com");
	search.setRole("admin");
	search.setTransferNo(1);

	List<Receive> list = receiveService.listReceive(search);

	 //==> console 확인
	System.out.println("list::::::::::::::::"+list);
	System.out.println("=================================================================");
	}

	//@Test
	public void testUpdateTransferApproval() throws Exception {
	
	/* 양도&양수 승인시 Flag 처리*/
		
	int transferNo = 1;
	int Approval = receiveService.UpdateTransferApproval(transferNo);

	System.out.println("Approval::::" + Approval);
		

	}	
		
	//@Test
	public void testDeleteReceive() throws Exception {
	
	int blind = receiveService.blindReceive(1);
	int delete = receiveService.deleteReceive(2);

	System.out.println("blind::::" + blind);
	System.out.println("delete::::" + delete);	
		
	}

}
