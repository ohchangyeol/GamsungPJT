<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="qna-content" data-qnano="${qna.qnaNo}">
  <div class="question">
    <div class="q-header">
      <div class="title-box">
        <h3 class="title">${qna.questionTitle}</h3>
        <!-- if처리 -->
        <!-- <div class="check">확인</div> -->
        <c:if test="${!empty qna.answerContent}">
          <div class="check">확인</div>
        </c:if>
        <c:if test="${empty qna.answerContent}">
          <div class="unCheck">미답변</div>
        </c:if> 
      </div>
      <div class="date-view">
        <span class="date">${qna.questionRegDate}</span>
        <span class="view">${qna.sender.nickName}</span>
      </div>
      <hr class="divider-w mt-10 mb-20">
    </div>
  
    <div class="q-body">
  
      <div class="content">
        ${qna.questionContent}
      </div>
      <hr class="divider-w mt-10 mb-20">
    </div>

  </div>

  <c:if test="${!empty qna.answerContent}">
  <div class="answer">
    <div class="q-header">
        <h3 class="title">▶ 답변 내용 </h3>
      <div class="date-view">
        <span class="date">${qna.answerRegDate}</span>
        <span class="view">${qna.receiver.nickName}</span>
      </div>
      <hr class="divider-w mt-10 mb-20">
    </div>
  
    <div class="q-body">
  
      <div class="content">
        ${qna.answerContent}
      </div>
      <hr class="divider-w mt-10 mb-20">
    </div>
  
  </div>

  </c:if>

<button id="qna-delete-btn" class="btn btn-danger btn-round" type="button">삭제</button>
<c:if test="${user.role == 'ADMIN' and empty qna.answerContent}">
  <div>
    <form id="answer-form">
      <input type="hidden" name="qnaNo" value="${qna.qnaNo}" >
      <textarea name="answerContent" id="" cols="30" rows="3"></textarea>
      <button id="send-answer" class="btn btn-success btn-round" type="button"> 등록 </button>
    </form>
  </div>
</c:if>
  
</div>
