package site.gamsung.service.servicecenter.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
	
	@Test
	public void NoticeServiceTest() throws Exception {
		Notice notice = new Notice();
		User user = new User();
		user.setId("admin");
		
		notice.setWriter(user);
		notice.setNoticeTitle("JUnit Test 제목 입니다.");
		notice.setNoticeContent("JUnit Test 내용 입니다.");
		
		noticeDAO.addNotice(notice);
		
	}

}
