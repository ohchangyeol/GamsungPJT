package service.domain;

public class BusinessUser {
	
	///Field
	private String businessUserId;
	private String campName;
	private String campCall;
	private String campAddr; 
	private String tourismBusinessNum;
	private Boolean businessUserApprovalFlag;
	private CommonUser commonUser;
	
	///Constructor
	public BusinessUser() {
		// TODO Auto-generated constructor stub
	}

	///Method
	public String getBusinessUserId() {
		return businessUserId;
	}

	public void setBusinessUserId(String businessUserId) {
		this.businessUserId = businessUserId;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}

	public String getCampCall() {
		return campCall;
	}

	public void setCampCall(String campCall) {
		this.campCall = campCall;
	}

	public String getCampAddr() {
		return campAddr;
	}

	public void setCampAddr(String campAddr) {
		this.campAddr = campAddr;
	}

	public String getTourismBusinessNum() {
		return tourismBusinessNum;
	}

	public void setTourismBusinessNum(String tourismBusinessNum) {
		this.tourismBusinessNum = tourismBusinessNum;
	}
	
	public CommonUser getCommonUser() {
		return commonUser;
	}

	public void setCommonUser(CommonUser commonUser) {
		this.commonUser = commonUser;
	}
	
}
