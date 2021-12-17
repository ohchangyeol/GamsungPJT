package site.gamsung.service.domain;

public class Report {
	// Field
	private int reportNo;
	private String reportType;
	private String reportContent;
	private boolean deleteFlag;
	private String reportStatus;
	private User sender;
	private User receiver;
	private String regDate;
	private String campName;
	private String reportImgFile1;
	private String reportImgFile2;
	private String reportImgFile3;
	
	
	// Constructor
	public Report() {
		// TODO Auto-generated constructor stub
	}


	public int getReportNo() {
		return reportNo;
	}


	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}


	public String getReportType() {
		return reportType;
	}


	public void setReportType(String reportType) {
		this.reportType = reportType;
	}


	public String getReportContent() {
		return reportContent;
	}


	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}


	public boolean isDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public String getReportStatus() {
		return reportStatus;
	}


	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}


	public User getSender() {
		return sender;
	}


	public void setSender(User sender) {
		this.sender = sender;
	}


	public User getReceiver() {
		return receiver;
	}


	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getCampName() {
		return campName;
	}


	public void setCampName(String campName) {
		this.campName = campName;
	}


	public String getReportImgFile1() {
		return reportImgFile1;
	}


	public void setReportImgFile1(String reportImgFile1) {
		this.reportImgFile1 = reportImgFile1;
	}


	public String getReportImgFile2() {
		return reportImgFile2;
	}


	public void setReportImgFile2(String reportImgFile2) {
		this.reportImgFile2 = reportImgFile2;
	}


	public String getReportImgFile3() {
		return reportImgFile3;
	}


	public void setReportImgFile3(String reportImgFile3) {
		this.reportImgFile3 = reportImgFile3;
	}

	
}
