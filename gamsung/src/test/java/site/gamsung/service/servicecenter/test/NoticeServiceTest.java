package site.gamsung.service.servicecenter.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.NoticeWrapper;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.NoticeService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
//										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class NoticeServiceTest {

	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService noticeService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	
	//@Test
	public void addNoticeServiceTest() throws Exception {
		Notice notice = new Notice();
		User user = new User();
		
		user.setId("admin");
		notice.setWriter(user);
		notice.setNoticeTitle("camp가 null 들어가는지 test");
		notice.setNoticeContent("JUnit Test 내용 입니다.");
		
		noticeService.addNotice(notice);
	}
	
	//@Test
	//@Transactional(readOnly = false)
	public void getNoticeServiceTest() throws Exception {
		
		noticeService.updateViewCount(2);
		Notice notice = noticeService.getNotice(2);
		
		
		System.out.println("==> "+ notice);
	}
	
	@Test
	public void listNoticeServiceTest() throws Exception {
		Search search = new Search();
		
		search.setCurrentPage(1); 
		search.setPageSize(pageSize);
		 
		//제목 + 내용 검색
		search.setSearchCondition("0");
		search.setSearchKeyword("공지");
		 
		// 제목 
//		search.setSearchCondition("1");
//		search.setSearchKeyword("테이블");
		
		// 내용
//		search.setSearchCondition("2");
//		search.setSearchKeyword("내용");
		
		//캠핑장일 경우
		search.setCampNo(10000);
		 
		System.out.println("==> Search : " + search);
		
		NoticeWrapper wrapper = noticeService.listNotice(search);
		
		System.out.println(wrapper);
		
	}
	
	//@Test
	public void updateNoticeServiceTest() throws Exception {
		Notice notice = noticeService.getNotice(5);
		
		notice.setNoticeTitle("존나 짜증나는 상태입니다.");
		notice.setNoticeContent("mySQL은 재밌지만 오류는 짜증이 납니다");
		
		noticeService.updateNotice(notice);
		
		notice = noticeService.getNotice(5);
		
		System.out.println("==> "+ notice);
	}
	
	//@Test
	public void deleteNoticeServiceTest() throws Exception {
		noticeService.deleteNotice(5);
	}
	

}
