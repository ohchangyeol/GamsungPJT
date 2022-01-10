<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- start: sidebar -->

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
	
	aside{
		margin-top:-55px;
	}
	
	</style>
<aside id="sidebar-left" class="sidebar-left">
	<div class="sidebar-header">
		<div class="sidebar-title" aria-hidden="true">마이페이지</div>
		<div class="sidebar-toggle hidden-xs"
			data-toggle-class="sidebar-left-collapsed" data-target="html"
			data-fire-event="sidebar-left-toggle">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>
	<div class="nano">
		<div class="nano-content">
			<nav id="menu" class="nav-main" role="navigation">
				<hr class="separator" />
				<ul class="nav nav-main">
					<li class="nav-parent"><a> <i class="fa fa-user"
							aria-hidden="true"></i> <span>내 정보</span>
					</a>
						<ul class="nav nav-children">
							<li>
								<a href="/view/common/myPage.jsp">
									내정보 조회/수정
								</a>
							</li>
							<li id="Secession">
								<a href="#" data-toggle="modal" data-target="#addSecessionModal">
									회원탈퇴
								</a>
							</li>
						</ul>
					</li>
					<hr class="separator" />
					<li class="nav-parent"><a> <i class="fa fa-camera"
							aria-hidden="true"></i> <span>캠핑</span>
					</a>
						<ul class="nav nav-children">
							<li><a id="my_reservation" style="cursor: pointer;"> 예약 내역</a></li>
							<li><a id="my_camp_qna" style="cursor: pointer;"> 등록한 Q&A </a></li>
							<li><a id="my_camp_review" style="cursor: pointer;"> 등록한 리뷰 </a></li>
						</ul></li>
					<hr class="separator" />
					<li class="nav-parent"><a> <i class="fa fa-gavel"
							aria-hidden="true"></i> <span>중고경매</span>
					</a>
						<ul class="nav nav-children">
							<li><a id="auctionAdd"> 내가 등록한 상품 </a></li>
							<li><a id="auctionHistory"> 경매 내역 </a></li>
							<li><a id="auctionBid"> 응찰 관심 내역 </a></li>
							<li><a id="auctionReview"> 리뷰 </a></li>
						</ul></li>
					<hr class="separator" />
					<li class="nav-parent"><a> <i class="fa fa-quote-left"
							aria-hidden="true"></i> <span>커뮤니티</span>
					</a>
						<ul class="nav nav-children">
							<li><a href="forms-basic.html"> 샬라샬라 </a></li>
							<li><a href="forms-advanced.html"> 샬라샬라 </a></li>
						</ul></li>
					<hr class="separator" />
					<li class="nav-parent"><a> <i class="fa  fa-refresh"
							aria-hidden="true"></i> <span>예약양도</span>
					</a>
						<ul class="nav nav-children">
							<li><a href="forms-basic.html"> 샬라샬라 </a></li>
							<li><a href="forms-advanced.html"> 샬라샬라 </a></li>
						</ul></li>
					<hr class="separator" />
					<li class="nav-parent"><a> <i class="fa fa-money"
							aria-hidden="true"></i> <span>결제</span>
					</a>
						<ul class="nav nav-children">
							<li><a href="forms-basic.html"> 포인트 충전/출금 </a></li>
							<li><a href="forms-advanced.html"> 내 결제/포인트 내역 </a></li>
						</ul></li>
					<hr class="separator" />
					<hr class="separator" />
					<li><a
						href="http://themeforest.net/item/JSOFT-responsive-html5-template/4106987?ref=JSOFT"
						target="_blank"> <i class="fa fa-sign-out" aria-hidden="true"></i>
							<span>로그아웃</span>
					</a></li>
					<hr class="separator" />
					<hr class="separator" />
					<hr class="separator" />
					<hr class="separator" />
					<hr class="separator" />
					<li><span class="text-center">회원틸퇴</span></li>
				</ul>


			</nav>
		</div>
	</div>
</aside>
<!-- end: sidebar -->
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

			$('#my_reservation').on('click',function(){
			window.location = "/campGeneral/listMyReservation";
			});

			$('#my_camp_review').on('click',function(){
			window.location = "/campGeneral/listMyCampRatingReview";
			});

			$('#auctionAdd').on('click',function(){
			window.location = "/auction/listMyAuctionProduct/add?currentPage=1";
			});
				
			$('#auctionHistory').on('click',function(){
				window.location = "/auction/listMyAuctionProduct/history?currentPage=1";
			});
			
			$('#auctionBid').on('click',function(){
				window.location = "/auction/listMyAuctionProduct/bid?currentPage=1";
			});
				
			$('#auctionReview').on('click',function(){
				window.location = "/auction/listMyAuctionProduct/review?currentPage=1";
			});
		});
	</script>