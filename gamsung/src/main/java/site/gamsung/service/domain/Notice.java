package service.domain;

public class Notice {
	
	//Field
	private int noticeNo;
	private User writer;
	private boolean deleteFlag;
	private String noticeTitle;
	private String noticeContent;
	private int viewCount;
	private String regDate;
	private int campNo;
	private String campName;
	private String noticeFile1;
	private String noticeFile2;
	private String noticeFile3;
	
	
	// Constructor
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	// getset
	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public User getUser() {
		return writer;
	}


	public void setUser(User user) {
		this.writer = user;
	}


	public boolean isDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
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


	public String getNoticeFile1() {
		return noticeFile1;
	}


	public void setNoticeFile1(String noticeFile1) {
		this.noticeFile1 = noticeFile1;
	}


	public String getNoticeFile2() {
		return noticeFile2;
	}


	public void setNoticeFile2(String noticeFile2) {
		this.noticeFile2 = noticeFile2;
	}


	public String getNoticeFile3() {
		return noticeFile3;
	}


	public void setNoticeFile3(String noticeFile3) {
		this.noticeFile3 = noticeFile3;
	}

	
	
}
