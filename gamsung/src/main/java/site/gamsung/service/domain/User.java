package site.gamsung.service.domain;

import java.sql.Date;

public class User {
	
	///Field
	private String role;
	private String id;
	private String password;
	private String salt;
	private String name;
	private String nickName;
	private String campName;
	private String campCall;
	private String phone;
	private String addr;
	private Date addUserRegDate;
	private int reportTotalCount;
	private Date currentLoginRegDate;
	private Date dormantConversionDate;
	private Date suspensionDate;
	private String suspensionContent;
	private Date secessionRegDate;
	private int countCancelReceive;
	private Date receiveProhibitionEndDate;
	private int auctionGrade;	
	private String campBusinessNum;
	private int havingPoint;
	private String bank;
	private String accountHolder;
	private String accountNum;
	private String businessUserApprovalFlag;
	private String auctionSuspension;
	private String snsId;
	private String campBusinessImg;
		
	///Constructor
	public User() {
	}

	///Method
	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
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


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public Date getAddUserRegDate() {
		return addUserRegDate;
	}


	public void setAddUserRegDate(Date addUserRegDate) {
		this.addUserRegDate = addUserRegDate;
	}


	public int getReportTotalCount() {
		return reportTotalCount;
	}


	public void setReportTotalCount(int reportTotalCount) {
		this.reportTotalCount = reportTotalCount;
	}


	public Date getCurrentLoginRegDate() {
		return currentLoginRegDate;
	}


	public void setCurrentLoginRegDate(Date currentLoginRegDate) {
		this.currentLoginRegDate = currentLoginRegDate;
	}


	public Date getDormantConversionDate() {
		return dormantConversionDate;
	}


	public void setDormantConversionDate(Date dormantConversionDate) {
		this.dormantConversionDate = dormantConversionDate;
	}


	public Date getSuspensionDate() {
		return suspensionDate;
	}


	public void setSuspensionDate(Date suspensionDate) {
		this.suspensionDate = suspensionDate;
	}


	public String getSuspensionContent() {
		return suspensionContent;
	}


	public void setSuspensionContent(String suspensionContent) {
		this.suspensionContent = suspensionContent;
	}


	public Date getSecessionRegDate() {
		return secessionRegDate;
	}


	public void setSecessionRegDate(Date secessionRegDate) {
		this.secessionRegDate = secessionRegDate;
	}


	public int getCountCancelReceive() {
		return countCancelReceive;
	}

	public void setCountCancelReceive(int countCancelReceive) {
		this.countCancelReceive = countCancelReceive;
	}

	public Date getReceiveProhibitionEndDate() {
		return receiveProhibitionEndDate;
	}


	public void setReceiveProhibitionEndDate(Date receiveProhibitionEndDate) {
		this.receiveProhibitionEndDate = receiveProhibitionEndDate;
	}


	public int getAuctionGrade() {
		return auctionGrade;
	}


	public void setAuctionGrade(int auctionGrade) {
		this.auctionGrade = auctionGrade;
	}


	public String getcampBusinessNum() {
		return campBusinessNum;
	}


	public void setcampBusinessNum(String campBusinessNum) {
		this.campBusinessNum = campBusinessNum;
	}


	public int getHavingPoint() {
		return havingPoint;
	}


	public void setHavingPoint(int havingPoint) {
		this.havingPoint = havingPoint;
	}


	public String getBank() {
		return bank;
	}


	public void setBank(String bank) {
		this.bank = bank;
	}


	public String getAccountHolder() {
		return accountHolder;
	}


	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}


	public String getAccountNum() {
		return accountNum;
	}


	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}


	public String getBusinessUserApprovalFlag() {
		return businessUserApprovalFlag;
	}

	public void setBusinessUserApprovalFlag(String businessUserApprovalFlag) {
		this.businessUserApprovalFlag = businessUserApprovalFlag;
	}
	
	public String getAuctionSuspension() {
		return auctionSuspension;
	}

	public void setAuctionSuspension(String auctionSuspension) {
		this.auctionSuspension = auctionSuspension;
	}

	public String getSnsId() {
		return snsId;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}

	public String getCampBusinessImg() {
		return campBusinessImg;
	}

	public void setCampBusinessImg(String campBusinessImg) {
		this.campBusinessImg = campBusinessImg;
	}

	@Override
	public String toString() {
		return "User [role=" + role + ", id=" + id+ ", salt=" + salt + ", name=" + name
				+ ", nickName=" + nickName + ", campName=" + campName + ", campCall=" + campCall + ", phone=" + phone
				+ ", addr=" + addr + ", addUserRegDate=" + addUserRegDate + ", reportTotalCount=" + reportTotalCount
				+ ", currentLoginRegDate=" + currentLoginRegDate + ", dormantConversionDate=" + dormantConversionDate
				+ ", suspensionDate=" + suspensionDate + ", suspensionContent=" + suspensionContent
				+ ", secessionRegDate=" + secessionRegDate + ", countCancelReceive=" + countCancelReceive
				+ ", receiveProhibitionEndDate=" + receiveProhibitionEndDate + ", auctionGrade=" + auctionGrade
				+ ", campBusinessNum=" + campBusinessNum + ", havingPoint=" + havingPoint + ", bank=" + bank
				+ ", accountHolder=" + accountHolder + ", accountNum=" + accountNum + ", businessUserApprovalFlag="
				+ businessUserApprovalFlag + ", auctionSuspension=" + auctionSuspension + ", snsId=" + snsId + "]";
	}
	
}
