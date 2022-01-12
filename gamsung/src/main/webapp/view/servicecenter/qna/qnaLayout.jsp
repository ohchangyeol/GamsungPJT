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
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      
      <!-- header -->
      <jsp:include page="../../common/header.jsp"/>
      <!-- header End -->

      <div class="main">
        <section class="module bg-dark-60 contact-page-header bg-dark" data-background="assets/images/contact_bg.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Q&A 게시판</h2>
                <div class="subtitle">
                  <p>갬성캠핑은 회원님들의 소중한 의견에 항상 귀 기울이고 있습니다.</p>
                  <p>사이트 내 궁금하신 점이나 의견을 남겨주시면 최대한 빠르고 자세히 답변해 드리겠습니다.</p>
                </div>
                <div class="search-box">
                  <form role="form" class="qna-search">
                    <input class="form-control" type="text" placeholder="Search...">
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </section>
        
        <section class="module">
          <div class="container">
            <c:if test="${!empty qnaType}">
              <c:choose>
                <c:when test='${qnaType == "list"}'>
                  <div class="sub-title">
                    <h4>전체 Q&A </h4>
                    <sub>${wrapper.totalCount}건</sub>
                  </div>
                </c:when>
                <c:when test='${qnaType == "get"}'>
                  <div class="sub-title">
                    <h4>Q&A 상세</h4>
                    <div class="btn-box">
                      <button class="btn btn-d btn-round qna-back" type="button">목록가기</button>
                    </div>
                  </div>
                </c:when>
                <c:when test='${qnaType == "add"}'>
                  <div class="sub-title">
                    <h4>Q&A 등록</h4>
                    <div class="btn-box">
                      <button id="qna-send" class="btn btn-d btn-round" type="button">등록하기</button>
                      <button class="btn btn-d btn-round qna-back" type="button">목록가기</button>
                    </div>
                  </div>
                </c:when>
                <c:when test='${qnaType == "my"}'>
                  <div class="sub-title">
                    <h4>내 Q&A 조회</h4>
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

        <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Titan</h5>
                  <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                  <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                  <p>Email:<a href="#">somecompany@example.com</a></p>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
      <div class="qna-btn-box">
        <button class="btn btn-border-d btn-round qna-btn" type="button" data-type="1">내 Q&A 0 건</button>
        <button class="btn btn-border-d btn-round qna-btn" type="button" data-type="2">Q&A 글쓰기</button>
      </div>
    </main>
    
    <script src="../../../resources/js/servicecenter/qna.js"></script>
    
  </body>
</html>