<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>신고 내역</title>
    
    <jsp:include page="/resources/commonLib.jsp"/>

    <link id="color-scheme" href="../../../resources/css/serviceCenter.css" rel="stylesheet">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" class="myReport">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      
      <!-- header -->
      <jsp:include page="../../common/header.jsp"/>
      <!-- header End -->

      <div class="main sc-main">
        <section class="module bg-dark-30 about-page-header" data-background="assets/images/about_bg.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt mb-0">신고 내역</h1>
              </div>
            </div>
          </div>
        </section>
        <section class="module">
          <div class="container">

            <section class="panel">
              <header class="panel-heading">
                <div class="row">
                  <h4 class="col-sm-7 mb-0">신고 내역 조회</h4>
                  <div class="col-sm-5 mb-sm-0">
                    <div class="row">
                    <form role="form" class="rerport-search">
                      <div class="col-sm-4">
                      <select class="form-control">
                        <option selected="selected">제목+내용</option>
                        <option>제목</option>
                        <option>내용</option>
                      </select>
                      </div>
                      <div class="col-sm-8">
                      <div class="search-box">
                        <input class="form-control" type="text" placeholder="Search...">
                        <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                      </div>
                      </div>
                      
                    </form>
                    </div>
                  </div>
            
                </div>
              </header>
              <hr class="divider-w mt-10 mb-20">
              <div class="panel-body my-report">
                <div class="table-responsive">
                  <table class="table table-hover mb-none">
                    <thead>
                      <tr>
                        <th>신고번호</th>
                        <th>신고자 아이디</th>
                        <th>신고 유형</th>
                        <th>상대방 아이디</th>
                        <th>상태</th>
                        <th>접수일자</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var ="report" items="${wrapper.reports}">
                      <tr>
                        <td class="report-no">${report.reportNo}</td>
                        <td>
                          ${report.sender.nickName}
                          ${report.sender.campName}
                        </td>
                        <td>${report.reportTypeName}</td>
                        <td>
                          ${report.receiver.nickName}
                          ${report.receiver.campName}
                        </td>
                        <td>
                          <c:if test="${report.reportStatus == 0 }">접수완료</c:if>
                          <c:if test="${report.reportStatus == 1 }">처리승인</c:if>
                          <c:if test="${report.reportStatus == 2 }">처리거부</c:if>
                        </td>
                        <td>${report.regDate}</td>
                      </tr>
                    </c:forEach>
                      
            
                    </tbody>
                  </table>
                </div>
                <div class="pagination font-alt page-nav">
                  <a href="#">
                    <i class="fa fa-angle-left"></i>
                  </a>
                  <a class="active" href="#">1</a>
                  <a href="#">2</a>
                  <a href="#">3</a>
                  <a href="#">4</a>
                  <a href="#">
                    <i class="fa fa-angle-right"></i>
                  </a>
                  </div>
              </div>
            </section>

            
            

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
    </main>
    
    <script src="../../../resources/js/servicecenter/report.js"></script>
    
  </body>
</html>