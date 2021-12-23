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
	private String tourismBusinessNum;
	private int havingPoint;
	private String bank;
	private String accountHolder;
	private String accountNum;
	private String businessUserApprovalFlag;
		
		
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


	public String getTourismBusinessNum() {
		return tourismBusinessNum;
	}


	public void setTourismBusinessNum(String tourismBusinessNum) {
		this.tourismBusinessNum = tourismBusinessNum;
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

	@Override
	public String toString() {
		return "User [role="+role+", id="+id+", name="+name+", nickName="+nickName+
				", campName="+campName+", campCall="+campCall+", phone="+phone+", addr="+
				addr+", addUserRegDate="+addUserRegDate+", reportTotalCount="+reportTotalCount+
				", currentLoginRegDate="+currentLoginRegDate+", dormantConversionDate="+
				dormantConversionDate+", suspensionDate="+suspensionDate+", suspensionContent="+
				suspensionContent+", secessionRegDate="+secessionRegDate+", countCancelReceive="+
				countCancelReceive+", receiveProhibitionEndDate="+receiveProhibitionEndDate+
				", auctionGrade="+auctionGrade+", tourismBusinessNum="+tourismBusinessNum+
				", havingPoint="+havingPoint+", bank="+bank+", accountHolder="+accountHolder+
				", accountNum="+accountNum+", currentLoginRegDate="+currentLoginRegDate+", businessUserApprovalFlag="+businessUserApprovalFlag+"]\n";
	}
	
}
