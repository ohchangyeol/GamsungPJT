package site.gamsung.service.domain;

public class Comment {
	
	
	//Field
	
	private Post postNo;
	private int commentNo;
	private String commentContent;
	private User commentWriter;
	private String commentRegdate;
	private String deleteFlag;

	
	//Construtor
	
	public Comment() {
	}


	public Post getPostNo() {
		return postNo;
	}

	public void setPostNo(Post postNo) {
		this.postNo = postNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public User getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(User commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentRegdate() {
		return commentRegdate;
	}

	public void setCommentRegdate(String commentRegdate) {
		this.commentRegdate = commentRegdate;
	}


	@Override
	public String toString() {
		return "Comment Start [postNo=" + postNo + ", commentNo=" + commentNo + ", commentContent=" + commentContent
				+ ", commentWriter=" + commentWriter + ", commentRegdate=" + commentRegdate + "END]";
	}


	public String getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
}
