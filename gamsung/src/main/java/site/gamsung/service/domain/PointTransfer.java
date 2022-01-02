package site.gamsung.service.domain;

public class PointTransfer {
	
	private String userId;
	private String senderId;
	private String receiverId;
	private String adminId;
	private int pointAmount;
	private int feeAmount;
	private String notice;	
	
	/// Default Constructor
	public PointTransfer() {
	}
	

	/// Getter / Setter	
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getSenderId() {
		return senderId;
	}


	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}


	public String getReceiverId() {
		return receiverId;
	}


	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}


	public String getAdminId() {
		return adminId;
	}


	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}


	public int getPointAmount() {
		return pointAmount;
	}


	public void setPointAmount(int pointAmount) {
		this.pointAmount = pointAmount;
	}


	public int getFeeAmount() {
		return feeAmount;
	}


	public void setFeeAmount(int feeAmount) {
		this.feeAmount = feeAmount;
	}


	public String getNotice() {
		return notice;
	}


	public void setNotice(String notice) {
		this.notice = notice;
	}
	

	// Override toString
	public String toString() {
		return "\n -- PointTransfer --"
			+ "\n [userId] : " + userId
			+ "\n [senderId] : " + senderId
			+ "\n [receiverId] : " + receiverId
			+ "\n [adminId] : " + adminId
			+ "\n [pointAmount] : " + pointAmount
			+ "\n [feeAmount] : " + feeAmount
			+ "\n [notice] : " + notice			
			+ "\n ---------------- \n";
	}

}
