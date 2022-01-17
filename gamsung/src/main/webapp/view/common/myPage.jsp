<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">

			<title>MyPage</title>

			<jsp:include page="/resources/commonLib.jsp"></jsp:include>

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

				#Secession-btn {
					display: flex;
					justify-content: end;
					gap: 15px;
				}

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

				#get_checkPhoneAuthNum {
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
				<jsp:include page="header.jsp"></jsp:include>
				<div class="inner-wrapper">
					<jsp:include page="userSideBar.jsp"></jsp:include>
					<section role="main" class="content-body">
						<jsp:include page="../user/getGeneralUserUpdate.jsp"></jsp:include>
					</section>
				</div>
			</main>
			<jsp:include page="footer.jsp"></jsp:include>

			<!-- The Modal -->
			<div class="modal" id="addSecessionModal">
				<div class="modal-dialog-centered">
					<div class="modal-content">

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
									<button type="button" class="btn btn-primary" id="addSecession_btn">탈퇴하기</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>

			<script>
				$(function () {

					/* $("#addSecession_btn").on('click', function () {

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
									Swal.fire('완료되지 않은 거래내역 있어 탈퇴가 어렵습니다.거래완료 후 다시 시도해주세요.').then(() => {
										self.location = "/view/common/myPage.jsp";
									})

								}
							}, error: function (request, status, error) {
								alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
							}

						});
					}); */
				});
			</script>

		</body>

		</html>