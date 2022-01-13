package site.gamsung.service.domain;

import java.util.List;

import site.gamsung.service.common.Search;

public class QnaWrapper {
	
	// Filed
	private List<Qna> Qnas;
	private int totalCount;
	private Search search;
	
	// Constructor
	public QnaWrapper() {
	}

	public QnaWrapper(List<Qna> qnas, int totalCount) {
		Qnas = qnas;
		this.totalCount = totalCount;
	}

	// Getter
	public List<Qna> getQnas() {
		return Qnas;
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
		return "QnaWrapper [Qnas=\n" + Qnas + ", totalCount=" + totalCount + "]";
	}
	
	
	
	
}
