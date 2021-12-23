package site.gamsung.service.common;

import java.util.List;

//==>리스트화면을 모델링(추상화/캡슐화)한 Bean 
public class Search {
	
	///Field
	private String searchCondition;
	private String sortCondition;
	private String searchKeyword;
	private String role;
	private String id;
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
	private int campNo;
	private String campName;

	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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

	//==> Select Query 시 offset(검색 시작 행) 값
	public int getOffset() {
		return (getCurrentPage()-1)*getPageSize();
	}
	
	public String getSortCondition() {
		return sortCondition;
	}

	public void setSortCondition(String sortCondition) {
		this.sortCondition = sortCondition;
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

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	
	//==> Select Query 시 ROWNUM 마지막 값 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	//==> Select Query 시 ROWNUM 시작 값
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", sortCondition=" + sortCondition + ", searchKeyword="
				+ searchKeyword + ", role=" + role + ", id=" + id + ", campAddr=" + campAddr + ", circumstance="
				+ circumstance + ", mainSite=" + mainSite + ", subSite=" + subSite + ", theme=" + theme + ", price="
				+ price + ", currentPage=" + currentPage + ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", offset=" + offset + ", startRowNum=" + startRowNum + "]";
	}

}