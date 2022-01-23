<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">

				<meta name="viewport"
					content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
				<jsp:include page="/resources/commonLib.jsp"></jsp:include>

				<title>사업자 회원가입</title>

				<style>
					.form-group .btn {
						height: 26px;
						padding-top: 0;
						padding-bottom: 0;
						margin: auto 10px;
						color: blue;
					}

					.form-group label {
						width: 170px;
					}

					#checkMailAuth {
						margin-left: 232px;
						margin-top: 10px;

					}

					.img_business {
						border: 2px solid #A8A8A8;
						margin-top: 30px;
						margin-bottom: 30px;
						padding-top: 10px;
						padding-bottom: 10px;
					}

					.checkFont {
						font-size: 12px;
						padding-left: 57px;
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
							<img src="../../resources/images/addBusinessUserImg.png" alt="">
						</div>
						<!-- </section> -->
						<section class="module" style="padding-top:0;">
							<div class="container">
								<div class="row">
									<div class="col-sm-8 col-sm-offset-2">
										<hr class="divider-w mt-10 mb-20">
										<form class="form" role="form" id="add_b_form">
											<div id="add_b_email" class="form-group row">
												<div><input id="role" name="role" value="BUSINESS" hidden="hidden">
												</div>
												<label for="add_b_id"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
												<div class="col-sm-6">
													<input id="add_b_id" name="id" class="form-control " type="text"
														placeholder="아이디는 이메일 형식만 가능합니다." />
												</div>
												<div id="add_b_mailAuthNum" style="display:none;">
													<button id="add_b_mailAuthNum_btn" class="btn btn-circle btn-xs"
														type="button">인증번호 받기</button>
												</div>
												<div id="add_b_checkMailAuth" class="col-sm-offset-3 col-sm-6"
													style="display:none;  position: relative;  margin: 15px; margin-left: 30%;">
													<input id="add_b_checkMailAuthNum" name="checkMailAuthNum"
														class="form-control " type="text" placeholder="인증번호를 입력하세요."
														maxlength="6" />
												</div>
												<div id="add_b_check-email" class='col-sm-offset-3 col-sm-6 checkFont'>
												</div>
												<div id="add_b_check-email-auth"
													class='col-sm-offset-3 col-sm-6 checkFont'></div>
											</div>

											<div class="form-group row">
												<label for="add_b_password"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호</strong></label>
												<div class="col-sm-6">
													<input id="add_b_password" name="password" class="form-control "
														type="password" placeholder="비밀번호는 8~15자까지 입력 가능합니다."
														maxlength="15" />
												</div>
												<div id="add_b_check-pwd-exp"
													class='col-sm-offset-3 col-sm-6 checkFont'></div>
											</div>

											<div class="form-group row">
												<label for="add_b_confirmPassword"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호
														재확인</strong></label>
												<div class="col-sm-6">
													<input id="add_b_confirmPassword" name="confirmPassword"
														class="form-control" type="password"
														placeholder="비밀번호를 입력해 주세요." />
												</div>
												<div id="add_b_check-pwd" class='col-sm-offset-3 col-sm-6 checkFont'>
												</div>
											</div>

											<div id="add_b_campName" class="form-group row">
												<label for="add_b_campName"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>캠핑장명</strong></label>
												<div class="col-sm-6">
													<input id="add_b_campName" name="campName" class="form-control"
														type="text" placeholder="캠핑장명을 입력해 주세요." />
												</div>
											</div>

											<div class="form-group row">
												<label for="add_b_campBusinessNum"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자
														등록번호</strong></label>
												<div class="col-sm-6">
													<input id="add_b_campBusinessNum" name="campBusinessNum"
														class="form-control" type="text" placeholder="숫자만 입력해주세요"
														maxlength="10" />
												</div>
												<div id="add_b_check-business"
													class='col-sm-offset-3 col-sm-6 checkFont'></div>
											</div>

											<div class="form-group row">
												<div class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자
														등록증 사진</strong></div>
												<div class="col-sm-6">
													<button type="button" id="businessImgFileUpload"
														class="btn btn-border-d btn-circle">이미지 등록</button>
													<input type="file" id="inputBusinessImg" name="businessImg"
														style="display: none;" />
												</div>
												<div>
													<img id="input_businessImg_file"
														style="width:20%; margin-top:10px; margin-left: 35%;" src="">
												</div>
											</div>

											<div class="form-group row">
												<label for="add_b_name"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자대표
														이름</strong></label>
												<div class="col-sm-6">
													<input id="add_b_name" name="name" class="form-control" type="text"
														placeholder="이름을 입력하세요" />
												</div>
											</div>

											<div class="form-group row">
												<label for="add_b_phone"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
												<div class="col-sm-6">
													<input id="add_b_phone" name="phone" class="form-control"
														type="text" placeholder="숫자만 입력해주세요" maxlength="11" />

												</div>
												<div id="add_b_check-phone" class='col-sm-offset-3 col-sm-6 checkFont'>
												</div>
											</div>

											<div class="form-group row">
												<label for="add_b_addr"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>캠핑장
														주소</strong></label>
												<div class="col-sm-6">
													<input id="add_b_addr" name="addr" class="form-control" type="text"
														placeholder="주소를 입력하세요." />
												</div>
											</div>

											<div class="form-group row">
												<label for="add_b_userAddr"
													class="col-sm-offset-1 col-sm-3 control-label"></label>
												<div class="col-sm-6">
													<input id="add_b_userAddr" name="userAddr" class="form-control"
														type="text" placeholder="상세주소를 입력하세요." /> <input type="hidden"
														name="allAddr" />
												</div>
											</div>

											<div class="form-group row">
												<label for="add_b_campCall"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>캠핑장
														전화번호</strong></label>
												<div class="col-sm-6">
													<input id="add_b_campCall" name="campCall" class="form-control"
														type="text" placeholder="숫자만 입력해주세요." maxlength="11" />
												</div>
												<div id="add_b_check-campCall"
													class='col-sm-offset-3 col-sm-6 checkFont'></div>
											</div>

											<div class="form-group row">
												<label for="add_b_accountInfo"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>계좌정보</strong></label>
												<div class="col-sm-3">
													<select class="form-control" name="bank">
														<option value="">은행</option>
														<option>KB국민은행</option>
														<option>신한은행</option>
														<option>우리은행</option>
														<option>하나은행</option>
														<option>NH농협은행</option>
														<option>카카오뱅크</option>
													</select>
												</div>
												<div class="col-sm-3">
													<input id="add_b_accountHolder" name="accountHolder"
														class="form-control" type="text" placeholder="예금주" />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-offset-1 col-sm-3 control-label"></label>
												<div class="col-sm-6">
													<input id="add_b_accountNum" name="accountNum" class="form-control"
														type="text" placeholder="계좌번호를 숫자만 입력하세요" maxlength="14" />
												</div>
												<div id="add_b_check-accountNum"
													class='col-sm-offset-3 col-sm-6 checkFont'></div>
											</div>
										</form>
									</div>
								</div>
								<br>
								<div class="col-sm-3 col-sm-offset-2"></div>
								<div class="col-sm-3 col-sm-offset-2">
									<div class="row">
										<button id="add_b_cancel" class="btn btn-border-d btn-circle"
											type="button">취소</button>
										<button id="add_b_joinAddUser" class="btn btn-border-d btn-circle"
											type="submit">가입
											요청하기</button>

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
						let auth_check = 0;

						//아이디 유효성 및 중복체크
						$("#add_b_id").on("keyup", function () {
							// console.log("가나다");
							var email = $("#add_b_id").val();
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
											$("#add_b_check-email").html("공백과 한글은 입력 불가합니다");
											$("#add_b_id").val("");
											$("#add_b_mailAuthNum").hide();
										} else if (email != "") {
											if (email.indexOf('@') < 1 || email.indexOf('.') == -1) {
												$("#add_b_check-email").html("Email형식이 아닙니다.");
											} else {
												$("#add_b_check-email").html('사용 가능한 아이디입니다.');
												$("#add_b_check-email").css('color', 'green');
												$("#add_b_mailAuthNum").show();
											}
										} else {
											$("#add_b_check-email").html("");
										}

									} else {
										$("#add_b_check-email").html('이미 사용중이거나 중복된 아이디 입니다.');
										$("#add_b_check-email").css('color', 'red');
									}

								} /* ,error :  function(request,status,error){// 에러발생시 실행할 함수
alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
}*/
							});
						});

						//이메일 인증번호 받기
						$("#add_b_mailAuthNum_btn").on("click", function () {

							var id = $("#add_b_id").val();

							if (id != (id.indexOf('@') < 1 || id.indexOf('.') == -1)) {

								$("#add_b_mailAuthNum_btn").text("인증번호 재발송");
								$("#add_b_check-email").html("");
								$("#add_b_checkMailAuth").show();

								$.ajax({
									url: '/user/rest/sendEmailAuthNum/' + id,
									headers: {
										"Accept": "application/json",
										"Content-Type": "application/json"
									},
									method: 'GET',
									//dataType:'json',
									//data : JSON.stringify(data),	
									success: function (data) {
										//console.log(JSON.stringify(data));
										console.log('성공: ' + data);
										//console.log('성공: '+data.id);

										$("#add_b_checkMailAuthNum").on("keyup", function () {

											var aa = $("#add_b_checkMailAuthNum").val();
											if ((aa.length > 0)) {
												if (space.exec(aa) || regExp.exec(aa)) {
													$("#add_b_check-email-auth").html("공백과 한글은 입력 불가합니다");
													$("#add_b_checkMailAuthNum").val("");
													auth_check = 0;
												} else if (data === aa) {
													$("#add_b_check-email-auth").html("인증번호가 일치합니다.");
													auth_check = 1;
												} else {
													$("#add_b_check-email-auth").html('인증번호를 확인하세요.');
													auth_check = 0;
												}
											} else {
												$("#add_b_check-email-auth").html("");
												auth_check = 0;
											}
										});
									}
								});
							}
						});

						//비밀번호
						$('#add_b_password').on("keyup", function () {
							var pwd = $('#add_b_password').val();

							if (pwd.length > 0) {
								$(this).val($(this).val().replace(/ /g, ''));
								// $("#add_b_check-pwd-exp").html("공백은 입력 불가합니다.");
							} else {
								$("#add_b_check-pwd-exp").html("");
							}

						});


						//비밀번호 확인
						$('#add_b_confirmPassword').on("keyup", function () {

							console.log($("#add_b_password").val());
							console.log($("#add_b_confirmPassword").val());

							if ($('#add_b_confirmPassword').val().length < 1) {
								$("#add_b_check-pwd").html("");
							} else if ($('#add_b_password').val() == $('#add_b_confirmPassword').val()) {
								$(this).val($(this).val().replace(/ /g, ''));
								$("#add_b_check-pwd").html('비밀번호가 일치합니다.');
								$("#add_b_check-pwd").css('color', 'green');
							} else if ($('#add_b_password').val() != $('#add_b_confirmPassword').val() || $('#add_b_confirmPassword').val() != '') {
								$("#add_b_check-pwd").html('비밀번호가 일치하지 않습니다.');
								$("#add_b_check-pwd").css('color', 'red');
								$('#add_b_confirmPassword').focus();
							}
						});

						//사업자 번호 중복체크
						$("#add_b_campBusinessNum").on("keyup", function () {

							var b_regExp = /^[0-9]*$/;
							var campBusinessNum = $("#add_b_campBusinessNum").val();

							$.ajax({
								url: '/user/rest/checkDuplication',
								headers: {
									"Accept": "application/json",
									"Content-Type": "application/json"
								},
								method: 'POST',
								dataType: 'json',
								data: JSON.stringify({ "campBusinessNum": campBusinessNum }),
								success: function (result) {
									console.log('성공: ' + result);

									if (result == 0) {
										if (campBusinessNum > 0) {
											if (!(b_regExp.test(campBusinessNum))) {
												$("#add_b_campBusinessNum").val("");
												$("#add_b_check-business").html("사업자 등록번호는 숫자로만 입력 가능합니다.");
											} else if (campBusinessNum.length == 10) {
												$("#add_b_check-business").html('사용 가능한 번호입니다.');
												$("#add_b_check-business").css('color', 'green');
											} else {
												$("#add_b_check-business").html("");
											}

										}
									} else {
										$("#add_b_check-business").html('이미 사용중이거나 중복된 사업자 등록번호 입니다.');
										$("#add_b_check-business").css('color', 'red');
									}
								}
							});

						});

						$("#businessImgFileUpload").on("click", function () {
							$("#inputBusinessImg").trigger('click');
						})

						/*단일파일 업로드*/
						function readImage(input) {
							if (input.files && input.files[0]) {
								const reader = new FileReader();

								reader.onload = (e) => {
									const previewImage = document.getElementById('input_businessImg_file');
									previewImage.src = e.target.result;
								}
								reader.readAsDataURL(input.files[0]);
							}
						}
						// 이벤트 리스너
						document.getElementById('inputBusinessImg').addEventListener('change', (e) => {
							readImage(e.target);
						})

						//휴대폰번호 중복체크
						$("#add_b_phone").on("keyup", function () {

							var regExp = /^[0-9]*$/;
							var phone = $("#add_b_phone").val();

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
												$("#add_b_phone").val("");
												$("#add_b_check-phone").html("휴대폰번호는 숫자로만 입력 가능합니다.");
											} else if (phone.length == 11) {
												$("#add_b_check-phone").html('사용 가능한 번호입니다.');
												$("#add_b_check-phone").css('color', 'green');
											} else if (phone.length > 11) {
												$("#add_b_phone").val("");
												$("#add_b_check-phone").html("휴대폰번호는 11자리만 가능합니다.");
											} else {
												$("#add_b_check-phone").html("");
											}

										}
									} else {
										$("#add_b_check-phone").html('이미 사용중이거나 중복된 휴대폰번호 입니다.');
										$("#add_b_check-phone").css('color', 'red');
									}
								}
							});

						});

						//캠핑장 전화번호 숫자만
						$("#add_b_campCall").on("keyup", function () {

							var regExp = /^[0-9]*$/;
							var campCall = $("#add_b_campCall").val();

							if (campCall != "") {
								if (!(regExp.test(campCall))) {
									$("#add_b_campCall").val("");
									$("#add_b_check-campCall").html("캠핑장 전화번호는 숫자로만 입력 가능합니다.");
								} else {
									$("#add_b_check-campCall").html("");
								}

							}

						});

						//계좌번호 중복체크
						$("#add_b_accountNum").on("keyup", function () {

							var regExp = /^[0-9]*$/;
							var accountNum = $("#add_b_accountNum").val();

							if (!(regExp.test(accountNum))) {
								$("#add_b_phone").val("");
								$("#add_b_check-accountNum").html("계좌번호는 숫자로만 입력 가능합니다.");
							} else {
								$("#add_b_check-accountNum").html("");
							}
						});


						//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
						$("#add_b_joinAddUser").on("click", function () {

							fncAddUser();
						});

						$("#add_b_cancel").on("click", function () {

							self.location = "/.jsp";
						});

						function fncAddUser() {

							var id = $("#add_b_id").val();
							var pw = $("#add_b_password").val();
							var pw_confirm = $("#add_b_confirmPassword").val();
							var name = $("#add_b_name").val();
							var campName = $("input#add_b_campName").val();
							var phone = $("#add_b_phone").val();
							var campBusinessNum = $("#add_b_campBusinessNum").val();
							var mainlConfirm = $("#add_b_checkMailAuth").val();

							console.log(campName);

							if (id == null || id.length < 1) {
								alert("아이디는 반드시 입력하셔야 합니다.");
								return;
							}

							if (auth_check != 1) {
								console.log(auth_check);
								alert("인증번호를 다시 확인해주세요.");
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
								alert("이름은  반드시 입력하셔야 합니다.");
								return;
							}

							if (pw != pw_confirm) {
								alert("비밀번호 확인이 일치하지 않습니다.");
								$("input:text[name='confirmPassword']").focus();
								return;
							}

							if (campName == "" || campName.length < 1 || campName == undefined) {
								alert("캠핑장명은 반드시 입력하셔야 합니다.");
								return;
							}

							if (phone == null || phone.length < 1) {
								alert("휴대폰번호는 반드시 입력하셔야 합니다.");
								return;
							}

							if (campBusinessNum == null || campBusinessNum.length < 1) {
								alert("사업자등록 번호는 반드시 입력하셔야 합니다.");
								return;
							}

							var addr = "";
							if ($("#add_b_addr").val() != "" && $("#add_b_userAddr").val() != "") {
								var value = $("#add_b_addr").val() + ""
									+ $("#add_b_userAddr").val();
							}

							$("#add_b_allAddr").val(value);

							Swal.fire({
								icon: 'success',
								title: '가입신청 완료',
								html: '회원가입이 신청이 완료되었습니다.<br>관리자 승인 후 승인메일이 발송됩니다:)'
							}).then(() => {

								$("#add_b_form").attr("method", "POST").attr("action", "/user/addUser").attr("enctype", "multipart/form-data").submit();

							});
						}



						//주소검색
						document.getElementById("add_b_addr").addEventListener("click", function () { //주소입력칸을 클릭하면
							new daum.Postcode({
								oncomplete: function (data) { //선택시 입력값 세팅
									document.getElementById("add_b_addr").value = data.address; // 주소 넣기
									document.querySelector("#add_b_userAddr").focus(); //상세입력 포커싱
								}
							}).open();
						});

						$("#get_b_cancel").on("click", function () {
							window.history.go(-1);
						})
					});
				</script>
			</body>

			</html>