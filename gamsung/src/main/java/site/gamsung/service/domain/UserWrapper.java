package site.gamsung.service.domain;

import java.util.List;

public class UserWrapper {

	private List<User> users;
	private int totalCount;
	private String info;
	
	public UserWrapper() {}
	
	public UserWrapper(List<User> users, int totalCount) {
		this.users = users;
		this.totalCount = totalCount;
	}

	public List<User> getUsers() {
		return users;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}	
	
	
}
