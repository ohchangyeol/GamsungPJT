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
import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.ReportWrapper;
import site.gamsung.service.domain.User;
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
	
	
	//@Test
	public void addReportServiceTest() throws Exception {
		Report report = new Report();
		User sender  = new User();
		User receiver = new User();
		
		//회원
		sender.setId("user1@gamsung.com");
		sender.setRole("GENERAL");
		receiver.setId("user4@gamsung.com");
		
		// 회원 => 캠핑장신고
//		receiver.setId("businessuser1@gamsung.com");
//		report.setReceiverCampName("갤럭시");

		
		//캠핑장
//		sender.setId("businessuser1@gamsung.com");
//		sender.setRole("BUSINESS");
//		receiver.setId("user4@gamsung.com");

		
		report.setReceiver(receiver);
		report.setSender(sender);
		report.setReportType(3);
		report.setReportContent("가나다");
		reportService.addReport(report);
	}
	
	//@Test
	public void getReportServiceTest() throws Exception {
		int reportNo = 3;
		Report report = reportService.getReport(reportNo);
		
		System.out.println("==> report : "+ report);
	}
	
	//@Test
	public void listReportServiceTest() throws Exception {
		Search search = new Search();
		
		search.setCurrentPage(1); 
		search.setPageSize(pageSize);
		 
		search.setId("admin");
		
		//search.setSearchCondition("3");
		search.setSortCondition("status");
		
		System.out.println("####################" + search);
		
		ReportWrapper wrapper = reportService.listReport(search);
		
		System.out.println("==> report wrapper : "+ wrapper);
	}
	
	//@Test
	public void deleteReportServiceTest() throws Exception {
		int reportNo = 15;
		reportService.deleteReport(reportNo);
	}
	
//	@Test
	public void notTotalCountServiceTest() throws Exception {
		int notTotalCount = reportService.notTotalCountReport();
		System.out.println("==> not report : "+ notTotalCount);
	}
	
	@Test
	public void updateCodeServiceTest() throws Exception {
		Report report = new Report();
		report.setReportNo(2);
		// 신고 처리 완료
		report.setReportStatus(1);
		
		// 신고 처리 거부
//		report.setReportStatus(2);
		
		reportService.updateCodeReport(report);
	}
	
	
	
	

	
	
	
	
	
	
	
	

}
