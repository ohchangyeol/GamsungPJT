<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>Q&A</title>
    
    <jsp:include page="/resources/commonLib.jsp"/>

    <link href="../../../resources/css/serviceCenter.css" rel="stylesheet">

  </head>

  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" class="qna" data-userid ="${user.id}" data-qnatype="${qnaType}">
    <main>
      
      <!-- header -->
      <jsp:include page="../../common/header.jsp"/>
      <!-- header End -->

      <div class="main">
        <section class="module bg-dark-60 contact-page-header bg-dark" data-background="../../../resources/images/qna.jpg" style="background-size: cover;">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Q&A 게시판</h2>
                <div class="subtitle">
                  <p>갬성캠핑은 회원님들의 소중한 의견에 항상 귀 기울이고 있습니다.</p>
                  <p>사이트 내 궁금하신 점이나 의견을 남겨주시면 최대한 빠르고 자세히 답변해 드리겠습니다.</p>
                </div>
                <div class="search-box">
                  <form role="form" class="qna-search" method="post" >
                    <input class="form-control qna-serach-input" type="text" placeholder="Search..." name="searchKeyword" value="${wrapper.search.searchKeyword}">
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                    <input type="hidden" id="currentPage" name="currentPage" value="1"/>
                    <input type="hidden" id="searchCondition" name="searchCondition" value="0"/>

                  </form>
                </div>
              </div>
            </div>
          </div>
        </section>
        
        <section class="module" style="padding-top: 50px;">
          <div class="container">
            <c:if test="${!empty qnaType}">
              <c:choose>
                <c:when test='${qnaType == "list"}'>
                  <div class="sub-title">
                    <h4 class="font-jua main-color">전체 Q&A </h4>
                    <sub>${wrapper.totalCount}건</sub>
                  </div>
                </c:when>
                <c:when test='${qnaType == "get"}'>
                  <div class="sub-title">
                    <h4 class="font-jua main-color">Q&A 상세</h4>
                    <div class="btn-box">
                      <button class="btn btn-d btn-round qna-back" type="button">목록가기</button>
                    </div>
                  </div>
                </c:when>
                <c:when test='${qnaType == "add"}'>
                  <div class="sub-title">
                    <h4 class="font-jua main-color">Q&A 등록</h4>
                    <div class="btn-box">
                      <button id="qna-send" class="btn btn-d btn-round" type="button">등록하기</button>
                      <button class="btn btn-d btn-round qna-back" type="button">목록가기</button>
                    </div>
                  </div>
                </c:when>
                <c:when test='${qnaType == "my"}'>
                  <div class="sub-title">
                    <h4 class="font-jua main-color">내 Q&A 조회</h4>
                    <sub>${wrapper.totalCount}건</sub>
                    <div class="btn-box">
                      <button class="btn btn-d btn-round qna-back" type="button">목록가기</button>
                    </div>
                  </div>
                </c:when>
                <c:otherwise></c:otherwise>
              </c:choose>
            </c:if>
            
            <hr class="divider-w mt-10 mb-20">
            <c:if test="${!empty qnaType}">
              <c:choose>
                <c:when test='${qnaType == "list"}'><jsp:include page="../qna/listQna.jsp"/></c:when>
                <c:when test='${qnaType == "my"}'><jsp:include page="../qna/listMyQna.jsp"/></c:when>
                <c:when test='${qnaType == "get"}'><jsp:include page="../qna/getQna.jsp"/></c:when>
                <c:when test='${qnaType == "add"}'><jsp:include page="../qna/addQna.jsp"/></c:when>
                <c:otherwise></c:otherwise>
              </c:choose>
            </c:if>

          </div>
        </section>

        <jsp:include page="../../common/footer.jsp"/>
        
      <div class="qna-btn-box">
        <button class="btn btn-border-d btn-round qna-btn" type="button" data-type="1">내 Q&A </button>
        <button class="btn btn-border-d btn-round qna-btn" type="button" data-type="2">Q&A 글쓰기</button>
      </div>
    </main>
    
    <script src="../../../resources/js/servicecenter/qna.js"></script>
    
  </body>
</html>