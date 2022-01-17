<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    <title>고객센터 홈</title>
    
    <jsp:include page="../../resources/commonLib.jsp"/>
    

  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" data-userid="${user.id}">
    <main class="sc-main">
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <!-- header -->
      <jsp:include page="../common/header.jsp"/>
      <!-- header End -->
      <div class="main">
        <section class="module bg-dark-60 service-page-header" data-background="../../resources/images/servicecenter.jpg" style="padding: 200px;">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
               
              </div>
            </div>
          </div>
        </section>
        <section class="module" id="services" style="padding-top:100px;">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt"></h2>
                <div class="module-subtitle font-serif"></div>
              </div>
            </div>
            <div class="row multi-columns-row service-center-home">
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-lightbulb"></span></div>
                  <h3 class="features-title font-alt">공지사항</h3>
                  <p>사이트 내 공지사항을 <br/>조회할 수 있습니다.</p>
                  <button class="btn btn-d btn-round btn-block" type="button" data-btntype="1">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">공지사항 보기</font>
                    </font>
                  </button>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-bike"></span></div>
                  <h3 class="features-title font-alt">Q&amp;A</h3>
                  <p>사이트 내 궁금하신 점이나 <br/>의견을 남길 수 있습니다.</p>
                  <button class="btn btn-d btn-round btn-block" type="button" data-btntype="2">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">Q&A 바로가기</font>
                    </font>
                  </button>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-tools"></span></div>
                  <h3 class="features-title font-alt">신고하기</h3>
                  <p>신속하게 해결하여 보다 나은 <br/>서비스를 만들어가도록 노력하겠습니다.</p>
                  <button id="report-btn" class="btn btn-d btn-round btn-block" type="button" data-btntype="3" data-userid="${user.id}">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">신고 하기</font>
                    </font>
                  </button>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item report-and-qna">
                  <div class="features-icon"><span class="icon-gears"></span></div>
                  <h3 class="features-title font-alt">내 신고 / Q&amp;A내역</h3>
                  <p>내 신고 및 Q&amp;A 내역의 <br/> 진행 현황을 확인할 수 있습니다.</p>
                  <button class="btn btn-d btn-round btn-block" type="button" data-btntype="4">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">신고내역</font>
                    </font>
                  </button>
                  <button class="btn btn-d btn-round btn-block" type="button" data-btntype="5">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">내 Q&A</font>
                    </font>
                  </button>
                </div>
              </div>
            </div>
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
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
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
    <!--  
    JavaScripts
    =============================================
    -->
    
    <script src="../../resources/js/serivcecenterHome.js"></script>
  </body>
</html>