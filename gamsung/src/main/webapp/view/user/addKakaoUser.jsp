<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">

			<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
			<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
			<jsp:include page="/resources/commonLib.jsp"></jsp:include>


			<title>회원가입</title>

			<style>
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

				.checkFont {
					font-size: 12px;
					padding-left: 28px;
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
					<!-- <section class="module bg-dark-30 about-page-header"
						data-background="../../resources/images/addGeneralUserImg.png"> -->
					<div class="container" style="padding-top: 72px;">
						<img src="../../resources/images/addGeneralUserImg.png" alt="">
					</div>
					<!-- </section> -->
					<section class="module" style="padding-top:50px;">
						<div class="container">
							<!-- <div class="row"> -->
							<div class="col-sm-8 col-sm-offset-2">
								<h4 class="font-alt mb-0">Kakao 간편 회원가입</h4>
								<hr class="divider-w mt-10 mb-20">
								<form id="add_kakao_form">
									<div id="email" class="form-group row">
										<div><input id="add_kakao_role" name="role" value="GENERAL" hidden="hidden">
										</div>
										<label for="add_kakao_id"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
										<div class="col-sm-6">
											<input id="add_kakao_id" name="id" class="form-control " type="text"
												value="${kakaoUser.id}" placeholder="아이디는 이메일 형식만 가능합니다." />
										</div>
										<div id="check-email" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div class="form-group row">
										<label for="add_kakao_password"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호</strong></label>
										<div class="col-sm-6">
											<input id="add_kakao_password" name="password" class="form-control "
												type="password" placeholder="비밀번호는 8~15자까지 입력 가능합니다." />
										</div>
										<div></div>
										<div id="check-pwd-exp" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div class="form-group row">
										<label for="add_kakao_confirmPassword"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
												재확인</strong></label>
										<div class="col-sm-6">
											<input id="add_kakao_confirmPassword" name="confirmPassword"
												class="form-control" type="password" placeholder="비밀번호를 입력해 주세요." />
										</div>
										<div></div>
										<div id="add_kakao_check-pwd" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div id="add_kakao_nick-name" class="form-group row">
										<label for="add_kakao_nickName"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>닉네임</strong></label>
										<div class="col-sm-6">
											<input id="add_kakao_nickName" name="nickName" class="form-control"
												type="text" value="${kakaoUser.nickName}" placeholder="닉네임을 입력해 주세요." />
										</div>
										<div></div>
										<div id="add_kakao_check-nickName" class='col-sm-offset-3 col-sm-6 checkFont'>
										</div>
									</div>


									<div class="form-group row">
										<label for="add_kakao_name"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
										<div class="col-sm-6">
											<input id="add_kakao_name" name="name" class="form-control" type="text"
												placeholder="이름을 입력하세요" />
										</div>
										<div></div>
									</div>

									<div class="form-group row">
										<label for="add_kakao_phone"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
										<div class="col-sm-6">
											<input id="add_kakao_phone" name="phone" class="form-control " type="text"
												placeholder="숫자만 입력해주세요" maxlength="11" />

										</div>
										<div>
											<button id="add_kakao_phoneAuthNum" class="btn btn-circle btn-xs"
												type="button" style="display:none;">인증번호
												받기</button>
										</div>


										<div id="add_kakao_checkPhoneAuth" class="col-sm-offset-3 col-sm-6"
											style="display:none; margin: 15px; margin-left: 200px;">
											<input id="add_kakao_checkPhoneAuthNum" name="checkPhoneAuthNum"
												class="form-control " type="text" placeholder="인증번호를 입력하세요."
												maxlength="4" />
										</div>
										<div id="add_kakao_check-phone" class='col-sm-offset-3 col-sm-6 checkFont'>
										</div>
										<div id="add_kakao_check-phone-auth" class='col-sm-offset-3 col-sm-6 checkFont'>
										</div>
									</div>
									<div>
										<input id="add_kakao_snsId" hidden="hidden" name="snsId" value="${user.snsId}">
									</div>
								</form>

							</div>
							<!-- </div> -->

							<br />
							<div class="col-sm-3 col-sm-offset-2"></div>
							<div class="col-sm-3 col-sm-offset-2">
								<div class="row">
									<button id="kakao_cancel" class="btn btn-border-d btn-circle"
										type="button">취소</button>
									<button id="kakao_joinAddUser" class="btn btn-border-d btn-circle"
										type="button">가입하기</button>

								</div>
							</div>
						</div>
					</section>
				</div>
			</main>

			<script type="text/javascript">

				$(function () {

					//아이디 유효성 및 중복체크
					$("#add_kakao_id").on("keyup", function () {
						// console.log("가나다");
						var email = $("#add_kakao_id").val();
						console.log(email);
						console.log(email);
						$.ajax({
							url: '/user/rest/checkDuplication',
							headers: {
								"Accept": "application/json",
								"Content-Type": "application/json"
							},
							method: 'POST',
							dataType: 'json',
							data: JSON.stringify({ "id": email }),
							success: function (result) {

								console.log('성공: ' + result);

								if (result == 0) {
									if (email != "") {
										if (email.indexOf('@') < 1 || email.indexOf('.') == -1) {
											$("#add_kakao_check-email").html("Email형식이 아닙니다.");
										} else {
											$("#add_kakao_check-email").html('사용 가능한 아이디입니다.');
											$("#add_kakao_check-email").css('color', 'green');
										}
									} else {
										$("#add_kakao_check-email").html("");
									}

								} else {
									$("#add_kakao_check-email").html('이미 사용중이거나 중복된 아이디 입니다.');
									$("#add_kakao_check-email").css('color', 'red');
								}

							} /* ,error :  function(request,status,error){// 에러발생시 실행할 함수
alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
}*/
						});
					});


					//비밀번호
					$('#add_kakao_password').on("keyup", function () {
						var regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g; //한글입력 불가
						var pwd = $('#add_kakao_password').val();

						if (pwd.length < 1) {
							$("#add_kakao_check-pwd-exp").html("");

						} else if (regExp.test(pwd)) {
							$("#add_kakao_check-pwd-exp").html("한글은 입력 불가합니다.");
							$("#add_kakao_check-pwd-exp").css('color', 'red');
						}

					});

					//비밀번호 확인
					$('#add_kakao_confirmPassword').on("keyup", function () {


						if ($('#add_kakao_confirmPassword').val().length < 0) {
							$("#add_kakao_check-pwd").html("");
						} else if ($('#add_kakao_password').val() != $('#add_kakao_confirmPassword').val() || $('#add_kakao_confirmPassword').val() != '') {
							$("#add_kakao_check-pwd").html('비밀번호가 일치하지 않습니다.');
							$("#add_kakao_check-pwd").css('color', 'red');
							$('#add_kakao_confirmPassword').focus();
						}
						if ($('#add_kakao_password').val() == $('#add_kakao_confirmPassword').val()) {
							$("#add_kakao_check-pwd").html('비밀번호가 일치합니다.');
							$("#add_kakao_check-pwd").css('color', 'green');
						}
					});

					//닉네임 중복체크
					$("#add_kakao_nickName").on("keyup", function () {

						var nickName = $("#add_kakao_nickName").val();

						$.ajax({
							url: '/user/rest/checkDuplication',
							headers: {
								"Accept": "application/json",
								"Content-Type": "application/json"
							},
							method: 'POST',
							dataType: 'json',
							data: JSON.stringify({ "nickName": nickName }),
							success: function (result) {
								console.log('성공: ' + result);
								if (result == 0) {
									if (nickName.length > 1) {
										$("#add_kakao_check-nickName").html('사용 가능한 닉네임입니다.');
										$("#add_kakao_check-nickName").css('color', 'green');
									} else {
										$("#add_kakao_check-nickName").html("");
									}
								} else {
									$("#add_kakao_check-nickName").html('이미 사용중이거나 중복된 닉네임 입니다.');
									$("#add_kakao_check-nickName").css('color', 'red');
								}
							}
						});

					});

					//휴대폰번호 중복체크
					$("#add_kakao_phone").on("keyup", function () {

						var regExp = /^[0-9]*$/;
						var phone = $("#add_kakao_phone").val();

						$.ajax({
							url: '/user/rest/checkDuplication',
							headers: {
								"Accept": "application/json",
								"Content-Type": "application/json"
							},
							method: 'POST',
							dataType: 'json',
							data: JSON.stringify({ "phone": phone }),
							success: function (result) {
								console.log('성공: ' + result);

								if (result == 0) {
									if (email != "") {
										if (!(regExp.test(phone))) {
											$("#add_kakao_phone").val("");
											$("#add_kakao_check-phone").html("휴대폰번호는 숫자로만 입력 가능합니다.");
										} else if (phone.length == 11) {
											$("#add_kakao_check-phone").html('사용 가능한 번호입니다.');
											$("#add_kakao_phoneAuthNum").show();
											$("#add_kakao_check-phone").css('color', 'green');
										} else if (phone.length > 11) {
											$("#add_kakao_phone").val("");
											$("#add_kakao_check-phone").html("휴대폰번호는 11자리만 가능합니다.");
										} else {
											$("#add_kakao_check-phone").html("");
										}

									} else {
										$("#add_kakao_check-phone").html('이미 사용중이거나 중복된 휴대폰번호 입니다.');
										$("#add_kakao_check-phone").css('color', 'red');
									}
								}
							}
						});

					});

					//휴대폰 인증번호 받기
					$("#add_kakao_phoneAuthNum").on("click", function () {

						$("#add_kakao_phoneAuthNum").text("인증번호 재발송");
						$("#add_kakao_check-phone").hide();
						$("#add_kakao_checkPhoneAuth").show();

						var phone = $("#add_kakao_phone").val();

						$.ajax({
							url: '/user/rest/sendPhoneAuthNum/' + phone,
							headers: {
								"Accept": "application/json",
								"Content-Type": "application/json"
							},
							method: 'GET',
							//dataType:'json',
							//data : JSON.stringify({"phone" : phone}),	
							success: function (dataa) {
								console.log('성공: ' + dataa);

								$("#add_kakao_checkPhoneAuthNum").on("keyup", function () {
									console.log('되는가');
									var ab = $("#add_kakao_checkPhoneAuthNum").val();

									if (ab.length > 0) {
										if (dataa == ab) {
											$("#add_kakao_check-phone-auth").html("인증번호가 일치합니다.");
										} else {
											$("#add_kakao_check-phone-auth").html('인증번호를 확인하세요.');
										}
									}
								});
							}
						});
					});

					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#kakao_joinAddUser").on("click", function () {
						console.log("뭐지");
						fncAddUser();
					});

					function fncAddUser() {

						var id = $("input#add_kakao_id").val();
						var pw = $("#add_kakao_password").val();
						var pw_confirm = $("#add_kakao_confirmPassword").val();
						var name = $("#add_kakao_name").val();
						var nickName = $("#add_kakao_nickName").val();
						var phone = $("#add_kakao_phone").val();

						if (id == null || id.length < 1) {
							alert("아이디는  반드시 입력하셔야 합니다.");
							return;
						}
						if (pw == null || pw.length < 1) {
							alert("패스워드는  반드시 입력하셔야 합니다.");
							return;
						}

						if (pw.length < 8) {
							alert("패스워드는 8자 이상이어야 합니다.");
							return;
						}

						// if (pw_confirm == null || pw_confirm.length < 1) {
						// 	alert("패스워드 확인은  반드시 입력하셔야 합니다.");
						// 	return;
						// }

						if (name == null || name.length < 1) {
							alert("이름은  반드시 입력하셔야 합니다.");
							return;
						}

						if (pw != pw_confirm) {
							alert("비밀번호 확인이 일치하지 않습니다.");
							$("#cadd_kakao_onfirmPassword").focus();
							return;
						}

						if (nickName == null || nickName.length < 1) {
							alert("닉네임은 반드시 입력하셔야 합니다.");
							return;
						}

						if (phone == null || phone.length < 1) {
							alert("휴대폰번호는 반드시 입력하셔야 합니다.");
							return;
						}

						Swal.fire({
								icon: 'success',
								title: '가입완료',
								html: '회원가입이 완료되었습니다.<br>로그인 후 이용 가능합니다:)'
							}).then(() => {

								$("#add_kakao_form").attr("method", "POST").attr("action", "/user/addUser").submit();

							});

						
					}
				});

			</script>
		</body>

		</html>