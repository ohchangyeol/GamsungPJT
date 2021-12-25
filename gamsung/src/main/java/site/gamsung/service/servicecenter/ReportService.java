package site.gamsung.service.servicecenter;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.ReportWrapper;

public interface ReportService {

	public void addReport ( Report report) throws Exception ;

	public Report getReport (int reportNo) throws Exception;

	public ReportWrapper listReport(Search search) throws Exception ;
}
