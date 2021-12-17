package site.gamsung.service.domain;

import java.sql.Date;

public class CommonUser {
	
	///Field
	private String role;
	private String password;
	private String name;
	private String phone;
	private Date addUserRegDate;
	private int reportTotalCount;
	private Date currentLoginRegDate;
	private int havingPoint;
	private String bank;
	private String accountHolder;
	private String accountNum;
	private Date dormantConversionDate;
	private Date suspensionDate;
	private String suspensionContent;
	private Date secessionRegDate;
	
	///Constructor
	public CommonUser() {
	}

	
	///Method
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
	
	

}
