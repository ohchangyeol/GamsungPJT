<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>

</head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
		<jsp:include page="header.jsp"></jsp:include>
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
					<div class="row">
						<div class="col-md-6">
							<section class="panel">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">Best Seller</h2>
									<p class="panel-subtitle">Customize the graphs as much as you want, there are so many options and features to display information using JSOFT Admin Template.</p>
								</header>
								<div class="panel-body">

									<!-- Flot: Basic -->
									<div class="chart chart-md" id="flotDashBasic"></div>
									<script>

										var flotDashBasicData = [{
											data: [
												[0, 170],
												[1, 169],
												[2, 173],
												[3, 188],
												[4, 147],
												[5, 113],
												[6, 128],
												[7, 169],
												[8, 173],
												[9, 128],
												[10, 128]
											],
											label: "Series 1",
											color: "#0088cc"
										}, {
											data: [
												[0, 115],
												[1, 124],
												[2, 114],
												[3, 121],
												[4, 115],
												[5, 83],
												[6, 102],
												[7, 148],
												[8, 147],
												[9, 103],
												[10, 113]
											],
											label: "Series 2",
											color: "#2baab1"
										}, {
											data: [
												[0, 70],
												[1, 69],
												[2, 73],
												[3, 88],
												[4, 47],
												[5, 13],
												[6, 28],
												[7, 69],
												[8, 73],
												[9, 28],
												[10, 28]
											],
											label: "Series 3",
											color: "#734ba9"
										}];

										// See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

									</script>

								</div>
							</section>
						</div>
						<div class="col-md-6">
							<section class="panel">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>
									<h2 class="panel-title">Server Usage</h2>
									<p class="panel-subtitle">It's easy to create custom graphs on JSOFT Admin Template, there are several graph types that you can use, such as lines, bars, pie charts, etc...</p>
								</header>
								<div class="panel-body">

									<!-- Flot: Curves -->
									<div class="chart chart-md" id="flotDashRealTime"></div>

								</div>
							</section>
						</div>
					</div>

					<!-- start: page -->
					<div class="row">
						<div class="col-md-6 col-lg-12 col-xl-6">
							<section class="panel">
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-8">
											<div class="chart-data-selector" id="salesSelectorWrapper">
												<h2>
													Sales:
													<strong>
														<select class="form-control" id="salesSelector">
															<option value="JSOFT Admin" selected>JSOFT Admin</option>
															<option value="JSOFT Drupal" >JSOFT Drupal</option>
															<option value="JSOFT Wordpress" >JSOFT Wordpress</option>
														</select>
													</strong>
												</h2>

												<div id="salesSelectorItems" class="chart-data-selector-items mt-sm">
													<!-- Flot: Sales JSOFT Admin -->
													<div class="chart chart-sm" data-sales-rel="JSOFT Admin" id="flotDashSales1" class="chart-active"></div>
													<script>

														var flotDashSales1Data = [{
														    data: [
														        ["Jan", 140],
														        ["Feb", 240],
														        ["Mar", 190],
														        ["Apr", 140],
														        ["May", 180],
														        ["Jun", 320],
														        ["Jul", 270],
														        ["Aug", 180]
														    ],
														    color: "#0088cc"
														}];

														// See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

													</script>

													<!-- Flot: Sales JSOFT Drupal -->
													<div class="chart chart-sm" data-sales-rel="JSOFT Drupal" id="flotDashSales2" class="chart-hidden"></div>
													<script>

														var flotDashSales2Data = [{
														    data: [
														        ["Jan", 240],
														        ["Feb", 240],
														        ["Mar", 290],
														        ["Apr", 540],
														        ["May", 480],
														        ["Jun", 220],
														        ["Jul", 170],
														        ["Aug", 190]
														    ],
														    color: "#2baab1"
														}];

														// See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

													</script>

													<!-- Flot: Sales JSOFT Wordpress -->
													<div class="chart chart-sm" data-sales-rel="JSOFT Wordpress" id="flotDashSales3" class="chart-hidden"></div>
													<script>

														var flotDashSales3Data = [{
														    data: [
														        ["Jan", 840],
														        ["Feb", 740],
														        ["Mar", 690],
														        ["Apr", 940],
														        ["May", 1180],
														        ["Jun", 820],
														        ["Jul", 570],
														        ["Aug", 780]
														    ],
														    color: "#734ba9"
														}];

														// See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

													</script>
												</div>

											</div>
										</div>
										<div class="col-lg-4 text-center">
											<h2 class="panel-title mt-md">Sales Goal</h2>
											<div class="liquid-meter-wrapper liquid-meter-sm mt-lg">
												<div class="liquid-meter">
													<meter min="0" max="100" value="35" id="meterSales"></meter>
												</div>
												<div class="liquid-meter-selector" id="meterSalesSel">
													<a href="#" data-val="35" class="active">Monthly Goal</a>
													<a href="#" data-val="28">Annual Goal</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
						<div class="col-md-6 col-lg-12 col-xl-6">
							<div class="row">
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-primary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-life-ring"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Support Questions</h4>
														<div class="info">
															<strong class="amount">1281</strong>
															<span class="text-primary">(14 unread)</span>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">(view all)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-secondary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-secondary">
														<i class="fa fa-usd"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Profit</h4>
														<div class="info">
															<strong class="amount">$ 14,890.30</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">(withdraw)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-tertiary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-shopping-cart"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Today's Orders</h4>
														<div class="info">
															<strong class="amount">38</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">(statement)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-quartenary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-user"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Today's Visitors</h4>
														<div class="info">
															<strong class="amount">3765</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">(report)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-3 col-lg-6">
							<section class="panel panel-transparent">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">My Profile</h2>
								</header>
								<div class="panel-body">
									<section class="panel panel-group">
										<header class="panel-heading bg-primary">

											<div class="widget-profile-info">
												<div class="profile-picture">
													<img src="assets/images/!logged-user.jpg">
												</div>
												<div class="profile-info">
													<h4 class="name text-semibold">John Doe</h4>
													<h5 class="role">Administrator</h5>
													<div class="profile-footer">
														<a href="#">(edit profile)</a>
													</div>
												</div>
											</div>

										</header>
										<div id="accordion">
											<div class="panel panel-accordion panel-accordion-first">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse1One">
															<i class="fa fa-check"></i> Tasks
														</a>
													</h4>
												</div>
												<div id="collapse1One" class="accordion-body collapse in">
													<div class="panel-body">
														<ul class="widget-todo-list">
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" checked="" id="todoListItem1" class="todo-check">
																	<label class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem2" class="todo-check">
																	<label class="todo-label" for="todoListItem2"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem3" class="todo-check">
																	<label class="todo-label" for="todoListItem3"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem4" class="todo-check">
																	<label class="todo-label" for="todoListItem4"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem5" class="todo-check">
																	<label class="todo-label" for="todoListItem5"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem6" class="todo-check">
																	<label class="todo-label" for="todoListItem6"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
														</ul>
														<hr class="solid mt-sm mb-lg">
														<form method="get" class="form-horizontal form-bordered">
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="input-group mb-md">
																		<input type="text" class="form-control">
																		<div class="input-group-btn">
																			<button type="button" class="btn btn-primary" tabindex="-1">Add</button>
																		</div>
																	</div>
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
											<div class="panel panel-accordion">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse1Two">
															 <i class="fa fa-comment"></i> Messages
														</a>
													</h4>
												</div>
												<div id="collapse1Two" class="accordion-body collapse">
													<div class="panel-body">
														<ul class="simple-user-list mb-xlg">
															<li>
																<figure class="image rounded">
																	<img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
																</figure>
																<span class="title">Joseph Doe Junior</span>
																<span class="message">Lorem ipsum dolor sit.</span>
															</li>
															<li>
																<figure class="image rounded">
																	<img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle">
																</figure>
																<span class="title">Joseph Junior</span>
																<span class="message">Lorem ipsum dolor sit.</span>
															</li>
															<li>
																<figure class="image rounded">
																	<img src="assets/images/!sample-user.jpg" alt="Joe Junior" class="img-circle">
																</figure>
																<span class="title">Joe Junior</span>
																<span class="message">Lorem ipsum dolor sit.</span>
															</li>
															<li>
																<figure class="image rounded">
																	<img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
																</figure>
																<span class="title">Joseph Doe Junior</span>
																<span class="message">Lorem ipsum dolor sit.</span>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</section>

								</div>
							</section>
						</div>
						<div class="col-xl-3 col-lg-6">
							<section class="panel panel-transparent">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">My Stats</h2>
								</header>
								<div class="panel-body">
									<section class="panel">
										<div class="panel-body">
											<div class="small-chart pull-right" id="sparklineBarDash"></div>
											<script type="text/javascript">
												var sparklineBarDashData = [5, 6, 7, 2, 0, 4 , 2, 4, 2, 0, 4 , 2, 4, 2, 0, 4];
											</script>
											<div class="h4 text-bold mb-none">488</div>
											<p class="text-xs text-muted mb-none">Average Profile Visits</p>
										</div>
									</section>
									<section class="panel">
										<div class="panel-body">
											<div class="circular-bar circular-bar-xs m-none mt-xs mr-md pull-right">
												<div class="circular-bar-chart" data-percent="45" data-plugin-options='{ "barColor": "#2baab1", "delay": 300, "size": 50, "lineWidth": 4 }'>
													<strong>Average</strong>
													<label><span class="percent">45</span>%</label>
												</div>
											</div>
											<div class="h4 text-bold mb-none">12</div>
											<p class="text-xs text-muted mb-none">Working Projects</p>
										</div>
									</section>
									<section class="panel">
										<div class="panel-body">
											<div class="small-chart pull-right" id="sparklineLineDash"></div>
											<script type="text/javascript">
												var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
											</script>
											<div class="h4 text-bold mb-none">89</div>
											<p class="text-xs text-muted mb-none">Pending Tasks</p>
										</div>
									</section>
								</div>
							</section>
							<section class="panel">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">
										<span class="label label-primary label-sm text-normal va-middle mr-sm">198</span>
										<span class="va-middle">Friends</span>
									</h2>
								</header>
								<div class="panel-body">
									<div class="content">
										<ul class="simple-user-list">
											<li>
												<figure class="image rounded">
													<img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
												</figure>
												<span class="title">Joseph Doe Junior</span>
												<span class="message truncate">Lorem ipsum dolor sit.</span>
											</li>
											<li>
												<figure class="image rounded">
													<img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle">
												</figure>
												<span class="title">Joseph Junior</span>
												<span class="message truncate">Lorem ipsum dolor sit.</span>
											</li>
											<li>
												<figure class="image rounded">
													<img src="assets/images/!sample-user.jpg" alt="Joe Junior" class="img-circle">
												</figure>
												<span class="title">Joe Junior</span>
												<span class="message truncate">Lorem ipsum dolor sit.</span>
											</li>
										</ul>
										<hr class="dotted short">
										<div class="text-right">
											<a class="text-uppercase text-muted" href="#">(View All)</a>
										</div>
									</div>
								</div>
								<div class="panel-footer">
									<div class="input-group input-search">
										<input type="text" class="form-control" name="q" id="q" placeholder="Search...">
										<span class="input-group-btn">
											<button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</section>
						</div>
						<div class="col-xl-6 col-lg-12">
							<section class="panel">
								<header class="panel-heading panel-heading-transparent">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">Company Activity</h2>
								</header>
								<div class="panel-body">
									<div class="timeline timeline-simple mt-xlg mb-md">
										<div class="tm-body">
											<div class="tm-title">
												<h3 class="h5 text-uppercase">November 2013</h3>
											</div>
											<ol class="tm-items">
												<li>
													<div class="tm-box">
														<p class="text-muted mb-none">7 months ago.</p>
														<p>
															It's awesome when we find a good solution for our projects, JSOFT Admin is <span class="text-primary">#awesome</span>
														</p>
													</div>
												</li>
												<li>
													<div class="tm-box">
														<p class="text-muted mb-none">7 months ago.</p>
														<p>
															Checkout! How cool is that!
														</p>
														<div class="thumbnail-gallery">
															<a class="img-thumbnail lightbox" href="assets/images/projects/project-4.jpg" data-plugin-options='{ "type":"image" }'>
																<img class="img-responsive" width="215" src="assets/images/projects/project-4.jpg">
																<span class="zoom">
																	<i class="fa fa-search"></i>
																</span>
															</a>
														</div>
													</div>
												</li>
											</ol>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<section class="panel panel-transparent">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">Global Stats</h2>
								</header>
								<div class="panel-body">
									<div id="vectorMapWorld" style="height: 350px; width: 100%;"></div>
								</div>
							</section>
						</div>
						<div class="col-lg-6 col-md-12">
							<section class="panel">
								<header class="panel-heading panel-heading-transparent">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">Projects Stats</h2>
								</header>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped mb-none">
											<thead>
												<tr>
													<th>#</th>
													<th>Project</th>
													<th>Status</th>
													<th>Progress</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>JSOFT - Responsive HTML5 Template</td>
													<td><span class="label label-success">Success</span></td>
													<td>
														<div class="progress progress-sm progress-half-rounded m-none mt-xs light">
															<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
																100%
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>2</td>
													<td>JSOFT - Responsive Drupal 7 Theme</td>
													<td><span class="label label-success">Success</span></td>
													<td>
														<div class="progress progress-sm progress-half-rounded m-none mt-xs light">
															<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
																100%
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>3</td>
													<td>Tucson - Responsive HTML5 Template</td>
													<td><span class="label label-warning">Warning</span></td>
													<td>
														<div class="progress progress-sm progress-half-rounded m-none mt-xs light">
															<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
																60%
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>4</td>
													<td>Tucson - Responsive Business WordPress Theme</td>
													<td><span class="label label-success">Success</span></td>
													<td>
														<div class="progress progress-sm progress-half-rounded m-none mt-xs light">
															<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
																90%
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>5</td>
													<td>JSOFT - Responsive Admin HTML5 Template</td>
													<td><span class="label label-warning">Warning</span></td>
													<td>
														<div class="progress progress-sm progress-half-rounded m-none mt-xs light">
															<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
																45%
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>6</td>
													<td>JSOFT - Responsive HTML5 Template</td>
													<td><span class="label label-danger">Danger</span></td>
													<td>
														<div class="progress progress-sm progress-half-rounded m-none mt-xs light">
															<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
																40%
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>7</td>
													<td>JSOFT - Responsive Drupal 7 Theme</td>
													<td><span class="label label-success">Success</span></td>
													<td>
														<div class="progress progress-sm progress-half-rounded mt-xs light">
															<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 95%;">
																95%
															</div>
														</div>
													</td>
												</tr>
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
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
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
				window.location = "/auction/listMyAuctionProduct?currentPage=1";
			});
		});
	</script>
  </body>
</html>