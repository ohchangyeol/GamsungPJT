<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

		<main>
			<div class="main">
				<!-- <section class="module bg-dark-30 about-page-header" data-background="assets/images/about_bg.jpg">
					<div class="container">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<h1 class="module-title font-alt mb-0">Forms</h1>
							</div>
						</div>
					</div>
				</section> -->
				<div id="imgContainer" class="container">
					<!-- <section class="module bg-dark-30 about-page-header"
						style="background-image: url(../../resources/images/getGeneralUserUpdateImg.jpg)">

						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
							</div>
						</div>

					</section> -->
					<img src="../../resources/images/getGeneralUserUpdateImg.jpg" alt="">
				</div>

				<section class="module" style="padding-top: 30px;">
					<div class="container">
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2">
								<h4 class="font-alt mb-0">내정보 조회/수정</h4>
								<hr class="divider-w mt-10 mb-20">
								<form id="update_g_form" class="form" role="form">
									<div id="email" class="form-group">
										<div><input id="role" name="role" value="GENERAL" hidden="hidden"></div>
										<label for="get_g_id"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
										<div class="col-sm-6">
											<input id="get_g_id" name="id" class="form-control " value="${user.id}"
												readonly />
										</div>
										<div class='col-sm-offset-3 col-sm-6 checkFont' style="padding-left: 30px;"><span id="helpBlock"
												class="help-block" style="font-size: 12px;">
												<strong class="text-danger">아이디는 수정이 불가합니다.</strong>
											</span></div>
									</div>

									<div class="form-group">
										<label for="get_g_password"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
												변경</strong></label>
										<div class="col-sm-6">
											<input id="get_g_password" name="password" class="form-control "
												value="" type="password" placeholder="변경할 비밀번호를 입력해 주세요." />
										</div>
										<div id="check-pwd-exp" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div class="form-group">
										<label for="get_g_confirmPassword"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
												재확인</strong></label>
										<div class="col-sm-6">
											<input id="get_g_confirmPassword" name="confirmPassword"
												class="form-control" value="" type="password"
												placeholder="비밀번호를 입력해 주세요." />
										</div>
										<div id="get_g_check-pwd" class='col-sm-offset-3 col-sm-6 checkFont'></div>
									</div>

									<div id="get_g_nick-name" class="form-group">
										<label for="nickName"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>닉네임</strong></label>
										<div class="col-sm-6">
											<input id="get_g_nickName" name="nickName" class="form-control"
												type="text" value="${user.nickName}" placeholder="닉네임을 입력해 주세요." />
										</div>
										<div id="get_g_check-nickName" class='col-sm-offset-3 col-sm-6 checkFont'>
										</div>
									</div>


									<div class="form-group">
										<label for="get_g_name"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
										<div class="col-sm-6">
											<input id="get_g_name" name="name" class="form-control" type="text"
												value="${user.name}" placeholder="이름을 입력하세요" />
										</div>
									</div>

									<div class="form-group">
										<label for="get_g_phone"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
										<div class="col-sm-6">
											<input id="get_g_phone" name="phone" class="form-control " type="text"
												value="${user.phone}" placeholder="숫자만 입력해주세요" maxlength="11" />

										</div>

										<button id="get_g_phoneAuthNum" class="btn btn-circle btn-xs" type="button"
											style="display: none;">인증번호
											받기</button>
										<div id="get_g_checkPhoneAuth" class="col-sm-offset-3 col-sm-6"
											style="display:none; margin: 15px;">
											<input id="get_g_checkPhoneAuthNum" name="checkPhoneAuthNum"
												class="form-control " type="text" placeholder="인증번호를 입력하세요."
												maxlength="4" />
										</div>
										<div id="get_g_check-phone" class='col-sm-offset-3 col-sm-6 checkFont'>
										</div>
										<div id="get_g_check-phone-auth" class='col-sm-offset-3 col-sm-6 checkFont'>
										</div>
									</div>


									<div class="form-group">
										<label for="get_g_addr"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>주소</strong></label>
										<div class="col-sm-6">
											<input id="get_g_addr" name="addr" class="form-control" type="text"
												value="${user.addr}" placeholder="주소를 입력하세요." />
										</div>
									</div>

									<div class="form-group">
										<label for="get_g_userAddr"
											class="col-sm-offset-1 col-sm-3 control-label"></label>
										<div class="col-sm-6">
											<input id="get_g_userAddr" name="userAddr" class="form-control"
												type="text" placeholder="상세주소를 입력하세요." style="display: none;" />
											<input type="hidden" name="allAddr" />
										</div>
									</div>

									<div class="form-group">
										<label for="get_g_accountInfo"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>계좌정보</strong></label>
										<div class="col-sm-3">
											<select class="form-control" name="bank" id="bank">
												<option value="${user.bank}">은행</option>
												<option value="KB국민은행" <c:if test="${user.bank eq 'KB국민은행'}">
													selected="selected"</c:if>>KB국민은행</option>
												<option value="신한은행" <c:if test="${user.bank eq '신한은행'}">
													selected="selected"</c:if>>신한은행</option>
												<option value="우리은행" <c:if test="${user.bank eq '우리은행'}">
													selected="selected"</c:if>>우리은행</option>
												<option value="하나은행" <c:if test="${user.bank eq '하나은행'}">
													selected="selected"</c:if>>하나은행</option>
												<option value="NH농협은행" <c:if test="${user.bank eq 'NH농협은행'}">
													selected="selected"</c:if>>NH농협은행</option>
												<option value="카카오뱅크" <c:if test="${user.bank eq '카카오뱅크'}">
													selected="selected"</c:if>>카카오뱅크</option>
											</select>
										</div>
										<div class="col-sm-3">
											<input id="get_g_accountHolder" name="accountHolder"
												class="form-control" type="text" value="${user.accountHolder}"
												placeholder="예금주" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-offset-1 col-sm-3 control-label"></label>
										<div class="col-sm-6">
											<input id="get_g_accountNum" name="accountNum" class="form-control"
												type="text" placeholder="계좌번호를 숫자만 입력하세요" maxlength="14" />
										</div>
									</div>
									<div id="get_g_entryDate_form" class="form-group">
										<label for="get_g_entryDate"
											class="col-sm-offset-1 col-sm-3 control-label"><strong>회원가입
												일자</strong></label>
										<div class="col-sm-6">
											<input id="get_g_entryDate" name="addUserRegDate" class="form-control"
												type="text" value="${user.addUserRegDate}" readonly />
										</div>
									</div>

									<c:if
										test="${sessionScope.user.role=='ADMIN'} && ${user.secessionRegDate != null} || ${user.suspensionDate !=null}">
										<div id="" class="form-group">
											<label for="get_g_secession-date"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>탈퇴
													일자</strong></label>
											<div class="col-sm-6">
												<input id="get_g_secession-date" name="secessionRegDate"
													class="form-control" type="text"
													value="${user.secessionRegDate}" readonly />
											</div>
										</div>


										<div id="get_g_suspensionDate_form" class="form-group">
											<label for="get_g_suspensionDate"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>이용정지
													일자</strong></label>
											<div class="col-sm-6">
												<input id="get_g_suspensionDate" name="suspensionDate"
													class="form-control" type="text" value="${user.suspensionDate}"
													readonly />
											</div>
										</div>
									</c:if>
								</form>

							</div>
						</div>

						<br />
						<div class="col-sm-3 col-sm-offset-2"></div>
						<div class="col-sm-3 col-sm-offset-2">
							<div class="row">
								<button id="get_g_cancel" class="btn btn-border-d btn-circle" style="border: 1px #ddd solid;"
									type="button">취소</button>
								<button id="get_g_updateUser" class="btn btn-border-d btn-circle" style="border: 1px #ddd solid;"
									type="submit">수정하기</button>

							</div>
						</div>
					</div>
				</section>
			</div>
		</main>

		<script type="text/javascript">

			$(function () {

				let get_g_phone_auth = 0;

				//비밀번호
				$('#get_g_password').on("keyup", function () {
					var pwd = $('#get_g_password').val();

					if (pwd.length > 0) {
						$(this).val($(this).val().replace(/ /g, ''));
						//$("#check-pwd-exp").html("공백은 입력 불가합니다.");
					} else {
						$("#check-pwd-exp").html("");
					}

				});

				//비밀번호 확인
				$('#get_g_confirmPassword').on("keyup", function () {


					if ($('#get_g_confirmPassword').val().length < 0) {
						$("#get_g_check-pwd").html("");
					} else if ($('#get_g_password').val() != $('#get_g_confirmPassword').val() || $('#get_g_confirmPassword').val() != '') {
						$("#get_g_check-pwd").html('비밀번호가 일치하지 않습니다.');
						$("#get_g_check-pwd").css('color', 'red');
						$('#get_g_confirmPassword').focus();
					}
					if ($('#get_g_password').val() == $('#get_g_confirmPassword').val()) {
						$("#get_g_check-pwd").html('비밀번호가 일치합니다.');
						$("#get_g_check-pwd").css('color', 'green');
					}
				});

				//닉네임 중복체크
				$("#get_g_nickName").on("keyup", function () {

					var nickName = $("#get_g_nickName").val();

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
								if (nickName.length > 2) {
									$("#get_g_check-nickName").html('사용 가능한 닉네임입니다.');
									$("#get_g_check-nickName").css('color', 'green');
								} else {
									$("#get_g_check-nickName").html("");
								}
							} else {
								$("#get_g_check-nickName").html('이미 사용중이거나 중복된 닉네임 입니다.');
								$("#get_g_check-nickName").css('color', 'red');
							}
						}
					});

				});

				//휴대폰번호 중복체크
				$("#get_g_phone").on("keyup", function () {

					var regExp = /^[0-9]*$/;
					var dp_phone = $("#get_g_phone").val();

					$.ajax({
						url: '/user/rest/checkDuplication',
						headers: {
							"Accept": "application/json",
							"Content-Type": "application/json"
						},
						method: 'POST',
						dataType: 'json',
						data: JSON.stringify({ "phone": dp_phone }),
						success: function (result) {
							console.log('성공: ' + result);

							if (result == 0) {
								if (dp_phone != "") {
									if (!(regExp.test(dp_phone))) {
										$("#get_g_phone").val("");
										$("#get_g_check-phone").html("휴대폰번호는 숫자로만 입력 가능합니다.");
										$("#get_g_phoneAuthNum").hide();
										get_g_phone_auth = 0;
									} else if (dp_phone.length == 11) {
										$("#get_g_check-phone").html('사용 가능한 번호입니다.');
										$("#get_g_check-phone").css('color', 'green');
										$("#get_g_phoneAuthNum").show();
										get_g_phone_auth = 1;
									} else if (dp_phone.length > 11) {
										$("#get_g_phone").val("");
										$("#get_g_check-phone").html("휴대폰번호는 11자리만 가능합니다.");
										get_g_phone_auth = 0;
										$("#get_g_phoneAuthNum").hide();
									} else {
										$("#get_g_check-phone").html("");
										get_g_phone_auth = 0;
										$("#get_g_phoneAuthNum").hide();
									}

								} else {
									$("#get_g_check-phone").html('이미 사용중이거나 중복된 휴대폰번호 입니다.');
									$("#get_g_check-phone").css('color', 'red');
									get_g_phone_auth = 0;
									$("#get_g_phoneAuthNum").hide();
								}
							}
						}
					});

				});

				//휴대폰 인증번호 받기
				$("#get_g_phoneAuthNum").on("click", function () {

					$("#get_g_phoneAuthNum").text("인증번호 재발송");
					$("#get_g_check-phone").hide();
					$("#get_g_checkPhoneAuth").show();
					console.log("핸드폰번호" + $("#get_g_phone").val());
					var phone = $("#get_g_phone").val();

					$.ajax({
						url: '/user/rest/sendPhoneAuthNum/' + phone,
						headers: {
							"Accept": "application/json",
							"Content-Type": "application/json"
						},
						method: 'GET',
						dataType: 'json',
						data: JSON.stringify({ "phone": phone }),
						success: function (dataa) {
							console.log('성공: ' + dataa);

							$("#get_g_checkPhoneAuthNum").on("keyup", function () {

								var ab = $("#get_g_checkPhoneAuthNum").val();

								if (ab.length > 0) {
									if (dataa == ab) {
										$("#get_g_check-phone-auth").html("인증번호가 일치합니다.");
									} else {
										$("#get_g_check-phone-auth").html('인증번호를 확인하세요.');
									}
								}
							});
						}
					});
				});


				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#get_g_updateUser").on("click", function () {
					console.log("일반회원 내정보수정");
					fncupdateUser();
				});

				function fncupdateUser() {

					var pw = $("#get_g_password").val();
					var pw_confirm = $("#get_g_confirmPassword").val();
					var name = $("#get_g_name").val();
					var nickName = $("#get_g_nickName").val();
					var phone = $("#get_g_phone").val();

					if (pw.length > 1 || pw != null && pw != "") {

						if (pw.length < 8) {
							alert("패스워드는 8자 이상이어야 합니다.");
							return;
						} else if (pw_confirm == null || pw_confirm < 1) {
							alert("패스워드 확인은  반드시 입력하셔야 합니다.");
							return;
						} else if (pw != pw_confirm) {
							alert("비밀번호 확인이 일치하지 않습니다.");
							$("input:text[name='confirmPassword']").focus();
							return;
						}
					}

					if (name == null || name.length < 1) {
						console.log("이름" + name);
						console.log("이름길이" + name.length);
						alert("이름은  반드시 입력하셔야 합니다.");
						return;
					}

					if (nickName == null || nickName.length < 1) {
						console.log("닉네임" + nickName);
						console.log("닉네임 길이" + nickName.length);
						alert("닉네임은 반드시 입력하셔야 합니다.");
						return;
					}

					if (phone == null || phone.length < 1) {
						alert("휴대폰번호는 반드시 입력하셔야 합니다.");
						return;
					}


					var addr = "";
					if ($("#get_g_addr").val() != "" && $("#get_g_userAddr").val() != "") {
						var value = $("#get_g_addr").val() + ""
							+ $("#get_g_userAddr").val();
					}

					$("#get_g_allAddr").val(value);

					Swal.fire({
						icon: 'success',
						title: '수정완료',
						html: '정보수정이 완료되었습니다:)'

					}).then(() => {
						$("#update_g_form").attr("method", "POST").attr("action", "/user/updateUser").submit();
					});

				}


				//주소검색
				document.getElementById("get_g_addr").addEventListener("click", function () { //주소입력칸을 클릭하면
					$("#get_g_userAddr").show();
					new daum.Postcode({
						oncomplete: function (data) { //선택시 입력값 세팅
							document.getElementById("get_g_addr").value = data.address; // 주소 넣기
							document.querySelector("#get_g_userAddr").focus(); //상세입력 포커싱
						}
					}).open();
				});
			});

		</script>
