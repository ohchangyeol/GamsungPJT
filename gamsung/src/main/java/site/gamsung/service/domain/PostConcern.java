package site.gamsung.service.domain;

public class PostConcern {


private int countNo;
private String deleteFlag ;
private User userId;
private Post postNo;


	public PostConcern() {

	}


	public int getCountNo() {
		return countNo;
	}


	public void setCountNo(int countNo) {
		this.countNo = countNo;
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


	public String getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}



