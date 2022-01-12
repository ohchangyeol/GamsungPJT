package site.gamsung.service.domain;

import java.util.List;

import site.gamsung.service.common.Search;

public class ReportWrapper {
	
	// Filed
	private List<Report> reports;
	private int totalCount;
	private Search search;
	
	
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
	public Search getSearch() {
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "ReportWrapper [reports=\n" + reports + ", totalCount=" + totalCount + "]";
	}
	
}
