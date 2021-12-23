package site.gamsung.service.domain;

import java.util.List;

public class NoticeWrapper {

	// Field
	private List<Notice> notices;
	private int totalCount;
	
	// Constructor
	public NoticeWrapper() {
		// TODO Auto-generated constructor stub
	}
	public NoticeWrapper(List<Notice> notices, int totalCount) {
		this.notices = notices;
		this.totalCount = totalCount;
	}

	// Getter
	public List<Notice> getNotices() {
		return notices;
	}
	public int getTotalCount() {
		return totalCount;
	}
	@Override
	public String toString() {
		return "NoticeWrapper [notices=\n" + notices + ", totalCount=" + totalCount + "]";
	}
	
	
}
