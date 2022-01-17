package site.gamsung.service.common;

import java.util.List;

import site.gamsung.service.domain.Payment;

public class Search {
	
	///Field
	private String searchCondition;
	private String sortCondition;
	private String searchKeyword;
	private String searchStartDate;
	private String searchEndDate;
	private String searchItemType;
	private int transferNo;
	private int campNo;
	private String role;
	private String id;
	private int reportTotalCount;
	private List<String> campAddr;
	private List<String> circumstance;
	private List<String> mainSite;
	private List<String> subSite;
	private List<String> theme;
	private List<String> price;
	private int currentPage;
	private int pageSize;
	private int startRowNum;
	private int endRowNum;	
	private int offset;	
	

	///Constructor
	public Search() {
	}
	
	///Method
	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSortCondition() {
		return sortCondition;
	}

	public void setSortCondition(String sortCondition) {
		this.sortCondition = sortCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchStartDate() {
		return searchStartDate;
	}
	
	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	
	public String getSearchEndDate() {
		return searchEndDate;
	}
	
	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}	
	
	public String getSearchItemType() {
		return searchItemType;
	}

	public void setSearchItemType(String searchItemType) {
		this.searchItemType = searchItemType;
	}
	
	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}
	
	public int getTransferNo() {
		return transferNo;
	}

	public void setTransferNo(int transferNo) {
		this.transferNo = transferNo;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<String> getCampAddr() {
		return campAddr;
	}

	public void setCampAddr(List<String> campAddr) {
		this.campAddr = campAddr;
	}

	public List<String> getCircumstance() {
		return circumstance;
	}

	public void setCircumstance(List<String> circumstance) {
		this.circumstance = circumstance;
	}

	public List<String> getMainSite() {
		return mainSite;
	}

	public void setMainSite(List<String> mainSite) {
		this.mainSite = mainSite;
	}

	public List<String> getSubSite() {
		return subSite;
	}

	public void setSubSite(List<String> subSite) {
		this.subSite = subSite;
	}

	public List<String> getTheme() {
		return theme;
	}

	public void setTheme(List<String> theme) {
		this.theme = theme;
	}

	public List<String> getPrice() {
		return price;
	}

	public void setPrice(List<String> price) {
		this.price = price;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	//==> Select Query 시 ROWNUM 시작 값
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1; 
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	//==> Select Query 시 ROWNUM 마지막 값 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();  
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	//==> Select Query 시 offset(검색 시작 행) 값
	public int getOffset() {
		return (getCurrentPage()-1)*getPageSize();
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getReportTotalCount() {
		return reportTotalCount;
	}

	public void setReportTotalCount(int reportTotalCount) {
		this.reportTotalCount = reportTotalCount;
	}

	@Override
	public String toString() {
		return "\n -- Search --"
			+ "\n [searchCondition] : " + searchCondition
			+ "\n [sortCondition] : " + sortCondition
			+ "\n [searchKeyword] : " + searchKeyword
			+ "\n [searchStartDate] : " + searchStartDate
			+ "\n [searchEndDate] : " + searchEndDate
			+ "\n [searchItemType] : " + searchItemType	
			+ "\n [campNo] : " + campNo	
			+ "\n [transferNo] : " + transferNo
			+ "\n [role] : " + role
			+ "\n [id] : " + id 
			+ "\n [campAddr] : " + campAddr 
			+ "\n [circumstance] : " + circumstance 
			+ "\n [mainSite] : " + mainSite 
			+ "\n [subSite] : " + subSite 
			+ "\n [theme] : " + theme 
			+ "\n [price] : " + price 		
			+ "\n [currentPage] : " + currentPage
			+ "\n [pageSize] : " + pageSize
			+ "\n [startRowNum] : " + startRowNum
			+ "\n [endRowNum] : " + endRowNum
			+ "\n [offset] : " + offset
			+ "\n ---------------- \n";
	}

}