package site.gamsung.service.servicecenter.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.domain.QnaWrapper;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.QnaService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
//										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class QnaServiceTest {

	@Autowired
	@Qualifier("qnaServiceImpl")
	private QnaService qnaService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	
	//@Test
	public void addQuestionServiceTest() throws Exception {
		User user = new User();
		user.setId("user5@gamsung.com");
		user.setNickName("이젤라");
		
		Qna qna = new Qna();
		qna.setSender(user);
		qna.setQuestionTitle("제가 이 프로젝트를 언제 끝낼수 있을까요?");
		qna.setQuestionContent("해당 질문에 대한 내용입니다.");
		
		qna.setCampNo(10001);
		qna.setCampName("오감자");
		
		System.out.println("==> QnA : " + qna);
		qnaService.addQuestion(qna);
	}
	
	//@Test
	public void addAnswerServiceTest() throws Exception {
		User receiver = new User();
		receiver.setId("admin");
		
		Qna qna = qnaService.getQna(4);
		qna.setAnswerContent("Junit test 내용 입니다.");
		qna.setReceiver(receiver);
		
		System.out.println("==> QnA : " + qna);
		qnaService.addAnswer(qna);
	}
	
	//@Test
	public void getQnaServiceTest() throws Exception {
		int qnaNo = 10;
		qnaService.updateViewCount(qnaNo);
		Qna qna = qnaService.getQna(qnaNo);
		
		System.out.println("==> QnA : "+ qna);
	}
	
	//@Test
	public void deleteQnaServiceTest() throws Exception {
		int qnaNo = 11;
		qnaService.deleteQna(qnaNo);
		
		Qna qna = qnaService.getQna(qnaNo);
		
		System.out.println("==> delete QnA : "+ qna);
	}
	
	//@Test
	public void notTotalCountServiceTest() throws Exception {
		int notTotalCount = qnaService.notTotalCountQna();
		System.out.println("==> not QnA : "+ notTotalCount);
	}
	
	@Test
	public void listQnaServiceTest() throws Exception {
		Search search = new Search();
				
		search.setCurrentPage(1); 
		search.setPageSize(pageSize);
		 
		search.setId("user5@gamsung.com");
		//제목 + 내용 검색
//		search.setSearchCondition("0");
//		search.setSearchKeyword("내용");
		 
		// 제목 
//		search.setSearchCondition("1");
//		search.setSearchKeyword("테이블");
		
		// 내용
//		search.setSearchCondition("2");
//		search.setSearchKeyword("내용");
		
		//캠핑장일 경우
		search.setCampNo(10001);
		QnaWrapper wrapper = qnaService.listQna(search);
		
		System.out.println("==> list QnA : "+ wrapper);
	}
	
	
	
	

}
