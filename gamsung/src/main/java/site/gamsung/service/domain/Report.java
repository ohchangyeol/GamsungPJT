package site.gamsung.service.domain;

public class Report {
	// Field
	private int reportNo;
	private String reportType;
	private String reportContent;
	private String deleteFlag;
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

	//Getter
	public int getReportNo() {
		return reportNo;
	}
	public String getReportType() {
		return reportType;
	}
	public String getReportContent() {
		return reportContent;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public User getSender() {
		return sender;
	}
	public User getReceiver() {
		return receiver;
	}
	public String getRegDate() {
		return regDate;
	}
	public String getCampName() {
		return campName;
	}
	public String getReportImgFile1() {
		return reportImgFile1;
	}
	public String getReportImgFile2() {
		return reportImgFile2;
	}
	public String getReportImgFile3() {
		return reportImgFile3;
	}

	//Setter
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public void setCampName(String campName) {
		this.campName = campName;
	}
	public void setReportImgFile1(String reportImgFile1) {
		this.reportImgFile1 = reportImgFile1;
	}
	public void setReportImgFile2(String reportImgFile2) {
		this.reportImgFile2 = reportImgFile2;
	}
	public void setReportImgFile3(String reportImgFile3) {
		this.reportImgFile3 = reportImgFile3;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportType=" + reportType + ", reportContent=" + reportContent
				+ ", deleteFlag=" + deleteFlag + ", reportStatus=" + reportStatus + ", sender=" + sender + ", receiver="
				+ receiver + ", regDate=" + regDate + ", campName=" + campName + ", reportImgFile1=" + reportImgFile1
				+ ", reportImgFile2=" + reportImgFile2 + ", reportImgFile3=" + reportImgFile3 + "]\n";
	}
}
