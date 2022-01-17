<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 상단해더 Start -->
		<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
			<div class="container">

				<!-- 로고 Start -->
				<div class="navbar-header">
					<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">Gamsung</a>
				</div>
				<!-- 로고 End -->


				<!-- 메뉴 Start -->
				<div class="collapse navbar-collapse" id="custom-collapse">
					<ul class="nav navbar-nav navbar-right">

						<!-- 예시 Start -->
							<!-- 중고경매 Start -->
						<li class="dropdown"><a class="dropdown-toggle" href="" data-toggle="dropdown">중고상품</a>
							<ul class="dropdown-menu">
								<li><a id="addProduct">상품 등록</a></li>
								<li><a id="adminProduct">경매 진행 전</a></li>
								<li><a id="listProduct">경매 진행 중</a></li>
							</ul>
						</li>
						<!-- 중고경매 End -->


						<!-- 커뮤니티 Start -->
						<li class="dropdown"><a class="dropdown-toggle" href="/community/listPost"
								data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu">
								<li><a href="/community/listPost">커뮤니티</a></li>
							</ul>
						</li>
						<!-- 커뮤니티 End -->

						<!-- 양도양수 Start -->
						<li class="dropdown"><a class="dropdown-toggle" href="/servicecenter/home"
								data-toggle="dropdown">예약양도양수</a>
							<ul class="dropdown-menu">
								<li><a href="/transfer/listTransfer">예약 양도 목록</a></li>
								<li><a href="/transfer/addTransfer">냐의 양도 등록 </a></li>
							</ul>
						</li>
						<!-- 양도양수 End -->



						<!-- 고객센터 Start -->
						<li class="dropdown"><a class="dropdown-toggle" href="/servicecenter/home"
								data-toggle="dropdown">고객센터</a>
							<ul class="dropdown-menu">
								<li><a href="/servicecenter/listNotice">공지사항</a></li>
								<li><a href="/servicecenter/listQna"> Q&A </a></li>
								<c:if test="${sessionScope.user.role!=null}">
									<li><a href="/servicecenter/listReport?id=${user.id}">내
											신고 내역</a></li>
								</c:if>
							</ul>
						</li>
						<!-- 고객센터 End -->


						<!-- My / Business / Admin  Start -->
						<c:if test="${user.role == 'BUSINESS' || user.role == 'ADMIN'}">
							<li><a href="/campBusiness/goSubMainCampBusiness">BusinessPage</a>
						</c:if>

						<c:if test="${user.role == 'ADMIN' }">
							<li><a href="/campBusiness/goSubMainCampBusiness">AdminPage</a>
						</c:if>

						<c:if test="${user.role != 'BUSINESS' && sessionScope.user != null}">
							<li class="dropdown">
								<a class="dropdown-toggle" href="/user/mypage" data-toggle="dropdown">${user.nickName}
									<br /><span id="havingPoint">${user.havingPoint}</span> [P]
								</a>
								<ul class="dropdown-menu">
									<li><a href="/user/mypage">내정보</a>
									<li><a href="/community/listMyPost">내 게시글</a>
									<li><a href="">캠핑장</a>
									<li><a id="auctionAdd">중고경매</a>
									<li><a href="">예약양도</a>
									<li><a href="">결제</a>
									<li><a href="">고객센터</a>
									<li><a href="">결제</a>
								</ul>
							</li>
						</c:if>
						<!-- My / Business / Admin  End -->


						<!-- 로그인/로그아웃 End -->
						<li>
							<c:if test="${sessionScope.user.role!=null}">
								<a href="#">
									<button class="btn btn-border-w btn-round btn-xs" type="button"
										id="logout">LOGOUT</button>
								</a>
							</c:if>
							<c:if test="${sessionScope.user.role==null}">
								<a class="modal-basic" href="#modalBasic" id="header-login">
									<button class="btn btn-border-w btn-round btn-xs " type="button">LOGIN</button>
								</a>
							</c:if>
						</li>
						<!-- 로그인/로그아웃 End -->


					</ul>
				</div>
				<!-- 메뉴 End -->


			</div>
		</nav>
		<!-- 상단해더 End -->

		<!-- loginModal -->
		<jsp:include page="../user/loginModal.jsp" />
		<!-- findIdPwdModal -->
		<jsp:include page="/view/user/findIdPwdModal.jsp" />

		<script>
		$(function () {

			$('#addProduct').on('click', function () {
				if (${empty sessionScope.user }){
					alert('로그인 후 이용 가능합니다.');
					return;
				} else if(${ sessionScope.user.role eq 'BUSINESS' }){
					alert('사업자 회원은 이용 불가능합니다.');
					return;
				} else if (${ sessionScope.user.auctionSuspension != null }){
					alert('경매 이용 정지되었습니다. 관리자에게 문의하세요.');
					return;
				}
				window.location = '/auction/addAuctionProduct';
			});

			$('#adminProduct').on('click', function () {
				if (${ sessionScope.user.auctionSuspension != null }){
					alert('경매 이용 정지되었습니다. 관리자에게 문의하세요.');
					return;
				} else if(${ sessionScope.user.role eq 'BUSINESS' }){
					alert('사업자 회원은 이용 불가능합니다.');
					return;
				}
				window.location = "/auction/listAdminAuctionProduct";
			});

			$('#listProduct').on('click', function () {
				if (${ sessionScope.user.auctionSuspension != null }){
					alert('경매 이용 정지되었습니다. 관리자에게 문의하세요.');
					return;
				} else if(${ sessionScope.user.role eq 'BUSINESS' }){
					alert('사업자 회원은 이용 불가능합니다.');
					return;
				}
				window.location = "/auction/listAuctionProduct";
			});
			
			$('#auctionAdd').on('click', function () {
				window.location = "/auction/listMyAuctionProduct/add?currentPage=1";
			});
		});

		$(function () {
			$('#havingPoint').text(comma($('#havingPoint').text()));
		});

		// 금액 "," 추가
		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}


		</script>