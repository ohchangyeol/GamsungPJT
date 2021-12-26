package site.gamsung.service.domain;

public class Qna {

	// Field
	private int qnaNo;
	private User sender;
	private User receiver;
	private String deleteFlag;
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
	// Getter
	public int getQnaNo() {
		return qnaNo;
	}
	public User getSender() {
		return sender;
	}
	public User getReceiver() {
		return receiver;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public String getQuestionRegDate() {
		return questionRegDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public String getAnswerRegDate() {
		return answerRegDate;
	}
	public int getCampNo() {
		return campNo;
	}
	public String getCampName() {
		return campName;
	}

	// Setter
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public void setQuestionRegDate(String questionRegDate) {
		this.questionRegDate = questionRegDate;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public void setAnswerRegDate(String answerRegDate) {
		this.answerRegDate = answerRegDate;
	}
	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}
	public void setCampName(String campName) {
		this.campName = campName;
	}
	
	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", sender=" + sender + ", receiver=" + receiver + ", deleteFlag=" + deleteFlag
				+ ", questionTitle=" + questionTitle + ", questionContent=" + questionContent + ", questionRegDate="
				+ questionRegDate + ", viewCount=" + viewCount + ", answerContent=" + answerContent + ", answerRegDate="
				+ answerRegDate + ", campNo=" + campNo + ", campName=" + campName + "] \n";
	}
	
}
