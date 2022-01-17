package site.gamsung.service.domain;

public class Receive {

	private int receiveNo;
	private User transferee;	
	private String receiveRegdate;	
	private int receiveStatus;
	private String receiveTitle;	
	private String receiveContent;	
	private String receiveCancleDate;	
	private boolean deleteFlag;
	private String receivePhone;
	private Transfer transferNo;
	
	
	public int getReceiveNo() {
		return receiveNo;
	}
	public void setReceiveNo(int receiveNo) {
		this.receiveNo = receiveNo;
	}
	public User getTransferee() {
		return transferee;
	}
	public void setTransferee(User transferee) {
		this.transferee = transferee;
	}
	public String getReceiveRegdate() {
		return receiveRegdate;
	}
	public void setReceiveRegdate(String receiveRegdate) {
		this.receiveRegdate = receiveRegdate;
	}
	public int getReceiveStatus() {
		return receiveStatus;
	}
	public void setReceiveStatus(int receiveStatus) {
		this.receiveStatus = receiveStatus;
	}
	public String getReceiveTitle() {
		return receiveTitle;
	}
	public void setReceiveTitle(String receiveTitle) {
		this.receiveTitle = receiveTitle;
	}
	public String getReceiveContent() {
		return receiveContent;
	}
	public void setReceiveContent(String receiveContent) {
		this.receiveContent = receiveContent;
	}
	public String getReceiveCancleDate() {
		return receiveCancleDate;
	}
	public void setReceiveCancleDate(String receiveCancleDate) {
		this.receiveCancleDate = receiveCancleDate;
	}
	public boolean isDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getReceivePhone() {
		return receivePhone;
	}
	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}		
	public Transfer getTransferNo() {
		return transferNo;
	}
	public void setTransferNo(Transfer transferNo) {
		this.transferNo = transferNo;
	}
	
	@Override
	public String toString() {
		return "Receive [receiveNo=" + receiveNo + ", transferee=" + transferee + ", receiveRegdate=" + receiveRegdate
				+ ", receiveStatus=" + receiveStatus + ", receiveTitle=" + receiveTitle + ", receiveContent="
				+ receiveContent + ", receiveCancleDate=" + receiveCancleDate + ", deleteFlag=" + deleteFlag
				+ ", receivePhone=" + receivePhone + ", transferNo=" + transferNo + "]";
	}



}
