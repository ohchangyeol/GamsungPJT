package site.gamsung.service.domain;

public class PointTransfer {
	
	private String userId;
	private String senderId;
	private String receiverId;
	private String adminId;
	private int pointAmount;
	private int feeRate;
	
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

	public int getFeeRate() {
		return feeRate;
	}

	public void setFeeRate(int feeRate) {
		this.feeRate = feeRate;
	}

	// Override toString
	public String toString() {
		return "\n -- PointTransfer --"
			+ "\n [userId] : " + userId
			+ "\n [senderId] : " + senderId
			+ "\n [receiverId] : " + receiverId
			+ "\n [adminId] : " + adminId
			+ "\n [pointAmount] : " + pointAmount
			+ "\n [feeRate] : " + feeRate
			+ "\n ---------------- \n";
	}

}
