package service.domain;

import java.sql.Date;

public class User {
	
	///Field
	private String id;
	private String nickName;
	private String addr;
	private int cancelReceiveCount;
	private Date receiveProhibitionEndDate;
	private CommonUser commonUser;
	
	///Constructor
	public User() {
		// TODO Auto-generated constructor stub
	}

	///Method
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public CommonUser getCommonUser() {
		return commonUser;
	}

	public void setCommonUser(CommonUser commonUser) {
		this.commonUser = commonUser;
	}
	

}
