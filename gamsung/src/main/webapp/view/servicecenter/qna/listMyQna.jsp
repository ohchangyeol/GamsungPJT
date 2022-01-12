<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="panel-body">
  <div class="table-responsive">
    <table class="table table-hover mb-none">
      <thead>
          <tr>
              <th>접수번호</th>
              <th>문의내역</th>
              <th>닉네임</th>
              <th>접수 일자</th>
          </tr>
      </thead>
      <tbody class="qna-list">
        <c:forEach var ="qna" items="${wrapper.qnas}">
          <tr>
              <td class="qna-no">${qna.qnaNo}</td>
              <td>
                <div class="qna-title-box">
                  <c:if test="${!empty qna.answerContent}">
                    <div class="check">확인</div>
                  </c:if>
                  <c:if test="${empty qna.answerContent}">
                    <div class="unCheck">미답변</div>
                  </c:if> 
  
                  ${qna.questionTitle}

                </div>
              </td>
              <td>${qna.sender.nickName}</td>
              
              <td>${qna.questionRegDate}</td>
          </tr>
      </c:forEach>
          

      </tbody>
    </table>
  </div>
  <jsp:include page="../../common/pageNavigator.jsp"/>
</div>
