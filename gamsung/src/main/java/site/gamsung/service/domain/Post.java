package site.gamsung.service.domain;

import site.gamsung.service.common.Search;

public class Post {


	
	//field
	
	private String postTitle; //게시물제목
	private int postNo; //게시물번호
	private String postContent; //게시물내용
	private User writer; //작성자
	private int postType; //게시물타입 카테고리
	private int postConcernCount; //게시물추천수
	private String postRegdate; //게시물등록일자
	private String video;// 게시물 비디오
	private String deleteFlag; //블라인드 유무
	private int commentTotalCount; // 댓글 총 수 // int는 디폴트 0이고 스트링은 null임.. 
	private String postImg1; //게시물이미지
	private String postImg2; //게시물이미지1
	private String postImg3; //게시물이미지2
	private String hashtag1; //해시태그1
	private String hashtag2; //해시태그2
	private String hashtag3; //해시태그3
	private Search search; // searchCondition,searchKeyword  controller에서 처리.
	private String conDeleteFlag; // 추천 등록삭제 확인여부
	private String concernType;
	private double statusRating;
	private int campNo;
	private String commentContent;

	
	
	
	
	
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public User getWriter() {
		return writer;
	}
	public void setWriter(User writer) {
		this.writer = writer;
	}
	public int getPostType() {
		return postType;
	}
	public void setPostType(int postType) {
		this.postType = postType;
	}
	public int getPostConcernCount() {
		return postConcernCount;
	}
	public void setPostConcernCount(int postConcernCount) {
		this.postConcernCount = postConcernCount;
	}
	public String getPostRegdate() {
		return postRegdate;
	}
	public void setPostRegdate(String postRegdate) {
		this.postRegdate = postRegdate;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public int getCommentTotalCount() {
		return commentTotalCount;
	}
	public void setCommentTotalCount(int commentTotalCount) {
		this.commentTotalCount = commentTotalCount;
	}
	public String getPostImg1() {
		return postImg1;
	}
	public void setPostImg1(String postImg1) {
		this.postImg1 = postImg1;
	}
	public String getPostImg2() {
		return postImg2;
	}
	public void setPostImg2(String postImg2) {
		this.postImg2 = postImg2;
	}
	public String getPostImg3() {
		return postImg3;
	}
	public void setPostImg3(String postImg3) {
		this.postImg3 = postImg3;
	}
	public String getHashtag1() {
		return hashtag1;
	}
	public void setHashtag1(String hashtag1) {
		this.hashtag1 = hashtag1;
	}
	public String getHashtag2() {
		return hashtag2;
	}
	public void setHashtag2(String hashtag2) {
		this.hashtag2 = hashtag2;
	}
	public String getHashtag3() {
		return hashtag3;
	}
	public void setHashtag3(String hashtag3) {
		this.hashtag3 = hashtag3;
	}
	public Search getSearch() {
		return search;
	}
	public void setSearch(Search search) {
		this.search = search;
	}
	public String getConDeleteFlag() {
		return conDeleteFlag;
	}
	public void setConDeleteFlag(String conDeleteFlag) {
		this.conDeleteFlag = conDeleteFlag;
	}
	public String getConcernType() {
		return concernType;
	}
	public void setConcernType(String concernType) {
		this.concernType = concernType;
	}
	
	public double getStatusRating() {
		return statusRating;
	}
	public void setStatusRating(double statusRating) {
		this.statusRating = statusRating;
	}
	public int getCampNo() {
		return campNo;
	}
	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}
	@Override
	public String toString() {
		return "Post [postTitle=" + postTitle + ", postNo=" + postNo + ", postContent=" + postContent + ", writer="
				+ writer + ", postType=" + postType + ", postConcernCount=" + postConcernCount + ", postRegdate="
				+ postRegdate + ", video=" + video + ", deleteFlag=" + deleteFlag + ", commentTotalCount="
				+ commentTotalCount + ", postImg1=" + postImg1 + ", postImg2=" + postImg2 + ", postImg3=" + postImg3
				+ ", hashtag1=" + hashtag1 + ", hashtag2=" + hashtag2 + ", hashtag3=" + hashtag3 + ", search=" + search
				+ ", conDeleteFlag=" + conDeleteFlag + ", concernType=" + concernType + ", statusRating=" + statusRating
				+ ", campNo=" + campNo + "]";
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}


	
}
	//method