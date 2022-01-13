package site.gamsung.service.domain;

public class Report {
	// Field
	private int reportNo;
	private int reportType;
	private String reportContent;
	private String deleteFlag;
	private int reportStatus;
	private User sender;
	private User receiver;
	private String regDate;
	private String receiverCampName;
	private String receiverNickName;
	private String reportImgFile1;
	private String reportImgFile2;
	private String reportImgFile3;
	private String reportTypeName;
	private String receiverId;
	
	
	
	
	// Constructor
	public Report() {
		// TODO Auto-generated constructor stub
	}

	//Getter
	public int getReportNo() {
		return reportNo;
	}
	public int getReportType() {
		return reportType;
	}
	public String getReportContent() {
		return reportContent;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public int getReportStatus() {
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
	public String getReceiverCampName() {
		return receiverCampName;
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
	public String getReportTypeName() {
		return reportTypeName;
	}
	public String getReceiverNickName() {
		return receiverNickName;
	}
	
	

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	//Setter
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public void setReportType(int reportType) {
		this.reportType = reportType;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public void setReportStatus(int reportStatus) {
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
	public void setReceiverCampName(String receiverCampName) {
		this.receiverCampName = receiverCampName;
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
	public void setReportTypeName(String reportTypeName) {
		this.reportTypeName = reportTypeName;
	}
	public void setReceiverNickName(String receiverNickName) {
		this.receiverNickName = receiverNickName;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportType=" + reportType + ", reportContent=" + reportContent
				+ ", deleteFlag=" + deleteFlag + ", reportStatus=" + reportStatus + ", sender=" + sender + ", receiver="
				+ receiver + ", regDate=" + regDate + ", receiverCampName=" + receiverCampName + ", receiverNickName="
				+ receiverNickName + ", reportImgFile1=" + reportImgFile1 + ", reportImgFile2=" + reportImgFile2
				+ ", reportImgFile3=" + reportImgFile3 + ", reportTypeName=" + reportTypeName + ", receiverId="
				+ receiverId + "]";
	}

	
	
	
}
