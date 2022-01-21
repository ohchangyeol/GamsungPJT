package site.gamsung.service.domain;

import java.util.List;

public class Transfer {
	
	private int transferNo; //
	
	private User transferOr; 
	
	private String transferRegdate; //
	
	private String transferTitle; // 
	
	
	private String transferArea; // 이거 모름 아직 안받음. 
	
	private String transferCampname; //
	
	private String transferMainsiteType; // add에서 안넘김 
	
	
	private String transferCampCall; // 
	
	
	private String transferStartDate; // 
	
	
	private String transferEndDate;//
	
	private int transferPrice; // 
	
	private String transferContent; // 
	
	private String transferAddContent;//
	
	private int transferUserNum; // 
	private String hashtag1;//
	private String hashtag2;//
	private String hashtag3;//
//	private String[] paymentImg = new String[2];
	private String paymentImg; // 
	
	private int transferStatus;  // 컨트롤러에서 변경. 
	
	private boolean deleteFlag; // 디폴트 n 
	
	private CampReservation transferReservationNo;//
	
	private int receiveStatus;
	
	private int receiveNo;
	
	private String receiveRegdate;
	
	private String receiveTitle;
	
	
	
	
	public int getTransferNo() {
		return transferNo;
	}
	public void setTransferNo(int transferNo) {
		this.transferNo = transferNo;
	}
	public User getTransferOr() {
		return transferOr;
	}
	public void setTransferOr(User transferOr) {
		this.transferOr = transferOr;
	}
	public String getTransferRegdate() {
		return transferRegdate;
	}
	public void setTransferRegdate(String transferRegdate) {
		this.transferRegdate = transferRegdate;
	}
	public String getTransferTitle() {
		return transferTitle;
	}
	public void setTransferTitle(String transferTitle) {
		this.transferTitle = transferTitle;
	}
	public String getTransferArea() {
		return transferArea;
	}
	public void setTransferArea(String transferArea) {
		this.transferArea = transferArea;
	}
	public String getTransferCampname() {
		return transferCampname;
	}
	public void setTransferCampname(String transferCampname) {
		this.transferCampname = transferCampname;
	}
	public String getTransferMainsiteType() {
		return transferMainsiteType;
	}
	public void setTransferMainsiteType(String transferMainsiteType) {
		this.transferMainsiteType = transferMainsiteType;
	}
	public String getTransferCampCall() {
		return transferCampCall;
	}
	public void setTransferCampCall(String transferCampCall) {
		this.transferCampCall = transferCampCall;
	}
	public String getTransferStartDate() {
		return transferStartDate;
	}
	public void setTransferStartDate(String transferStartDate) {
		this.transferStartDate = transferStartDate;
	}
	public String getTransferEndDate() {
		return transferEndDate;
	}
	public void setTransferEndDate(String transferEndDate) {
		this.transferEndDate = transferEndDate;
	}
	public int getTransferPrice() {
		return transferPrice;
	}
	public void setTransferPrice(int transferPrice) {
		this.transferPrice = transferPrice;
	}
	public String getTransferContent() {
		return transferContent;
	}
	public void setTransferContent(String transferContent) {
		this.transferContent = transferContent;
	}
	public String getTransferAddContent() {
		return transferAddContent;
	}
	public void setTransferAddContent(String transferAddContent) {
		this.transferAddContent = transferAddContent;
	}
	public int getTransferUserNum() {
		return transferUserNum;
	}
	public void setTransferUserNum(int transferUserNum) {
		this.transferUserNum = transferUserNum;
	}
	public String getHashtag1() {
		return hashtag1;
	}
	public void setHashtag1(String hashtag1) {
		this.hashtag1 = hashtag1;
	}
	public String getHashtag2() {
		return hashtag2;
	}
	public void setHashtag2(String hashtag2) {
		this.hashtag2 = hashtag2;
	}
	public String getHashtag3() {
		return hashtag3;
	}
	public void setHashtag3(String hashtag3) {
		this.hashtag3 = hashtag3;
	}

	public int getTransferStatus() {
		return transferStatus;
	}
	public void setTransferStatus(int transferStatus) {
		this.transferStatus = transferStatus;
	}
	public boolean isDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public CampReservation getTransferReservationNo() {
		return transferReservationNo;
	}
	public void setTransferReservationNo(CampReservation transferReservationNo) {
		this.transferReservationNo = transferReservationNo;
	}

	public String getPaymentImg() {
		return paymentImg;
	}
	public void setPaymentImg(String paymentImg) {
		this.paymentImg = paymentImg;
	}
	public int getReceiveStatus() {
		return receiveStatus;
	}
	public void setReceiveStatus(int receiveStatus) {
		this.receiveStatus = receiveStatus;
	}

	public int getReceiveNo() {
		return receiveNo;
	}
	public void setReceiveNo(int receiveNo) {
		this.receiveNo = receiveNo;
	}

	public String getReceiveRegdate() {
		return receiveRegdate;
	}
	public void setReceiveRegdate(String receiveRegdate) {
		this.receiveRegdate = receiveRegdate;
	}
	@Override
	public String toString() {
		return "Transfer [transferNo=" + transferNo + ", transferOr=" + transferOr + ", transferRegdate="
				+ transferRegdate + ", transferTitle=" + transferTitle + ", transferArea=" + transferArea
				+ ", transferCampname=" + transferCampname + ", transferMainsiteType=" + transferMainsiteType
				+ ", transferCampCall=" + transferCampCall + ", transferStartDate=" + transferStartDate
				+ ", transferEndDate=" + transferEndDate + ", transferPrice=" + transferPrice + ", transferContent="
				+ transferContent + ", transferAddContent=" + transferAddContent + ", transferUserNum="
				+ transferUserNum + ", hashtag1=" + hashtag1 + ", hashtag2=" + hashtag2 + ", hashtag3=" + hashtag3
				+ ", paymentImg=" + paymentImg + ", transferStatus=" + transferStatus + ", deleteFlag=" + deleteFlag
				+ ", transferReservationNo=" + transferReservationNo + ", receiveStatus=" + receiveStatus
				+ ", receiveNo=" + receiveNo + ", receiveRegdate=" + receiveRegdate + "]";
	}

	public String getReceiveTitle() {
		return receiveTitle;
	}
	public void setReceiveTitle(String receiveTitle) {
		this.receiveTitle = receiveTitle;
	}


	
	

}
