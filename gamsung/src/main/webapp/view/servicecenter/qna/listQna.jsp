<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="count" value="0" />

<div class="row">
  <div class="col-sm-6 qna-left">
    <!-- start list -->
    <c:forEach var ="qna" items="${wrapper.qnas}">
    <c:set var="count" value="${count + 1}" />
    <c:if test="${count le 5}">
      
    <div class="panel-group" id="accordion">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title font-alt">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#support${qna.qnaNo}">
              ${qna.questionTitle}
              <c:if test="${!empty qna.answerContent}">
                <div class="check">확인</div>
              </c:if>
              <c:if test="${empty qna.answerContent}">
                <div class="unCheck">미답변</div>
              </c:if> 
            </a>
          </h4>
        </div>
        <div class="panel-collapse collapse" id="support${qna.qnaNo}">
          <div class="panel-body">
            <div class="question">
              ${qna.questionContent}
              <c:if test="${! empty qna.answerContent }">
                <hr class="divider-w mt-10 mb-20">
                <div>
                  ▶답변
                </div> 
                ${qna.answerContent}
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>

    </c:if>

    <c:if test="${count eq '5'}">
  </div>
  <div class="col-sm-6 qna-right">
    </c:if>
    
    <c:if test="${count gt 5}">
    <div class="panel-group" id="accordion">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title font-alt">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#support${count}">
              ${qna.questionTitle}
              <c:if test="${!empty qna.answerContent}">
                <div class="check">확인</div>
              </c:if>
              <c:if test="${empty qna.answerContent}">
                <div class="unCheck">미답변</div>
              </c:if> 
            </a>
          </h4>
        </div>
        <div class="panel-collapse collapse" id="support${count}">
          <div class="panel-body">
            <div class="question">
              ${qna.questionContent}
              <c:if test="${! empty qna.answerContent }">
                <div class="answer">
                  <hr class="divider-w mt-10 mb-20">
                  <div>
                    ▶답변
                  </div>
                  <span>${qna.answerContent}</span>
                </div>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
    </c:if>
    </c:forEach>
  </div>

</div>

<div class="format">
  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title font-alt">
          <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#ex1">
            제목
            <!-- <div class="check">확인</div>
            <div class="unCheck">미답변</div> -->
          </a>
        </h4>
      </div>
      <div class="panel-collapse collapse" id="ex1">
        <div class="panel-body">
          <div class="question">
            내용 입력 
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="answer">
    <hr class="divider-w mt-10 mb-20">
    <div>
      ▶답변
    </div> 
    <span>답변 내용</span>
  </div>
  
</div>