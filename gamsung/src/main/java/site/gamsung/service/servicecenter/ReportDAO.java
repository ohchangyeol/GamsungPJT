package site.gamsung.service.servicecenter;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Report;

public interface ReportDAO {

	public void addReport ( Report report) throws Exception ;

	public Report getReport (int reportNo) throws Exception;
	
	public List<Report> listReport(Search search) throws Exception;

	// TOTALCOUNT
	public int getTotalCount(Search search) throws Exception ;

	public void deleteReport(int reportNo) throws Exception;

	public int notTotalCountReport() throws Exception;

	public void updateCodeReport(Report report);
}
