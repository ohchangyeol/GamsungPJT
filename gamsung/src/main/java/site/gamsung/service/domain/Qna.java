package site.gamsung.service.domain;

public class Qna {

	// Field
	private int qnaNo;
	private User sender;
	private User receiver;
	private boolean deleteFlag;
	private String questionTitle;
	private String questionContent;
	private String questionRegDate;
	private int viewCount;
	private String answerContent;
	private String answerRegDate;
	private int campNo;
	private String campName;
	
	// Constructor
	public Qna() {
		// TODO Auto-generated constructor stub
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public boolean isDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getQuestionRegDate() {
		return questionRegDate;
	}

	public void setQuestionRegDate(String questionRegDate) {
		this.questionRegDate = questionRegDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerRegDate() {
		return answerRegDate;
	}

	public void setAnswerRegDate(String answerRegDate) {
		this.answerRegDate = answerRegDate;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}
	
	

}
