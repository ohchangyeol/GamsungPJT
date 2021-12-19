package site.gamsung.service.domain;

public class AuctionSearch {
	
	private String sortCondition;
	private String searchKeyword;
	private int currentPage;
	private int pageSize;
	private int offset;
	
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
	public int getOffset() {
		return (currentPage-1)*pageSize;
	}
	@Override
	public String toString() {
		return "aucSearch [sortCondition=" + sortCondition + ", searchKeyword=" + searchKeyword + ", currentPage="
				+ currentPage + ", pageSize=" + pageSize + ", offset=" + offset + "]";
	}
	
}
