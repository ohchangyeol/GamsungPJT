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
	private List price;
	private int currentPage;
	private int pageSize;
	private int offset;

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
	
	//==> Select Query 시 offset(검색 시작 행) 값
	public int getOffset() {
		return (getCurrentPage()-1)*getPageSize();
	}
	
	public void setOffset(int offset) {
		this.offset = offset;
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

	public List getPrice() {
		return price;
	}

	public void setPrice(List price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", sortCondition=" + sortCondition + ", searchKeyword="
				+ searchKeyword + ", campAddr=" + campAddr + ", circumstance=" + circumstance + ", mainSite=" + mainSite
				+ ", subSite=" + subSite + ", theme=" + theme + ", price=" + price + ", currentPage=" + currentPage
				+ ", pageSize=" + pageSize + ", offset=" + offset + "]";
	}

}