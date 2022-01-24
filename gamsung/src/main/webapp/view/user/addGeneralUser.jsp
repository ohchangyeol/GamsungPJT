<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">

			<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
			<jsp:include page="/resources/commonLib.jsp"></jsp:include>

			<title>회원가입</title>


			<style>
				.time {
					display: flex;
				}

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

				.container .add_user_btn_btn {
					position: relative;
					bottom: 10%;
					right: 7%;
					margin-top: 15px;
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
					<section class="module" style="padding-top:0;">
						<div class="container">
							<!-- <div class="row"> -->
							<div class="col-sm-8 col-sm-offset-2">
								<hr class="divider-w mt-10 mb-20">
								<form id="add_g_form" class="form" role="form">
									<div id="email" class="form-group row">
										<div><input id="role" name="role" value="GENERAL" hidden="hidden"></div>
										<label for="addGeneralId"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
										<div class="col-sm-6">
											<input id="addGeneralId" name="id" class="form-control " type="text"
												placeholder="아이디는 이메일 형식만 가능합니다." />
										</div>
										<div id="add_mailAuthNum" style="display:none;">
											<button id="mailAuthNum" class="btn btn-circle btn-xs" type="button">인증번호
												받기</button>
										</div>
										<div id="checkMailAuth" class="col-sm-offset-3 col-sm-6" style="display:none;">
											<input id="checkMailAuthNum" name="checkMailAuthNum" class="form-control "
												type="text" placeholder="인증번호를 입력하세요." maxlength="6" />
										</div>
										<div id="check-email" class='col-sm-offset-3 col-sm-6 checkFont'></div>
										<div id="check-email-auth" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div class="form-group row">
										<label for="password"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호</strong></label>
										<div class="col-sm-6">
											<input id="addGeneralPassword" name="password" class="form-control "
												type="password" placeholder="비밀번호는 8~15자까지 입력 가능합니다." maxlength="15" />
										</div>
										<div></div>
										<div id="check-pwd-exp" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div class="form-group row">
										<label for="confirmPassword"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
												재확인</strong></label>
										<div class="col-sm-6">
											<input id="addConfirmPassword" name="confirmPassword" class="form-control"
												type="password" placeholder="비밀번호를 입력해 주세요." maxlength="15" />
										</div>
										<div></div>
										<div id="check-pwd" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div id="nick-name" class="form-group row">
										<label for="nickName"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>닉네임</strong></label>
										<div class="col-sm-6">
											<input id="nickName" name="nickName" class="form-control" type="text"
												placeholder="닉네임을 입력해 주세요." />
										</div>
										<div></div>
										<div id="check-nickName" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>


									<div class="form-group row">
										<label for="name"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
										<div class="col-sm-6">
											<input id="addGeneralname" name="name" class="form-control" type="text"
												placeholder="이름을 입력하세요" />
										</div>
										<div></div>
									</div>

									<div class="form-group row">
										<label for="phone"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
										<div class="col-sm-6">
											<input id="addGeneralPhone" name="phone" class="form-control " type="text"
												placeholder="숫자만 입력해주세요" maxlength="11" />

										</div>
										<div id="phoneAuthNum_btn" style="display:none;">
											<button id="phoneAuthNum" class="btn btn-circle btn-xs" type="button">인증번호
												받기</button>
										</div>


										<div id="checkPhoneAuth" class="col-sm-offset-3 col-sm-6" style="display:none;">
											<input id="add_g_checkPhoneAuthNum" name="checkPhoneAuthNum"
												class="form-control " type="text" style=" margin: 15px;"
												placeholder="인증번호를 입력하세요." maxlength="4" />
										</div>
										<div id="check-phone" class='col-sm-offset-3 col-sm-6 checkFont'></div>
										<div id="check-phone-auth" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div class="form-group row">
										<label for="addr"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>주소</strong></label>
										<div class="col-sm-6">
											<input id="add_g_addr" name="addr" class="form-control" type="text"
												placeholder="주소를 입력하세요." />
										</div>
									</div>

									<div class="form-group row">
										<label for="userAddr" class="col-sm-offset-1 col-sm-3 control-label"></label>
										<div class="col-sm-6">
											<input id="add_g_userAddr" name="userAddr" class="form-control" type="text"
												placeholder="상세주소를 입력하세요." /> <input type="hidden" name="allAddr" />
										</div>
									</div>
								</form>

							</div>
							<!-- </div> -->

							<div class="col-sm-3 col-sm-offset-2"></div>
							<div class="col-sm-3 col-sm-offset-2">
								<div class="add_user_btn_btn row">
									<button id="get_g_cancel" class="btn btn-border-d btn-circle"
										type="button">취소</button>
									<button id="joinAddUser" class="btn btn-border-d btn-circle"
										type="submit">가입하기</button>

								</div>
							</div>
						</div>
					</section>
				</div>
			</main>

			<script type="text/javascript">

				$(function () {

					const space = /\s/; //공백입력불가
					const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g; //한글입력 불가
					let mail_auth = 0;
					let phone_auth = 0;

					//아이디 유효성 및 중복체크
					$("#addGeneralId").on("keyup", function () {
						// console.log("가나다");
						var email = $("#addGeneralId").val();
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
									if (space.exec(email) || regExp.exec(email)) {
										$("#check-email").html("공백과 한글은 입력 불가합니다");
										$("#addGeneralId").val("");
										$("#add_mailAuthNum").hide();
									} else if (email != "") {
										if (email.indexOf('@') < 1 || email.indexOf('.') == -1) {
											$("#check-email").html("Email형식이 아닙니다.");
											$("#add_mailAuthNum").hide();
										} else {
											$("#check-email").html('사용 가능한 아이디입니다.');
											$("#check-email").css('color', 'green');
											$("#add_mailAuthNum").show();
										}
									} else {
										$("#check-email").html("");
										$("#add_mailAuthNum").hide();
									}

								} else {
									$("#check-email").html('이미 사용중이거나 중복된 아이디 입니다.');
									$("#check-email").css('color', 'red');
									$("#add_mailAuthNum").hide();
								}

							} /* ,error :  function(request,status,error){// 에러발생시 실행할 함수
alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
}*/
						});
					});

					//이메일 인증번호 받기
					$("#mailAuthNum").on("click", function () {

						var add_id = $("#addGeneralId").val();

						if (add_id != (add_id.indexOf('@') < 1 || add_id.indexOf('.') == -1)) {

							//$("#mailAuthNum").hide();
							$("#mailAuthNum").text("인증번호 재발송");
							$("#check-email").html("");
							$("#checkMailAuth").show();
							//$("#reMailAuth").show();

							$.ajax({
								url: '/user/rest/sendEmailAuthNum/' + add_id,
								headers: {
									"Accept": "application/json",
									"Content-Type": "application/json"
								},
								method: 'GET',
								dataType: 'text',
								//data : JSON.stringify(data),	
								success: function (data) {
									//console.log(JSON.stringify(data));
									console.log('성공: ' + data);
									//console.log('성공: '+data.id);

									$("input[name='checkMailAuthNum']").on("keyup", function () {

										var aa = $("input[name='checkMailAuthNum']").val();
										if (space.exec(aa) || regExp.exec(aa)) {
											$("#check-email-auth").html("공백과 한글은 입력 불가합니다");
											$("input[name='checkMailAuthNum']").val("");
											mail_auth = 0;
										} else if (aa.length > 0) {
											if (data == aa) {
												$("#check-email-auth").html("인증번호가 일치합니다.");
												mail_auth = 1;
											} else {
												$("#check-email-auth").html('인증번호를 확인하세요.');
												mail_auth = 0;
											}
										} else {
											$("#check-email-auth").html("");
											mail_auth = 0;
										}
									});
								}
							});
						}
					});

					//비밀번호
					$('#addGeneralPassword').on("keyup", function () {

						var pwd = $('#addGeneralPassword').val();
						if (pwd.length > 0) {
							$(this).val($(this).val().replace(/ /g, ''));
							//	$("#check-pwd-exp").html("공백은 입력 불가합니다.");
						} else {
							$("#check-pwd-exp").html("");
						}

					});

					//비밀번호 확인
					$('#addConfirmPassword').on("keyup", function () {

						if ($('#addConfirmPassword').val().length < 1) {
							$("#check-pwd").html("");
						} else if ($('#addGeneralPassword').val() == $('#addConfirmPassword').val()) {
							$(this).val($(this).val().replace(/ /g, ''));
							$("#check-pwd").html('비밀번호가 일치합니다.');
							$("#check-pwd").css('color', 'green');
						} else if ($('#addGeneralPassword').val() != $('#addConfirmPassword').val() || $('#addConfirmPassword').val() != '') {
							$(this).val($(this).val().replace(/ /g, ''));
							$("#check-pwd").html('비밀번호가 일치하지 않습니다.');
							$("#check-pwd").css('color', 'red');
							$('#addConfirmPassword').focus();
						}

					});

					//닉네임 중복체크
					$("input[name='nickName']").on("keyup", function () {

						var nickName = $("input[name='nickName']").val();

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
									if (space.exec(nickName)) {
										//$("#check-nickName").html("공백은 입력 불가합니다");
										$("input[name='nickName']").val("");
									} else if (nickName.length > 1) {
										$("#check-nickName").html('사용 가능한 닉네임입니다.');
										$("#check-nickName").css('color', 'green');
									} else {
										$("#check-nickName").html("");
									}
								} else {
									$("#check-nickName").html('이미 사용중이거나 중복된 닉네임 입니다.');
									$("#check-nickName").css('color', 'red');
								}
							}
						});

					});

					//휴대폰번호 중복체크
					$("#addGeneralPhone").on("keyup", function () {

						var regExp = /^[0-9]*$/;
						var phone = $("#addGeneralPhone").val();

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
									if (phone != "") {
										if (!(regExp.test(phone))) {
											$("#addGeneralPhone").val("");
											$("#check-phone").html("휴대폰번호는 숫자로만 입력 가능합니다.");
											$("#phoneAuthNum_btn").hide();
										} else if (phone.length == 11) {
											$("#check-phone").html('사용 가능한 번호입니다.');
											$("#check-phone").css('color', 'green');
											$("#phoneAuthNum_btn").show();
										} else if (phone.length > 11) {
											$("#addGeneralPhone").val("");
											$("#check-phone").html("휴대폰번호는 11자리만 가능합니다.");
										} else {
											$("#check-phone").html("");
											$("#phoneAuthNum_btn").hide();
										}

									}
								} else {
									$("#check-phone").html('중복된 휴대폰번호 입니다.');
									$("#check-phone").css('color', 'red');
									$("#phoneAuthNum_btn").hide();
								}
							}
						});

					});

					//휴대폰 인증번호 받기
					$("#phoneAuthNum").on("click", function () {
						$("#phoneAuthNum").text("인증번호 재발송");
						$("#check-phone").hide();
						$("#checkPhoneAuth").show();

						const phone = $("#addGeneralPhone").val();
						console.log(phone);
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

								$("#add_g_checkPhoneAuthNum").on("keyup", function () {

									var ab = $("#add_g_checkPhoneAuthNum").val();

									if (ab.length > 0) {
										if (space.exec(ab)) {
											//	$("#check-phone-auth").html("공백은 입력 불가합니다");
											$("#add_g_checkPhoneAuthNum").val("");
											phone_auth = 0;
										} else if (dataa == ab) {
											$("#check-phone-auth").html("인증번호가 일치합니다.");
											phone_auth = 1;
										} else {
											$("#check-phone-auth").html('인증번호를 확인하세요.');
											phone_auth = 0;
										}
									} else {
										$("#check-phone-auth").html("");
										phone_auth = 0;
									}
								});
							}
						});

					});

					$("#cancel").on("click", function () {

						self.location = "/.jsp";
					});

					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#joinAddUser").on("click", function () {
						//console.log("뭐지");
						fncAddUser();
					});


					function fncAddUser() {

						var id = $("#addGeneralId").val();
						var pw = $("#addGeneralPassword").val();
						var pw_confirm = $("input[name='confirmPassword']").val();
						var name = $("#addGeneralname").val();
						var nickName = $("input[name='nickName']").val();
						var phone = $("#addGeneralPhone").val();
						//메일 인증번호랑 휴대폰 인증번호 일치여부


						if (id == null || id.length < 1) {
							alert("아이디는 반드시 입력하셔야 합니다.");
							return;
						}

						if (mail_auth != 1) {
							alert("이메일 인증번호를 확인해주세요.");
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

						if (pw_confirm == null || pw_confirm.length < 1) {
							alert("패스워드 확인은  반드시 입력하셔야 합니다.");
							return;
						}

						if (name == null || name.length < 1) {
							alert(name.length);
							alert("이름은  반드시 입력하셔야 합니다.");
							return;
						}

						if (pw != pw_confirm) {
							alert(pw);
							alert(pw_confirm);
							alert("비밀번호 확인이 일치하지 않습니다.");
							$("input:text[name='confirmPassword']").focus();
							return;
						}

						if (nickName == null || nickName.length < 1) {
							alert("닉네임은 반드시 입력하셔야 합니다.");
							return;
						}

						if (phone == null || phone.length < 1) {
							alert("휴대폰번호 길이" + phone.length);
							alert("휴대폰번호는 반드시 입력하셔야 합니다.");
							return;
						}

						if (phone_auth != 1) {
							alert("휴대폰번 인증번호를 확인해주세요.");
							return;
						}

						var addr = "";
						if ($("#add_g_addr").val() != "" && $("#add_g_userAddr").val() != "") {
							var value = $("#add_g_addr").val() + ""
								+ $("#add_g_userAddr").val();
						}

						$("input:hidden[name='allAddr']").val(value);


						Swal.fire({
							icon: 'success',
							title: '가입완료',
							html: '회원가입이 완료되었습니다.<br>로그인 후 이용 가능합니다:)'

						}).then(() => {
							$("#add_g_form").attr("method", "POST").attr("action", "/user/addUser").attr("enctype", "multipart/form-data").submit();
						});

					}


					//주소검색
					document.getElementById("add_g_addr").addEventListener("click", function () { //주소입력칸을 클릭하면
						new daum.Postcode({
							oncomplete: function (data) { //선택시 입력값 세팅
								document.getElementById("add_g_addr").value = data.address; // 주소 넣기
								document.querySelector("input[name=userAddr]").focus(); //상세입력 포커싱
							}
						}).open();
					});

					$("#get_g_cancel").on("click", function () {
						window.history.go(-1);
					})
				});

			</script>
		</body>

		</html>