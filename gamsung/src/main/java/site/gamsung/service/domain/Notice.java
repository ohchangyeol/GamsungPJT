package site.gamsung.service.domain;

public class Notice {
	
	//Field
	private int noticeNo;
	private User writer;
	private String deleteFlag;
	private String noticeTitle;
	private String noticeContent;
	private int viewCount;
	private String regDate;
	private int campNo;
	private String campName;
	private String noticeFile1;
	private String noticeFile2;
	private String noticeFile3;
	private String noticeFile4;
	private String noticeFile5;
	
	
	// Constructor
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	// getter
	public int getNoticeNo() {
		return noticeNo;
	}
	public User getWriter() {
		return writer;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public int getViewCount() {
		return viewCount;
	}
	public int getCampNo() {
		return campNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public String getCampName() {
		return campName;
	}
	public String getNoticeFile1() {
		return noticeFile1;
	}
	public String getNoticeFile2() {
		return noticeFile2;
	}
	public String getNoticeFile3() {
		return noticeFile3;
	}
	public String getNoticeFile4() {
		return noticeFile4;
	}
	public String getNoticeFile5() {
		return noticeFile5;
	}
	
	//Setter
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public void setWriter(User writer) {
		this.writer = writer;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}
	public void setCampName(String campName) {
		this.campName = campName;
	}
	public void setNoticeFile1(String noticeFile1) {
		this.noticeFile1 = noticeFile1;
	}
	public void setNoticeFile2(String noticeFile2) {
		this.noticeFile2 = noticeFile2;
	}
	public void setNoticeFile3(String noticeFile3) {
		this.noticeFile3 = noticeFile3;
	}
	public void setNoticeFile4(String noticeFile4) {
		this.noticeFile4 = noticeFile4;
	}
	public void setNoticeFile5(String noticeFile5) {
		this.noticeFile5 = noticeFile5;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", writer=" + writer + ", deleteFlag=" + deleteFlag + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", viewCount=" + viewCount + ", regDate=" + regDate
				+ ", campNo=" + campNo + ", campName=" + campName + ", noticeFile1=" + noticeFile1 + ", noticeFile2="
				+ noticeFile2 + ", noticeFile3=" + noticeFile3 + ", noticeFile4=" + noticeFile4 + "], noticeFile5=" + noticeFile5 + "] \n";
	}
	
	
}
