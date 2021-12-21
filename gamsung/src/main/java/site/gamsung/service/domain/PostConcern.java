package site.gamsung.service.domain;

public class PostConcern {


private int countNo;
private String concernFlag;
private User userId;
private Post postNo;


	public PostConcern() {
		// TODO Auto-generated constructor stub
	}


	public int getCountNo() {
		return countNo;
	}


	public void setCountNo(int countNo) {
		this.countNo = countNo;
	}


	public String getConcernFlag() {
		return concernFlag;
	}


	public void setConcernFlag(String concernFlag) {
		this.concernFlag = concernFlag;
	}


	public User getUserId() {
		return userId;
	}


	public void setUserId(User userId) {
		this.userId = userId;
	}


	public Post getPostNo() {
		return postNo;
	}


	public void setPostNo(Post postNo) {
		this.postNo = postNo;
	}

}



