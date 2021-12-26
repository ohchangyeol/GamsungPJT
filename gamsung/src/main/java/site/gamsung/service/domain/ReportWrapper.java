package site.gamsung.service.domain;

import java.util.List;

public class ReportWrapper {
	
	// Filed
	private List<Report> reports;
	private int totalCount;
	
	
	// Constructor
	public ReportWrapper() {
	}
	public ReportWrapper(List<Report> reports, int totalCount) {
		super();
		this.reports = reports;
		this.totalCount = totalCount;
	}

	//Getter
	public List<Report> getReports() {
		return reports;
	}
	public int getTotalCount() {
		return totalCount;
	}

	@Override
	public String toString() {
		return "ReportWrapper [reports=\n" + reports + ", totalCount=" + totalCount + "]";
	}
	
}
