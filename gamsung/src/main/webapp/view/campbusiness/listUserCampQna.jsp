<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Document Title -->
    
    <jsp:include page="/resources/commonLib.jsp"/>
    <jsp:include page="/resources/commonCssMypage.jsp" />
    
    <title>listMyCampQna</title>
  </head>

<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <section class="body">

      <div class="inner-wrapper">
    <jsp:include page="../common/userSideBar.jsp"></jsp:include>
      <section role="main" class="content-body mypage-body">
        
        <!-- start: page -->
          <div class="row">
            <div class="col-md-12">
              <section class="panel">
                <div class="panel-body">

                  <div class="mypage-search-container">
                    <div style="font-weight: 500; font-size:28px; margin-bottom: 30px;">캠핑 Q&A</div>
                    <div class="mypage-search-box">
                      <div class="row">
                        <c:if test="${user.role == 'GENERAL' && campNo != '0' }">
                          <div>
                            <button id="addQnabtn" type="button" class="btn btn-primary">질문등록</button>
                            <input type="hidden" name="campNo" id="campNo" value="${campNo}">
                          </div>	
                        </c:if>
                     </div>
                    </div>
                  </div>

                  <div class="table-responsive">
                    <table class="table table-hover mb-none">
                      <thead>
                        <tr>
                          <th style="text-align: center;">No</th>
                          <th style="text-align: center;">제목</th>
                          <th style="text-align: center;">내용</th>
                          <th style="text-align: center;">질문등록일</th>
                          <th style="text-align: center;">답변</th>
                          <th style="text-align: center;">답변 등록일</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:set var="i" value="0" />
                          <c:forEach var="qna" items="${list}">
                          <c:set var="i" value="${ i+1 }" />
                          <tr>
                              <td align="left">${ i }</td>				
                              <td align="left" id="subSiteName" data-qnaNo="${qna.qnaNo}">${qna.questionTitle}</td>
                                  <td align="left">${qna.questionContent}</td>
                                  <td align="left">${qna.questionRegDate}</td>
                                  <td align="left">
                                  <c:choose>
                                    <c:when test="${ !empty qna.answerContent}">
                                      Y
                                    </c:when>
                                    <c:otherwise>
                                      N
                                    </c:otherwise>
                                  </c:choose>
                                  </td>
                                  <td align="left">
                                  <c:choose>
                                    <c:when test="${ !empty qna.answerRegDate}">
                                ${qna.answerRegDate}
                              </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                  </c:choose>
                                  </td>
                          </tr>
                          </c:forEach>


                      </tbody>
                    </table>
                  </div>
                </div>
              </section>
             
            </div>
          </div>
        <!-- end: page -->

        


      </section>
    </div>
  
  </section>

<jsp:include page="/resources/commonScriptMypage.jsp" />
<script src="../../resources/js/dashboard/examples.dashboard.js"></script>

     <script type="text/javascript">

      $(function() {
				
        $( "td:nth-child(2)" ).on("click" , function() {
          self.location ="/campBusiness/getCampQna?qnaNo="+$(this).attr("data-qnaNo");
        });
            
        $( "td:nth-child(2)" ).css("color" , "red");
        
        $("#addQnabtn").on("click" , function() {
          self.location ="/campBusiness/addCampQnaQuestion?campNo="+$("#campNo").val();
        });	
          
        
      });	
        

    </script>

  </body>

</html>