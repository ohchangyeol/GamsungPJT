package site.gamsung.service.servicecenter.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.ReportWrapper;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.ReportDAO;
import site.gamsung.service.servicecenter.ReportService;
import site.gamsung.service.user.UserDAO;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService {
	
	// Field
	@Autowired
	@Qualifier("reportDAOImpl")
	private ReportDAO reportDAO;
	
	
	
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;

	// Constructor
	public ReportServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addReport(Report report) throws Exception {
		reportDAO.addReport(report);
	}

	@Override
	public Report getReport(int reportNo) throws Exception {
		return reportDAO.getReport(reportNo);
	}
	
	public ReportWrapper listReport(Search search) throws Exception {
		return new ReportWrapper( reportDAO.listReport(search),reportDAO.getTotalCount(search) );
	}

	@Override
	public void deleteReport(int reportNo) throws Exception{
		reportDAO.deleteReport(reportNo);
	}

	@Override
	public int notTotalCountReport() throws Exception{
		
		return reportDAO.notTotalCountReport();
	}

	@Override
	public int updateCodeReport(Report report) throws Exception {
		if(report.getReportStatus() == 1) {
			
			reportDAO.updateCodeReport(report);
			User receiver = userDAO.getUser(report.getReceiverId());
			
			System.out.println("\n\n Service Impl ==> "+ receiver);
			
			if(receiver.getReportTotalCount() >= 5) {
				System.out.println("신고 대상자 이용정지");
				userDAO.addSuspensionUser(receiver);
			}
			return 1;
		}else {
			reportDAO.updateCodeReport(report);
			return 2;
		}
		
		
	}

	@Override
	public User findReceiverId(Report report) {
		
		return reportDAO.findReceiverId(report);
	}
	
	
	
	
	
	
}
