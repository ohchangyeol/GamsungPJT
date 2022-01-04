<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>Titan | Multipurpose HTML5 Template</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57"	href="../../resources/images/favicons/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60"	href="../../resources/images/favicons/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72"	href="../../resources/images/favicons/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76"	href="../../resources/images/favicons/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="../../resources/images/favicons/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="../../resources/images/favicons/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="../../resources/images/favicons/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="../../resources/images/favicons/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="../../resources/images/favicons/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192" href="../../resources/images/favicons/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="../../resources/images/favicons/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../../resources/images/favicons/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="../../resources/images/favicons/favicon-16x16.png">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
  
	<link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Template specific stylesheets-->
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet">
	<link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
	<link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
	<link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
	<link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css"	rel="stylesheet">
	<link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
	<link href="../../resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
	
	<link href="../../resources/css/style.css" rel="stylesheet">
	<link id="color-scheme" href="../../resources/css/colors/default.css" rel="stylesheet">


	<link rel="stylesheet" href="../../resources/lib/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="../../resources/lib/font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" href="../../resources/lib/magnific-popup/magnific-popup.css" />
	<link rel="stylesheet" href="../../resources/lib/bootstrap-datepicker/css/datepicker3.css" />
	<link rel="stylesheet" href="../../resources/lib/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
	<link rel="stylesheet" href="../../resources/lib/bootstrap-multiselect/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="../../resources/lib/morris/morris.css" />
	<link rel="stylesheet" href="../../resources/css/theme.css" />
	<link rel="stylesheet" href="../../resources/css/skins/default.css" />
	<link rel="stylesheet" href="../../resources/css/theme-custom.css">
	<script src="../../resources/lib/modernizr/modernizr.js"></script>

<style type="text/css">

.sidebar-left{
	background-color: #171717 !important;
}

.page-header{
	background-color: #171717 !important;
}
</style>

</head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <section class="body">
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
		<jsp:include page="../common/header.jsp"></jsp:include>
     	 <div class="inner-wrapper">
				<!-- start: sidebar -->
				<aside id="sidebar-left" class="sidebar-left">
					<div class="sidebar-header">
						<div class="sidebar-title" aria-hidden="true">
							마이페이지
						</div>
						<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
							<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
						</div>
					</div>
				
					<div class="nano">
						<div class="nano-content">
							<nav id="menu" class="nav-main" role="navigation">
								<hr class="separator" />
								<ul class="nav nav-main">
									<li class="nav-parent">
										<a>
											<i class="fa fa-user" aria-hidden="true"></i>
											<span>내 정보</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="forms-basic.html">
													 샬라샬라
												</a>
											</li>
											<li>
												<a href="forms-advanced.html">
													 샬라샬라
												</a>
											</li>
										</ul>
									</li>
									<hr class="separator" />
									<li class="nav-parent">
										<a>
											<i class="fa fa-camera" aria-hidden="true"></i>
											<span>캠핑</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="forms-basic.html">
													 예약
												</a>
											</li>
											<li>
												<a href="forms-advanced.html">
													  Q&A
												</a>
											</li>
											<li>
												<a href="forms-advanced.html">
													  리뷰
												</a>
											</li>
										</ul>
									</li>
									<hr class="separator" />
									<li class="nav-parent">
										<a>
											<i class="fa fa-gavel" aria-hidden="true"></i>
											<span>중고경매</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a id="listMyProduct">
													 내가 등록한 상품
												</a>
											</li>
											<li>
												<a>
													 경매 내역
												</a>
											</li>
											<li>
												<a>
													 응찰 관심 내역
												</a>
											</li>
											<li>
												<a>
													 리뷰
												</a>
											</li>
										</ul>
									</li>
									<hr class="separator" />
									<li class="nav-parent">
										<a>
											<i class="fa fa-quote-left" aria-hidden="true"></i>
											<span>커뮤니티</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="forms-basic.html">
													 샬라샬라
												</a>
											</li>
											<li>
												<a href="forms-advanced.html">
													 샬라샬라
												</a>
											</li>
										</ul>
									</li>
									<hr class="separator" />
									<li class="nav-parent">
										<a>
											<i class="fa  fa-refresh" aria-hidden="true"></i>
											<span>예약양도</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="forms-basic.html">
													 샬라샬라
												</a>
											</li>
											<li>
												<a href="forms-advanced.html">
													 샬라샬라
												</a>
											</li>
										</ul>
									</li>
									<hr class="separator" />
									<li class="nav-parent">
										<a>
											<i class="fa fa-money" aria-hidden="true"></i>
											<span>결제</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="forms-basic.html">
													 포인트 충전/출금
												</a>
											</li>
											<li>
												<a href="forms-advanced.html">
													 내 결제/포인트 내역
												</a>
											</li>
										</ul>
									</li>
									<hr class="separator" />
									<hr class="separator" />
									<li>
										<a href="http://themeforest.net/item/JSOFT-responsive-html5-template/4106987?ref=JSOFT" target="_blank">
											<i class="fa fa-sign-out" aria-hidden="true"></i>
											<span>로그아웃</span>
										</a>
									</li>
									<hr class="separator" />
									<hr class="separator" />
									<hr class="separator" />
									<hr class="separator" />
									<hr class="separator" />
									<li>
										<span class="text-center">회원틸퇴</span>
									</li>
								</ul>
								
								
							</nav>
						</div>
					</div>
				</aside>
				<!-- end: sidebar -->
				<section role="main" class="content-body">
					
					<!-- start: page -->
						<div class="row">
							<div class="col-md-12">
								<section class="panel">
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-hover mb-none">
												<thead>
													<tr>
														<th>경매번호</th>
														<th>상품명</th>
														<th>상태</th>
														<th>조회수</th>
														<th>UP!</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="auctionProduct" items="${list}">
													<tr>
														<td class="auctionProductNo">${auctionProduct.auctionProductNo}</td>
														<td class="auctionProductName">${auctionProduct.auctionProductName}</td>
														<c:if test="${auctionProduct.auctionStatus eq 'START'}">
															<td>진행중</td>														
														</c:if>
														<c:if test="${auctionProduct.auctionStatus eq 'WAIT'}">
															<td>낙찰</td>		
														</c:if>
														<c:if test="${auctionProduct.auctionStatus eq 'FAIL'}">
															<td>유찰</td>	
														</c:if>
														<c:if test="${auctionProduct.auctionStatus eq 'CONFIRM'}">
															<td>거래완료</td>	
														</c:if>
														<c:if test="${auctionProduct.auctionStatus eq 'WITHDRAWAL'}">
															<td>중도철회</td>	
														</c:if>
														<c:if test="${auctionProduct.auctionStatus eq 'CANCEL'}">
															<td>낙찰취소</td>	
														</c:if>
														<td class="text-center"><i class="fa fa-eye"></i><span>${auctionProduct.productViewCount}</span></td>
														<td class="actions-hover actions-fade">
															<a class="addMain"><i class="fa fa-arrow-up"></i></a>
														</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</section>
								<div class="row">
									<div class="col-sm-12">
										<div class="pagination font-alt">
											<a><i class="fa fa-angle-left"></i></a>
												<a class="active nav">1</a>
											<a><i class="fa fa-angle-right"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					<!-- end: page -->
				</section>
			</div>

			<aside id="sidebar-right" class="sidebar-right">
				<div class="nano">
					<div class="nano-content">
						<a href="#" class="mobile-close visible-xs">
							Collapse <i class="fa fa-chevron-right"></i>
						</a>
			
						<div class="sidebar-right-wrapper">
			
							<div class="sidebar-widget widget-calendar">
								<h6>Upcoming Tasks</h6>
								<div data-plugin-datepicker data-plugin-skin="dark" ></div>
			
								<ul>
									<li>
										<time datetime="2014-04-19T00:00+00:00">04/19/2014</time>
										<span>Company Meeting</span>
									</li>
								</ul>
							</div>
			
							<div class="sidebar-widget widget-friends">
								<h6>Friends</h6>
								<ul>
									<li class="status-online">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-online">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-offline">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-offline">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
								</ul>
							</div>
			
						</div>
					</div>
				</div>
			</aside>
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
		</section>        
    <!--  
    JavaScripts
    =============================================
    -->
	<script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resources/lib/wow/wow.js"></script>
	<script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
	<script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../../resources/lib/smoothscroll.js"></script>
	<script src="../../resources/lib/magnific-popup/jquery.magnific-popup.js"></script>
	<script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../../resources/js/plugins.js"></script>
	<script src="../../resources/js/main.js"></script>
	
	<script src="../../resources/lib/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="../../resources/lib/nanoscroller/nanoscroller.js"></script>
	<script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
	<script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
	
	<script src="../../resources/lib/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
	<script src="../../resources/lib/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
	<script src="../../resources/lib/jquery-appear/jquery.appear.js"></script>
	<script src="../../resources/lib/bootstrap-multiselect/bootstrap-multiselect.js"></script>
	<script src="../../resources/lib/jquery-easypiechart/jquery.easypiechart.js"></script>
	<script src="../../resources/lib/flot/jquery.flot.js"></script>
	<script src="../../resources/lib/flot-tooltip/jquery.flot.tooltip.js"></script>
	<script src="../../resources/lib/flot/jquery.flot.pie.js"></script>
	<script src="../../resources/lib/flot/jquery.flot.categories.js"></script>
	<script src="../../resources/lib/flot/jquery.flot.resize.js"></script>
	<script src="../../resources/lib/jquery-sparkline/jquery.sparkline.js"></script>
	<script src="../../resources/lib/raphael/raphael.js"></script>
	<script src="../../resources/lib/morris/morris.js"></script>
	<script src="../../resources/lib/gauge/gauge.js"></script>
	<script src="../../resources/lib/snap-svg/snap.svg.js"></script>
	<script src="../../resources/lib/liquid-meter/liquid.meter.js"></script>
	<script src="../../resources/lib/jqvmap/jquery.vmap.js"></script>
	<script src="../../resources/lib/jqvmap/data/jquery.vmap.sampledata.js"></script>
	<script src="../../resources/lib/jqvmap/maps/jquery.vmap.world.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.africa.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.australia.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>
		
	
	<script src="../../resources/js/theme.js"></script>
	<script src="../../resources/js/theme.custom.js"></script>
	<script src="../../resources/js/theme.init.js"></script>
	<script src="../../resources/js/dashboard/examples.dashboard.js"></script>
	
	<script>
		$(function(){
			$('#listMyProduct').on('click',function(){
				window.location = "/auction/listMyAuctionProduct?currentPage=1-*";
			});
			
			$('.auctionProductName').on('click',function(){
				window.location = '/auction/getAuctionProduct?auctionProductNo='+$(this).prev().text();
			});
			
			$('.addMain').on('click',function(){
				var auctionProductNo = $(this).parent().prev().prev().prev().prev().text();
				$.ajax({
					url : "/auction/rest/addMainAuctionProduct/"+auctionProductNo,
					method : "GET",
					headers : {
						"Accept" : "application/json",
						"Content-type" : "application/json"
					},
					dataType : "json",
					success : function(JSONData, status){
						alert(JSONData.info);
						location.reload();
					}
				});
			});
		});
	</script>
  </body>
</html>