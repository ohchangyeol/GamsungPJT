<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<style type="text/css">
			a {
				cursor: pointer;
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

			#Secession-btn {
				display: flex;
				justify-content: end;
				gap: 15px;
			}
		</style>

		<!-- sidebar Start -->
		<aside id="sidebar-left" class="sidebar-left">

			<div class="sidebar-header">
				<div class="sidebar-title" aria-hidden="true">마이페이지</div>
				<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html"
					data-fire-event="sidebar-left-toggle">
					<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
				</div>
			</div>

			<div class="nano">
				<div class="nano-content">
					<nav id="menu" class="nav-main" role="navigation">


						<!-- 메뉴 Start -->
						<ul class="nav nav-main">
							<hr class="separator" />
							<ul class="nav nav-main">
								<li>
									<a href="/" >
										<i class="bi bi-house-fill"></i>
										<span>홈으로</span>
									</a>
								</li>
							</ul>
							<li class="nav-parent">
								<a>
									<i class="fa fa-user" varia-hidden="true"></i>
									<span>내 정보</span>
								</a>
								<ul class="nav nav-children">
									<li>
										<a href="/user/mypage">
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


							<li class="nav-parent">
								<a>
									<i class="fa fa-camera" aria-hidden="true"></i>
									<span>캠핑</span>
								</a>
								<ul class="nav nav-children">
									<li><a id="my_reservation" style="cursor: pointer;"> 예약 내역</a></li>
									<li><a id="my_camp_qna" data-userid="${user.id}" style="cursor: pointer;"> 등록한 Q&A </a></li>
									<li><a id="my_camp_review" style="cursor: pointer;"> 등록한 리뷰 </a></li>
								</ul>
							</li>


							<li class="nav-parent">
								<a>
									<i class="fa fa-gavel" aria-hidden="true"></i>
									<span>중고경매</span>
								</a>
								<ul class="nav nav-children">
									<li><a id="auctionAdded"> 내가 등록한 상품 </a></li>
									<li><a id="auctionHistory"> 경매 내역 </a></li>
									<li><a id="auctionBid"> 응찰 관심 내역 </a></li>
									<li><a id="auctionReview"> 리뷰 </a></li>
								</ul>
							</li>


							<li class="nav-parent">
								<a>
									<i class="fa fa-quote-left" aria-hidden="true"></i>
									<span>커뮤니티</span>
								</a>
								<ul class="nav nav-children">
									<li><a href="/community/listMyPost"> 나의 커뮤니티게시물 </a></li>
									<li><a href="/community/listMyComment"> 나의 커뮤니티댓글 </a></li>
								</ul>
							</li>


							<!-- <li class="nav-parent">
								<a>
									<i class="fa  fa-refresh" aria-hidden="true"></i>
									<span>예약양도</span>
								</a>
								<ul class="nav nav-children">
									<li><a href="/transfer/listMyTransfer"> 나의 예약양도양수 </a></li>
								</ul>
							</li> -->



							<li class="nav-parent">
								<a>
									<i class="fa fa-money" aria-hidden="true"></i>
									<span>결제</span>
								</a>
								<ul class="nav nav-children">
									<li><a href="/payment/managePoint"> 포인트 충전/출금 </a></li>
									<li><a href="/payment/listPayment"> 내 결제/포인트 내역 </a></li>
								</ul>
							</li>

					<!-- 		<hr class="separator" />
							<hr class="separator" /> -->
						<!-- 	<hr class="separator" /> -->
							<hr class="separator" />
				
				
				<!-- <div class="sidebar-widget widget-stats mypage"> -->
								<ul class="nav nav-main">
									
									<li>
										<a href="/user/logout" target="_blank">
											<i class="fa fa-sign-out" aria-hidden="true"></i>
											<span>로그아웃</span>
										</a>
									</li>

								</ul>
							<!-- </div> -->
						</ul>
						<!-- 메뉴 End -->

					</nav>
				</div>
			</div>

		</aside>
		<!-- sidebar End -->


		<!-- The Modal -->
		<div class="modal" id="addSecessionModal">
			<div class="modal-dialog-centered">
				<div class="modal-content" style="width:500px;">

					<!-- Modal Header -->
					<div class="modal-header">
						<h5 class="modal-title">회원탈퇴</h5>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="" class="was-validated">
							<div class="form-group">
								<input type="text" class="form-control" id="secession-userId" value="${user.id}"
									name="id" required readonly>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="secession-userPwd"
									placeholder="비밀번호를 입력하세요" name="password" required>
							</div>
							<div id="Secession-btn">
								<button type="button" class="btn btn-success btn-circle"
									id="addSecession_btn">탈퇴하기</button>
								<button type="button" class="btn btn-danger btn-circle" data-dismiss="modal">취소</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		

		<script>
			$(function () {

				$('#my_reservation').on('click', function () {
					window.location = "/campGeneral/listMyReservation";
				});

				$('#my_camp_review').on('click', function () {
					window.location = "/campGeneral/listMyCampRatingReview";
				});

				$('#my_camp_qna').on('click', function () {
					window.location = "/campBusiness/listCampQna?userId="+$(this).data("userid");
				});

				$('#auctionAdded').on('click', function () {
					window.location = "/auction/listMyAuctionProduct/add?currentPage=1";
				});

				$('#auctionAdd').on('click', function () {
					window.location = "/auction/listMyAuctionProduct/add?currentPage=1";
				});

				$('#auctionHistory').on('click', function () {
					window.location = "/auction/listMyAuctionProduct/history?currentPage=1";
				});

				$('#auctionBid').on('click', function () {
					window.location = "/auction/listMyAuctionProduct/bid?currentPage=1";
				});

				$('#auctionReview').on('click', function () {
					window.location = "/auction/listMyAuctionProduct/review?currentPage=1";
				});


				$("#addSecession_btn").on('click', function () {

					var id = $("#secession-userId").val();
					var password = $("#secession-userPwd").val();
					//alert("여기는 들어오나");

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
							} else if (returnData == "0") {
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
								Swal.fire( {html : '완료되지 않은 거래내역 있어 탈퇴가 어렵습니다.<br>거래완료 후 다시 시도해주세요.'}).then(() => {
									self.location = "/user/mypage";
								})

							}
						}, error: function (request, status, error) {
							alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						}

					});
				});

			});

		</script>