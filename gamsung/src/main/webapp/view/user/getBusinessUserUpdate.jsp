<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">

			<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

			<title>사업자회원정보 조회/수정</title>

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

			<!-- 메모장 이동 -->


		</head>

		<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
			<main>
				

				<jsp:include page="../common/headerCampBusiness.jsp"></jsp:include>

				<div class="main">
					<!-- <section class="module bg-dark-30 about-page-header" data-background="assets/images/about_bg.jpg"> -->
					<div class="container">
						<img src="../../resources/images/getBusinessUserUpdateImg.jpg" alt="">
					</div>
					<!-- </section> -->
					<section class="module" style="padding-top: 0;">
						<div class="container">
							<div class="row">
								<div class="col-sm-8 col-sm-offset-2">
									<h4 class="font-alt mb-0">내정보 조회/수정</h4>
									<hr class="divider-w mt-10 mb-20">
									<form class="form" role="form" id="update_b_form">
										<div id="email" class="form-group row">
											<div><input id="role" name="role" value="GENERAL" hidden="hidden"></div>
											<label for="get_b_id"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
											<div class="col-sm-6">
												<input id="get_b_id" name="id" class="form-control " value="${user.id}"
													readonly />
											</div>
											<div class='col-sm-offset-3 col-sm-6 checkFont'><span id="helpBlock"
													class="help-block">
													<strong class="text-danger">아이디는 수정이 불가합니다.</strong>
												</span></div>
										</div>

										<div class="form-group row">
											<label for="get_b_password"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
													변경</strong></label>
											<div class="col-sm-6">
												<input id="get_b_password" name="password" class="form-control "
													type="password" placeholder="변경할 비밀번호를 입력해 주세요." />
											</div>
											<div id="get_b_check-pwd-exp" class='col-sm-offset-3 col-sm-6 checkFont'>
											</div>
										</div>

										<div class="form-group row">
											<label for="get_b_confirmPassword"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
													재확인</strong></label>
											<div class="col-sm-6">
												<input id="get_b_confirmPassword" name="confirmPassword"
													class="form-control" type="password" placeholder="비밀번호를 입력해 주세요." />
											</div>
											<div id="get_b_check-pwd" class='col-sm-offset-3 col-sm-6 checkFont'></div>
										</div>

										<div id="campName" class="form-group row">
											<label for="get_b_campName"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>캠핑장명</strong></label>
											<div class="col-sm-6">
												<input id="get_b_campName" name="campName" class="form-control"
													type="text" value="${user.campName}" placeholder="캠핑장명을 입력해 주세요." />
											</div>
										</div>

										<div class="form-group row">
											<label for="get_b_campBusinessNum"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자
													등록번호</strong></label>
											<div class="col-sm-6">
												<input id="get_b_campBusinessNum" name="campBusinessNum"
													class="form-control" type="text" value="${user.campBusinessNum}"
													maxlength="10" readonly />
											</div>
											<div id="get_b_check-business" class='col-sm-offset-3 col-sm-6 checkFont'>
											</div>
										</div>

										<div class="form-group row">
											<div class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자
													등록증 사진</strong></div>
											<div>
												<img id="input_businessImg_file" style="width:20%; margin-top:10px;"
													src="/uploadfiles/userBusinessImg/${user.campBusinessImg}">
											</div>
										</div>


										<div class="form-group row">
											<label for="get_b_name"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자대표
													이름</strong></label>
											<div class="col-sm-6">
												<input id="get_b_name" name="name" class="form-control" type="text"
													value="${user.name}" placeholder="이름을 입력하세요" />
											</div>
										</div>

										<div class="form-group row">
											<label for="get_b_phone"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
											<div class="col-sm-6">
												<input id="get_b_phone" name="phone" class="form-control " type="text"
													value="${user.phone}" placeholder="숫자만 입력해주세요" maxlength="11" />

											</div>
											<button id="get_b_phoneAuthNum" class="btn btn-circle btn-xs" type="button"
												style="display: none;">인증번호
												받기</button>
											<div id="get_b_checkPhoneAuth" class="col-sm-offset-3 col-sm-6"
												style="display:none; margin: 15px;">
												<input id="get_b_checkPhoneAuthNum" name="checkPhoneAuthNum"
													class="form-control " type="text" placeholder="인증번호를 입력하세요."
													maxlength="4" />
											</div>
											<div id="get_b_check-phone" class='col-sm-offset-3 col-sm-6 checkFont'>
											</div>
											<div id="get_b_check-phone-auth" class='col-sm-offset-3 col-sm-6 checkFont'>
											</div>
										</div>

										<div class="form-group row">
											<label for="get_b_addr"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>주소</strong></label>
											<div class="col-sm-6">
												<input id="get_b_addr" name="addr" class="form-control" type="text"
													value="${user.addr}" placeholder="주소를 입력하세요." />
											</div>
										</div>

										<div class="form-group row">
											<label for="get_b_userAddr"
												class="col-sm-offset-1 col-sm-3 control-label"></label>
											<div class="col-sm-6">
												<input id="get_b_userAddr" name="userAddr" class="form-control"
													type="text" placeholder="상세주소를 입력하세요." style="display: none;" />
												<input type="hidden" name="allAddr" />
											</div>
										</div>

										<div class="form-group row">
											<label for="get_b_campCall"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>캠핑장
													전화번호</strong></label>
											<div class="col-sm-6">
												<input id="get_b_campCall" name="campCall" class="form-control"
													type="text" value="${user.campCall}" placeholder="숫자만 입력해주세요." />
											</div>
										</div>

										<div class="form-group row">
											<label for="get_b_accountInfo"
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
												<input id="get_b_accountHolder" name="accountHolder"
													class="form-control" type="text" value="${user.accountHolder}"
													placeholder="예금주" />
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-offset-1 col-sm-3 control-label"></label>
											<div class="col-sm-6">
												<input id="get_b_accountNum" name="accountNum" class="form-control"
													type="text" value="${user.accountNum}" placeholder="계좌번호를 숫자만 입력하세요"
													maxlength="14" />
											</div>
										</div>

										<div id="entryDate" class="form-group row">
											<label for="get_b_entryDate"
												class="col-sm-offset-1 col-sm-3 control-label"><strong>회원가입
													일자</strong></label>
											<div class="col-sm-6">
												<input id="get_b_entryDate" name="addUserRegDate" class="form-control"
													type="text" value="${user.addUserRegDate}" readonly />
											</div>
										</div>
									</form>
								</div>
							</div>

							<br />
							<div class="col-sm-3 col-sm-offset-2"></div>
							<div class="col-sm-3 col-sm-offset-2">
								<div class="row">
									<button id="get_b_cancel" class="btn btn-border-d btn-circle"
										type="button">취소</button>
									<button id="get_b_updateUser" class="btn btn-border-d btn-circle"
										type="submit">수정하기</button>

								</div>
							</div>
						</div>
					</section>
				</div>
			</main>

			<script type="text/javascript">

				$(function () {


					//비밀번호
					$('#get_b_password').on("keyup", function () {
						var regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g; //한글입력 불가
						var pwd = $('#get_b_password').val();

						if (pwd.length < 1) {
							$("#get_b_check-pwd-exp").html("");

						} else if (regExp.test(pwd)) {
							$("#get_b_check-pwd-exp").html("한글은 입력 불가합니다.");
							$("#get_b_check-pwd-exp").css('color', 'red');
						}

					});

					//비밀번호 확인
					$('#get_b_confirmPassword').on("keyup", function () {


						if ($('#get_b_confirmPassword').val().length < 0) {
							$("get_b_#check-pwd").html("");
						} else if ($('#get_b_password').val() != $('#get_b_confirmPassword').val() || $('#get_b_confirmPassword').val() != '') {
							$("#get_b_check-pwd").html('비밀번호가 일치하지 않습니다.');
							$("#get_b_check-pwd").css('color', 'red');
							$('#get_b_confirmPassword').focus();
						}
						if ($('#get_b_password').val() == $('#get_b_confirmPassword').val()) {
							$("#get_b_check-pwd").html('비밀번호가 일치합니다.');
							$("#get_b_check-pwd").css('color', 'green');
						}
					});



					//휴대폰번호 중복체크
					$("#get_b_phone").on("keyup", function () {

						var regExp = /^[0-9]*$/;
						var phone = $("#get_b_phone").val();
						$("#get_b_phoneAuthNum").show();

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
											$("#get_b_phone").val("");
											$("#get_b_check-phone").html("휴대폰번호는 숫자로만 입력 가능합니다.");
										} else if (phone.length == 11) {
											$("#get_b_check-phone").html('사용 가능한 번호입니다.');
											$("#get_b_check-phone").css('color', 'green');
										} else if (phone.length > 11) {
											$("#get_b_phone").val("");
											$("#get_b_check-phone").html("휴대폰번호는 11자리만 가능합니다.");
										} else {
											$("#get_b_check-phone").html("");
										}

									} else {
										$("#get_b_check-phone").html('이미 사용중이거나 중복된 휴대폰번호 입니다.');
										$("#get_b_check-phone").css('color', 'red');
									}
								}
							}
						});

					});

					//휴대폰 인증번호 받기
					$("#get_b_phoneAuthNum").on("click", function () {

						$("#get_b_phoneAuthNum").text("인증번호 재발송");
						$("#get_b_check-phone").hide();
						$("#get_b_checkPhoneAuth").show();
						//세션에 담긴 값이랑 입력된 값이 맞는지 비교하기 #check-phone-auth
						var phone = $("#get_b_phone").val();

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

								$("#get_b_checkPhoneAuthNum").on("keyup", function () {
									console.log('되는가');
									var ab = $("#get_b_checkPhoneAuthNum").val();

									if (ab.length > 0) {
										if (dataa == ab) {
											$("#get_b_check-phone-auth").html("인증번호가 일치합니다.");
										} else {
											$("#get_b_check-phone-auth").html('인증번호를 확인하세요.');
										}
									}
								});
							}
						});
					});


					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#get_b_updateUser").on("click", function () {
						console.log("사업자회원 내정보 조회수정");
						fncupdateUser();
					});

					function fncupdateUser() {

						//var id=$("input[name='userId']").val();
						var pw = $("#get_b_password").val();
						var pw_confirm = $("#get_b_confirmPassword").val();
						var name = $("#get_b_name").val();
						var campName = $("#get_b_campName").val();
						var phone = $("#get_b_phone").val();


						if (pw != null) {
							if (password.length < 8) {
								alert("패스워드는 8자 이상이어야 합니다.");
								return;
							}

							if (pw_confirm == null || pw_confirm.length < 1) {
								alert("패스워드 확인은  반드시 입력하셔야 합니다.");
								return;
							}

							if (pw != pw_confirm) {
								alert("비밀번호 확인이 일치하지 않습니다.");
								$("#get_b_confirmPassword").focus();
								return;
							}

						}

						var addr = "";
						if ($("#get_b_addr").val() != "" && $("#get_b_userAddr").val() != "") {
							var value = $("#get_b_addr").val() + ""
								+ $("#get_b_userAddr").val();
						}

						$("#get_b_allAddr").val(value);

						Swal.fire({
							icon: 'success',
							title: '수정완료',
							html: '정보수정이 완료되었습니다:)'

						}).then(() => {
							$("#update_b_form").attr("method", "POST").attr("action", "/user/updateUser").submit();
						});
					}


					//주소검색
					document.getElementById("get_b_addr").addEventListener("click", function () { //주소입력칸을 클릭하면
						$("get_b_userAddr").show();
						new daum.Postcode({
							oncomplete: function (data) { //선택시 입력값 세팅
								document.getElementById("get_b_addr").value = data.address; // 주소 넣기
								document.querySelector("#get_b_userAddr").focus(); //상세입력 포커싱
							}
						}).open();
					});

					$("#get_b_cancel").on("click", function () {
						window.location = "/campBusiness/goSubMainCampBusiness";
					})
				});

			</script>
		</body>

		</html>