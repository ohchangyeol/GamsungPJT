package site.gamsung.service.servicecenter.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.ReportWrapper;
import site.gamsung.service.servicecenter.ReportDAO;
import site.gamsung.service.servicecenter.ReportService;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService {
	
	// Field
	@Autowired
	@Qualifier("reportDAOImpl")
	private ReportDAO reportDAO;

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
	
	
	
}
