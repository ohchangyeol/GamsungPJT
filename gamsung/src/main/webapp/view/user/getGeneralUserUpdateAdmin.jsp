<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">

			<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

			<title>일반회원정보 조회/수정</title>

			<jsp:include page="../../resources/commonCssAdmin.jsp" />

			<!-- Specific Page Vendor CSS -->
			<link rel="stylesheet" href="/resources/lib/select2/select2.css" />
			<link rel="stylesheet" href="/resources/lib/jquery-datatables-bs3/assets/css/datatables.css" />

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

				#approval-general-btn {
					position: absolute;
					bottom: 0;
					right: 25%;
					margin-top: 15px;
				}
			</style>

			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


		</head>

		<body>
			<section class="body">

				<!-- start: header -->
				<jsp:include page="../../view/common/adminHeader.jsp" />

				<!-- end: header -->

				<div class="inner-wrapper">
					<!-- start: sidebar -->
					<jsp:include page="../../view/common/adminSidebar.jsp" />
					<!-- end: sidebar -->

					<section role="main" class="content-body">
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
						<section class="pannel">
							<div class="container">
								<div class="row">
									<div class="col-sm-8 col-sm-offset-2">
										<h4 class="font-alt mb-0">일반회원정보 조회/수정</h4>
										<hr class="divider-w mt-10 mb-20">
										<form class="form" role="form">
											<div id="email" class="form-group">
												<div><input id="role" name="role" value="GENERAL" hidden="hidden"></div>
												<label for="id"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
												<div class="col-sm-6">
													<input id="id" name="id" class="form-control " value="${user.id}"
														readonly />
												</div>
												<div class='col-sm-offset-3 col-sm-6'><span id="helpBlock"
														class="help-block">
														<strong class="text-danger">아이디는 수정이 불가합니다.</strong>
													</span></div>
											</div>

											<div id="nick-name" class="form-group">
												<label for="nickName"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>닉네임</strong></label>
												<div class="col-sm-6">
													<input id="nickName" name="nickName" class="form-control"
														type="text" value="${user.nickName}"
														placeholder="닉네임을 입력해 주세요." />
												</div>
												<div id="check-nickName" class='col-sm-offset-3 col-sm-6'></div>
											</div>


											<div class="form-group">
												<label for="name"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
												<div class="col-sm-6">
													<input id="name" name="name" class="form-control" type="text"
														value="${user.name}" placeholder="이름을 입력하세요" />
												</div>
											</div>

											<div class="form-group">
												<label for="phone"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
												<div class="col-sm-6">
													<input id="phone" name="phone" class="form-control " type="text"
														value="${user.phone}" maxlength="11" readonly />

												</div>


												<div class="form-group">
													<label for="addr"
														class="col-sm-offset-1 col-sm-3 control-label"><strong>주소</strong></label>
													<div class="col-sm-6">
														<input id="addr" name="addr" class="form-control" type="text"
															value="${user.addr}" placeholder="주소를 입력하세요." />
													</div>
												</div>

												<div class="form-group">
													<label for="userAddr"
														class="col-sm-offset-1 col-sm-3 control-label"></label>
													<div class="col-sm-6">
														<input id="userAddr" name="userAddr" class="form-control"
															type="text" placeholder="상세주소를 입력하세요." /> <input
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
															<option value="신한은행" <c:if test="${user.bank eq '신한은행'}">
																selected="selected"</c:if>>신한은행</option>
															<option value="우리은행" <c:if test="${user.bank eq '우리은행'}">
																selected="selected"</c:if>>우리은행</option>
															<option value="하나은행" <c:if test="${user.bank eq '하나은행'}">
																selected="selected"</c:if>>하나은행</option>
															<option value="NH농협은행" <c:if
																test="${user.bank eq 'NH농협은행'}">
																selected="selected"</c:if>>NH농협은행</option>
															<option value="카카오뱅크" <c:if test="${user.bank eq '카카오뱅크'}">
																selected="selected"</c:if>>카카오뱅크</option>
														</select>
													</div>
													<div class="col-sm-3">
														<input id="accountHolder" name="accountHolder"
															class="form-control" type="text"
															value="${user.accountHolder}" placeholder="예금주" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-offset-1 col-sm-3 control-label"></label>
													<div class="col-sm-6">
														<input id="accountNum" name="accountNum" class="form-control"
															type="text" placeholder="계좌번호를 숫자만 입력하세요" maxlength="14" />
													</div>
												</div>
												<div id="general-point" class="form-group row">
													<label for="general-point"
														class="col-sm-offset-1 col-sm-3 control-label"><strong>포인트
														</strong></label>
													<div class="col-sm-6">
														<input id="generalPoint" name="havingPoint" class="form-control"
															type="text" value="${user.havingPoint}" />
													</div>
												</div>

												<div id="general-entryDate" class="form-group row">
													<label for="general-entryDate"
														class="col-sm-offset-1 col-sm-3 control-label"><strong>회원가입
															일자</strong></label>
													<div class="col-sm-6">
														<input id="generalEntryDate" name="addUserRegDate"
															class="form-control" type="text"
															value="${user.addUserRegDate}" readonly />
													</div>
												</div>

												<c:if test="${user.suspensionDate}  !=null">
													<div id="general-suspention-date" class="form-group row">
														<label for="general-suspention-date"
															class="col-sm-offset-1 col-sm-3 control-label"><strong>이용정지
																일자</strong></label>
														<div class="col-sm-6">
															<input id="generalAddsuspention-date" name="suspensionDate"
																class="form-control" type="text"
																value="${user.suspensionDate}" readonly />
														</div>
													</div>
												</c:if>
												<c:if test="${user.secessionRegDate !=null}">
													<div id="general-secession-date" class="form-group row">
														<label for="general-secession-date"
															class="col-sm-offset-1 col-sm-3 control-label"><strong>탈퇴
																일자</strong></label>
														<div class="col-sm-6">
															<input id="generalAddSecession-date" name="secessionRegDate"
																class="form-control" type="text"
																value="${user.secessionRegDate}" readonly />
														</div>
													</div>
												</c:if>
										</form>

									</div>
								</div>
								<div class="row" id="approval-general-btn">
									<button id="cancel" class="btn btn-xs btn-border-d btn-circle"
										type="button">취소</button>
									<button id="general-updateUser" class="btn btn-xs btn-border-d btn-circle"
										type="submit">수정하기</button>

								</div>
							</div>
				</div>
			</section>

			</div>
			</main>


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

			<script type="text/javascript">

				$(function () {


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
									if (nickName.length > 2) {
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


					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#general-updateUser").on("click", function () {
						console.log("뭐지");
						fncupdateUser();
					});

					function fncupdateUser() {

						//var id=$("input[name='userId']").val();
						var pw = $("input[name='password']").val();
						var pw_confirm = $("input[name='confirmPassword']").val();
						var name = $("input[name='name']").val();
						var nickName = $("input[name='nickName']").val();
						var phone = $("input[name='phone']").val();


						/* if(id == null || id.length <1){
						alert("아이디는 반드시 입력하셔야 합니다.");
						return;
						} *
						
						if(password == null || password.length <1){
						alert("패스워드는  반드시 입력하셔야 합니다.");
						return;
						}
						
						if(7<password.length <16){
						alert("패스워드는 8~15자까지 가능합니다.");
						return;
						}
						
						if(confirmPassword == null || confirmPassword.length <1){
						alert("패스워드 확인은  반드시 입력하셔야 합니다.");
						return;
						}
						
						if(name == null || name.length <1){
						alert("이름은  반드시 입력하셔야 합니다.");
						return;
						}
						
						if( password != confirmPassword ) {				
						alert("비밀번호 확인이 일치하지 않습니다.");
						$("input:text[name='confirmPassword']").focus();
						return;
						}
						
						if(nickName == null || nickName.length <1){
						alert("닉네임은 반드시 입력하셔야 합니다.");
						return;
						}
						
						if(phone == null || phone.length <1){
						alert("휴대폰번호는 반드시 입력하셔야 합니다.");
						return;
						}*/

						var addr = "";
						if ($("input:text[name='addr']").val() != "" && $("input:text[name='userAddr']").val() != "") {
							var value = $("input[name='addr']").val() + ""
								+ $("input[name='userAddr']").val();
						}

						$("input:hidden[name='allAddr']").val(value);

						$("form").attr("method", "POST").attr("action", "/user/updateUser").submit();
					}


					//주소검색
					document.getElementById("addr").addEventListener("click", function () { //주소입력칸을 클릭하면
						new daum.Postcode({
							oncomplete: function (data) { //선택시 입력값 세팅
								document.getElementById("addr").value = data.address; // 주소 넣기
								document.querySelector("input[name=userAddr]").focus(); //상세입력 포커싱
							}
						}).open();
					});
				});

			</script>
		</body>
		</html>