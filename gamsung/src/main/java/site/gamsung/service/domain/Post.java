package site.gamsung.service.domain;

import site.gamsung.service.common.Search;

public class Post {


	
	//field
	
	private String postTile; //게시물제목
	private int postNo; //게시물번호
	private String postContent; //게시물내용
	private User writer; //작성자
	private int postType; //게시물타입 카테고리
	private int postConcernCount; //게시물추천수
	private String postRegdate; //게시물등록일자
	private String video;// 게시물 비디오
	private String deleteFlag; //블라인드 유무
	private int commentTotalCount; // 댓글 총 수
	private String postImg1; //게시물이미지
	private String postImg2; //게시물이미지1
	private String postImg3; //게시물이미지2
	private String Hashtag1; //해시태그1
	private String Hashtag2; //해시태그2
	private String Hashtag3; //해시태그3
	private Search search; // searchCondition,searchKeyword  controller에서 처리.
	private String concernFlag; // 추천 등록삭제 확인여부
	private String concernType; // 추천 등록해제
	
	
	//method
	
	public Search getSearch() {
		return search;
	}
	public void setSearch(Search search) {
		this.search = search;
	}
	public String getPostTile() {
		return postTile;
	}
	public void setPostTile(String postTile) {
		this.postTile = postTile;
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
	public String getvideo() {
		return video;
	}
	public void setvideo(String video) {
		video = video;
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
	public String getHashtag1() {
		return Hashtag1;
	}
	public void setHashtag1(String hashtag1) {
		Hashtag1 = hashtag1;
	}
	public String getHashtag2() {
		return Hashtag2;
	}
	public void setHashtag2(String hashtag2) {
		Hashtag2 = hashtag2;
	}
	public String getHashtag3() {
		return Hashtag3;
	}
	public void setHashtag3(String hashtag3) {
		Hashtag3 = hashtag3;
	}
	public String getConcernFlag() {
		return concernFlag;
	}
	public void setConcernFlag(String concernFlag) {
		this.concernFlag = concernFlag;
	}
	public String getConcernType() {
		return concernType;
	}
	public void setConcernType(String concernType) {
		this.concernType = concernType;
	}
	

}
