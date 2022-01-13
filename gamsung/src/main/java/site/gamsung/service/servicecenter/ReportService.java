package site.gamsung.service.servicecenter;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.ReportWrapper;
import site.gamsung.service.domain.User;

public interface ReportService {

	public void addReport ( Report report) throws Exception ;

	public Report getReport (int reportNo) throws Exception;

	public ReportWrapper listReport(Search search) throws Exception ;

	public void deleteReport(int reportNo) throws Exception;

	public int notTotalCountReport() throws Exception;

	public int updateCodeReport(Report report) throws Exception;

	public User findReceiverId(Report report);
}
