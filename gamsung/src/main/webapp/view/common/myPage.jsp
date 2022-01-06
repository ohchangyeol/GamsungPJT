<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<link rel="apple-touch-icon" sizes="57x57" href="../../resources/images/favicons/apple-icon-57x57.png">
			<link rel="apple-touch-icon" sizes="60x60" href="../../resources/images/favicons/apple-icon-60x60.png">
			<link rel="apple-touch-icon" sizes="72x72" href="../../resources/images/favicons/apple-icon-72x72.png">
			<link rel="apple-touch-icon" sizes="76x76" href="../../resources/images/favicons/apple-icon-76x76.png">
			<link rel="apple-touch-icon" sizes="114x114" href="../../resources/images/favicons/apple-icon-114x114.png">
			<link rel="apple-touch-icon" sizes="120x120" href="../../resources/images/favicons/apple-icon-120x120.png">
			<link rel="apple-touch-icon" sizes="144x144" href="../../resources/images/favicons/apple-icon-144x144.png">
			<link rel="apple-touch-icon" sizes="152x152" href="../../resources/images/favicons/apple-icon-152x152.png">
			<link rel="apple-touch-icon" sizes="180x180" href="../../resources/images/favicons/apple-icon-180x180.png">
			<link rel="icon" type="image/png" sizes="192x192"
				href="../../resources/images/favicons/android-icon-192x192.png">
			<link rel="icon" type="image/png" sizes="32x32" href="../../resources/images/favicons/favicon-32x32.png">
			<link rel="icon" type="image/png" sizes="96x96" href="../../resources/images/favicons/favicon-96x96.png">
			<link rel="icon" type="image/png" sizes="16x16" href="../../resources/images/favicons/favicon-16x16.png">
			<meta name="msapplication-TileColor" content="#ffffff">
			<meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
			<meta name="theme-color" content="#ffffff">

			<link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			<!-- Template specific stylesheets-->
			<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
			<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
				rel="stylesheet">
			<link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
			<link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
			<link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
			<link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
			<link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
			<link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
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
				.sidebar-left {
					background-color: #171717 !important;
				}

				#addSecessionModal .modal-dialog .modal-content .was-validated .form-group .form-control {
					border-radius: 100px;
					padding-left: 20px;
					height: 40px;
					font-size: 13px;
				}

				#addSecessionModal {

					position: absolute;
					top: 50%;
					left: 50%;
					transform: translateY(-50%) translateX(-50%);
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
							<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed"
								data-target="html" data-fire-event="sidebar-left-toggle">
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
											<a href="http://themeforest.net/item/JSOFT-responsive-html5-template/4106987?ref=JSOFT"
												target="_blank">
												<i class="fa fa-sign-out" aria-hidden="true"></i>
												<span>로그아웃</span>
											</a>
										</li>
										<hr class="separator" />
										<hr class="separator" />
										<hr class="separator" />
										<hr class="separator" />
										<hr class="separator" />

									</ul>


								</nav>
							</div>
						</div>
					</aside>
					<!-- end: sidebar -->

					<section role="main" class="content-body">
						<div class="row">
							<style>
								/* .form-group{
											 display: flex;
											 flex: 1 auto;
										 } */
								.time {
									display: flex;
								}

								/* .form-group .form-control{
											 display:inline-block;
											 width: 50%;
										 } */
								.form-group .btn {
									height: 26px;
									padding-top: 0;
									padding-bottom: 0;
									margin: auto 10px;
									color: blue;
								}

								.form-group label {
									width: 140px;
								}

								#checkMailAuthNum {
									margin: 14px;
								}

								#checkPhoneAuthNum {
									margin: 14px;
								}
							</style>

							<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
							<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


							</head>

							<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
								<main>
									<div class="page-loader">
										<div class="loader">Loading...</div>
									</div>
									<jsp:include page="../common/header.jsp"></jsp:include>
									<div class="main">
										<section class="module bg-dark-30 about-page-header"
											data-background="assets/images/about_bg.jpg">
											<div class="container">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<h1 class="module-title font-alt mb-0">Forms</h1>
													</div>
												</div>
											</div>
										</section>
										<section class="module">
											<div class="container">
												<div class="row">
													<div class="col-sm-8 col-sm-offset-2">
														<h4 class="font-alt mb-0">내정보 조회/수정</h4>
														<hr class="divider-w mt-10 mb-20">
														<form class="form" role="form">
															<div id="email" class="form-group">
																<div><input id="role" name="role" value="GENERAL"
																		hidden="hidden"></div>
																<label for="id"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
																<div class="col-sm-6">
																	<input id="id" name="id" class="form-control "
																		value="${user.id}" readonly />
																</div>
																<div class='col-sm-offset-3 col-sm-6'><span
																		id="helpBlock" class="help-block">
																		<strong class="text-danger">아이디는 수정이
																			불가합니다.</strong>
																	</span></div>
															</div>

															<div class="form-group">
																<label for="password"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
																		변경</strong></label>
																<div class="col-sm-6">
																	<input id="password" name="password"
																		class="form-control " type="password"
																		placeholder="변경할 비밀번호를 입력해 주세요." />
																</div>
																<div id="check-pwd-exp"
																	class='col-sm-offset-3 col-sm-6'></div>
															</div>

															<div class="form-group">
																<label for="confirmPassword"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
																		재확인</strong></label>
																<div class="col-sm-6">
																	<input id="confirmPassword" name="confirmPassword"
																		class="form-control" type="password"
																		placeholder="비밀번호를 입력해 주세요." />
																</div>
																<div id="check-pwd" class='col-sm-offset-3 col-sm-6'>
																</div>
															</div>

															<div id="nick-name" class="form-group">
																<label for="nickName"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>닉네임</strong></label>
																<div class="col-sm-6">
																	<input id="nickName" name="nickName"
																		class="form-control" type="text"
																		value="${user.nickName}"
																		placeholder="닉네임을 입력해 주세요." />
																</div>
																<div id="check-nickName"
																	class='col-sm-offset-3 col-sm-6'></div>
															</div>


															<div class="form-group">
																<label for="name"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
																<div class="col-sm-6">
																	<input id="name" name="name" class="form-control"
																		type="text" value="${user.name}"
																		placeholder="이름을 입력하세요" />
																</div>
															</div>

															<div class="form-group">
																<label for="phone"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
																<div class="col-sm-6">
																	<input id="phone" name="phone" class="form-control "
																		type="text" value="${user.phone}"
																		placeholder="숫자만 입력해주세요" maxlength="11" />

																</div>
																<button id="phoneAuthNum" class="btn btn-circle btn-xs"
																	type="button">인증번호 받기</button>
																<div id="checkPhoneAuth"
																	class="col-sm-offset-3 col-sm-6"
																	style="display:none;">
																	<input id="checkPhoneAuthNum"
																		name="checkPhoneAuthNum" class="form-control "
																		type="text" placeholder="인증번호를 입력하세요."
																		maxlength="4" />
																</div>
																<div id="check-phone" class='col-sm-offset-3 col-sm-6'>
																</div>
																<div id="check-phone-auth"
																	class='col-sm-offset-3 col-sm-6'></div>
															</div>

															<div class="form-group">
																<label for="addr"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>주소</strong></label>
																<div class="col-sm-6">
																	<input id="addr" name="addr" class="form-control"
																		type="text" value="${user.addr}"
																		placeholder="주소를 입력하세요." />
																</div>
															</div>

															<div class="form-group">
																<label for="userAddr"
																	class="col-sm-offset-1 col-sm-3 control-label"></label>
																<div class="col-sm-6">
																	<input id="userAddr" name="userAddr"
																		class="form-control" type="text"
																		placeholder="상세주소를 입력하세요." /> <input
																		type="hidden" name="allAddr" />
																</div>
															</div>

															<div class="form-group">
																<label for="accountInfo"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>계좌정보</strong></label>
																<div class="col-sm-3">
																	<select class="form-control" name="bank" id="bank">
																		<option value="${user.bank}">은행</option>
																		<option value="KB국민은행" <c:if
																			test="${user.bank eq 'KB국민은행'}">
																			selected="selected"</c:if>>KB국민은행</option>
																		<option value="신한은행" <c:if
																			test="${user.bank eq '신한은행'}">
																			selected="selected"</c:if>>신한은행</option>
																		<option value="우리은행" <c:if
																			test="${user.bank eq '우리은행'}">
																			selected="selected"</c:if>>우리은행</option>
																		<option value="하나은행" <c:if
																			test="${user.bank eq '하나은행'}">
																			selected="selected"</c:if>>하나은행</option>
																		<option value="NH농협은행" <c:if
																			test="${user.bank eq 'NH농협은행'}">
																			selected="selected"</c:if>>NH농협은행</option>
																		<option value="카카오뱅크" <c:if
																			test="${user.bank eq '카카오뱅크'}">
																			selected="selected"</c:if>>카카오뱅크</option>
																	</select>
																</div>
																<div class="col-sm-3">
																	<input id="accountHolder" name="accountHolder"
																		class="form-control" type="text"
																		value="${user.accountHolder}"
																		placeholder="예금주" />
																</div>
															</div>

															<div class="form-group">
																<label
																	class="col-sm-offset-1 col-sm-3 control-label"></label>
																<div class="col-sm-6">
																	<input id="accountNum" name="accountNum"
																		class="form-control" type="text"
																		placeholder="계좌번호를 숫자만 입력하세요" maxlength="14" />
																</div>
															</div>

															<div id="entryDate" class="form-group">
																<label for="entryDate"
																	class="col-sm-offset-1 col-sm-3 control-label"><strong>회원가입
																		일자</strong></label>
																<div class="col-sm-6">
																	<input id="entryDate" name="addUserRegDate"
																		class="form-control" type="text"
																		value="${user.addUserRegDate}" readonly />
																</div>
															</div>
														</form>

													</div>
												</div>

												<br />
												<div class="col-sm-3 col-sm-offset-2"></div>
												<div class="col-sm-3 col-sm-offset-2">
													<div class="row">
														<button id="cancel" class="btn btn-border-d btn-circle"
															type="button">취소</button>
														<button id="updateUser" class="btn btn-border-d btn-circle"
															type="submit">수정하기</button>

													</div>
												</div>
											</div>
										</section>
									</div>
								</main>
						</div>

						<!-- start: page -->
						<div class="row">
							<div class="col-md-6 col-lg-12 col-xl-6">
								<section class="panel">

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
												<div data-plugin-datepicker data-plugin-skin="dark"></div>

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
															<img src="assets/images/!sample-user.jpg" alt="Joseph Doe"
																class="img-circle">
														</figure>
														<div class="profile-info">
															<span class="name">Joseph Doe Junior</span>
															<span class="title">Hey, how are you?</span>
														</div>
													</li>
													<li class="status-online">
														<figure class="profile-picture">
															<img src="assets/images/!sample-user.jpg" alt="Joseph Doe"
																class="img-circle">
														</figure>
														<div class="profile-info">
															<span class="name">Joseph Doe Junior</span>
															<span class="title">Hey, how are you?</span>
														</div>
													</li>
													<li class="status-offline">
														<figure class="profile-picture">
															<img src="assets/images/!sample-user.jpg" alt="Joseph Doe"
																class="img-circle">
														</figure>
														<div class="profile-info">
															<span class="name">Joseph Doe Junior</span>
															<span class="title">Hey, how are you?</span>
														</div>
													</li>
													<li class="status-offline">
														<figure class="profile-picture">
															<img src="assets/images/!sample-user.jpg" alt="Joseph Doe"
																class="img-circle">
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
												<p>The languages only differ in their grammar, their pronunciation and
													their most common words.</p>
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
														<div class="widget-posts-image"><a href="#"><img
																	src="assets/images/rp-1.jpg"
																	alt="Post Thumbnail" /></a>
														</div>
														<div class="widget-posts-body">
															<div class="widget-posts-title"><a href="#">Designer Desk
																	Essentials</a></div>
															<div class="widget-posts-meta">23 january</div>
														</div>
													</li>
													<li class="clearfix">
														<div class="widget-posts-image"><a href="#"><img
																	src="assets/images/rp-2.jpg"
																	alt="Post Thumbnail" /></a>
														</div>
														<div class="widget-posts-body">
															<div class="widget-posts-title"><a href="#">Realistic
																	Business Card Mockup</a></div>
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
											<p class="copyright font-alt">&copy; 2017&nbsp;<a
													href="index.html">TitaN</a>, All
												Rights Reserved</p>
										</div>
										<div class="col-sm-6">
											<div class="footer-social-links"><a href="#"><i
														class="fa fa-facebook"></i></a><a href="#"><i
														class="fa fa-twitter"></i></a><a href="#"><i
														class="fa fa-dribbble"></i></a><a href="#"><i
														class="fa fa-skype"></i></a>
											</div>
										</div>
									</div>
								</div>
							</footer>
							<div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>

			</main>
			<!-- The Modal -->
			<div class="modal" id="addSecessionModal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h5 class="modal-title">회원탈퇴</h5>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<form action="" class="was-validated">
								<div class="form-group">
									<input type="text" class="form-control" id="secession-userId"
										placeholder="아이디를 입력하세요" name="id" required>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="secession-userPwd"
										placeholder="비밀번호를 입력하세요" name="password" required>
								</div>
								<div class="row" style="margin-left: 70%;">
									<button type="button" class="btn btn-primary" id="addSecession">탈퇴하기</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>

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
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


			<script src="../../resources/js/theme.js"></script>
			<script src="../../resources/js/theme.custom.js"></script>
			<script src="../../resources/js/theme.init.js"></script>
			<script src="../../resources/js/dashboard/examples.dashboard.js"></script>

			<script>
				$(document).ready(function () {
					$('#listMyProduct').on('click', function () {
						window.location = "/auction/listMyAuctionProduct?currentPage=1";
					});

					$("#addSecession").on('click', function () {

						var id = $("#secession-userId").val();
						var password = $("#secession-userPwd").val();
						alert("여기는 들어오나");

						$.ajax({
							url: '/user/rest/addSecessionUser',
							headers: {
								"Accept": "application/json",
								"Content-Type": "application/json"
							},
							method: 'POST',
							dataType: 'json',
							data: JSON.stringify({
								"id": id,
								"password": password
							}),
							success: function (returnData) {

								console.log('성공: ' + returnData);
								if (returnData == 5) {
									$.ajax({
										url: '/user/rest/kakaounlink',
										headers: {
											"Accept": "application/json",
											"Content-Type": "application/json"
										},
										method: 'POST',
										// dataType: 'json',
										// data: JSON.stringify({
										// 	"id": id,
										// 	"password": password,
										// }),

										success: function (kData) {
											console.log('성공: ' + kData);
											if (kData == 0) {

												Swal.fire({
													title: '탈퇴하시겠습니까?',
													text: "탈퇴후엔 같은 아이디로 재가입이 불가합니다!",
													icon: 'warning',
													showCancelButton: true,
													confirmButtonColor: '#3085d6',
													cancelButtonColor: '#d33',
													confirmButtonText: '탈퇴',
													cancelButtonText: '취소'
												}).then((result) => {
													if (result.isConfirmed) {
														Swal.fire(
															'탈퇴완료!',
															'success'
														).then(() => {
															self.location = "/";
														})
													}
												})


											}

										}
									})
								}

								else if (returnData == "0") {
									Swal.fire({
										title: '탈퇴하시겠습니까?',
										text: "탈퇴후엔 같은 아이디로 재가입이 불가합니다!",
										icon: 'warning',
										showCancelButton: true,
										confirmButtonColor: '#3085d6',
										cancelButtonColor: '#d33',
										confirmButtonText: '탈퇴',
										cancelButtonText: '취소'
									}).then((result) => {
										if (result.isConfirmed) {
											Swal.fire(
												'탈퇴완료!',
												'success'
											).then(() => {
												self.location = "/user/logout";
											})
										}
									})

								} else {
									Swal.fire('완료되지 않은 거래내역 있어 탈퇴가 어렵습니다.거래완료 후 다시 시도해주세요.').then(() => {
										self.location = "/view/common/myPage.jsp";
									})

								}
							}, error: function (request, status, error) {
								alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
							}

						});
					});
				});
			</script>
		</body>

		</html>