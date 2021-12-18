package site.gamsung.service.common;

import java.util.List;

//==>리스트화면을 모델링(추상화/캡슐화)한 Bean 
public class Search {
	
	///Field
	private String searchCondition;
	private String sortCondition;
	private String searchKeyword;
	private List campAddr;
	private List circumstance;
	private List mainSite;
	private List subSite;
	private List theme;
	private String price;
	private int currentPage;
	private int pageSize;
	private int startRowNum;
	private int endRowNum;
	private int viewCount;
	private int reservationCount;
	
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
	
	//==> Select Query 시 ROWNUM 마지막 값 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	//==> Select Query 시 ROWNUM 시작 값
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	public String getSortCondition() {
		return sortCondition;
	}

	public void setSortCondition(String sortCondition) {
		this.sortCondition = sortCondition;
	}

	public List getCampAddr() {
		return campAddr;
	}

	public void setCampAddr(List campAddr) {
		this.campAddr = campAddr;
	}

	public List getCircumstance() {
		return circumstance;
	}

	public void setCircumstance(List circumstance) {
		this.circumstance = circumstance;
	}

	public List getMainSite() {
		return mainSite;
	}

	public void setMainSite(List mainSite) {
		this.mainSite = mainSite;
	}

	public List getSubSite() {
		return subSite;
	}

	public void setSubSite(List subSite) {
		this.subSite = subSite;
	}

	public List getTheme() {
		return theme;
	}

	public void setTheme(List theme) {
		this.theme = theme;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getReservationCount() {
		return reservationCount;
	}

	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + "]";
	}
}