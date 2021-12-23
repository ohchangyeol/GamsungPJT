package site.gamsung.service.servicecenter.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.servicecenter.ReportService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
//										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class ReportServiceTest {

	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	
	@Test
	public void addQuestionServiceTest() throws Exception {

	}
	
	
	

}
