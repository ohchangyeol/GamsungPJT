package site.gamsung.service.servicecenter.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.NoticeDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
//										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class NoticeServiceTest {

	@Autowired
	@Qualifier("noticeDAOImpl")
	private NoticeDAO noticeDAO;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	
	//@Test
	public void addNoticeServiceTest() throws Exception {
		Notice notice = new Notice();
		User user = new User();
		
		user.setId("admin");
		notice.setWriter(user);
		notice.setNoticeTitle("JUnit Test 제목 입니다.");
		notice.setNoticeContent("JUnit Test 내용 입니다.");
		
		noticeDAO.addNotice(notice);
	}
	
	//@Test
	public void getNoticeServiceTest() throws Exception {
		Notice notice = noticeDAO.getNotice(2);
		System.out.println("==> "+ notice);
	}
	
	@Test
	public void listNoticeServiceTest() throws Exception {
		Search search = new Search();
		
		 search.setCurrentPage(1); 
		 search.setPageSize(pageSize);
		 
		 System.out.println("==> Search : " + search);
		 
		 List<Notice> list = noticeDAO.listProductList(search);
		 
		 System.out.println(list);
		 
	}

}
