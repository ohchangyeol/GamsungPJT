<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">

			<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

			<title>일반회원정보 조회/수정</title>

			<!-- Specific Page Vendor CSS -->
			<link rel="stylesheet" href="/resources/lib/select2/select2.css" />
			<link rel="stylesheet" href="/resources/lib/jquery-datatables-bs3/assets/css/datatables.css" />

			<jsp:include page="../../resources/commonCssAdmin.jsp" />
			<%--<jsp:include page="../../resources/commonLib.jsp" />--%>

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
					bottom: 0%;
					right: 30%;
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
							style="background-image: url(../../resources/images/getGeneralUserUpdateAdminImg.jpg)">
							<div class="container">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
									</div>
								</div>
							</div>
						</section>
						<section class="pannel">
							<div class="container">
								<div class="row">
									<div class="col-sm-8 col-sm-offset-2">
										<hr class="divider-w mt-10 mb-20">
										<form class="form" role="form" id="update_g_a_form">
											<div id="email" class="form-group">
												<div><input id="role" name="role" value="GENERAL" hidden="hidden">
												</div>
												<label for="get_g_a_id"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
												<div class="col-sm-6">
													<input id="get_g_a_id" name="id" class="form-control "
														value="${user.id}" readonly />
												</div>
												<div class='col-sm-offset-3 col-sm-6 checkFont'><span id="helpBlock"
														class="help-block">
														<strong class="text-danger">아이디는 수정이 불가합니다.</strong>
													</span></div>
											</div>

											<div id="nick-name" class="form-group">
												<label for="get_g_a_nickName"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>닉네임</strong></label>
												<div class="col-sm-6">
													<input id="get_g_a_nickName" name="nickName" class="form-control"
														type="text" value="${user.nickName}"
														placeholder="닉네임을 입력해 주세요." />
												</div>
												<div id="get_g_a_check-nickName"
													class='col-sm-offset-3 col-sm-6 checkFont'></div>
											</div>


											<div class="form-group">
												<label for="get_g_a_name"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
												<div class="col-sm-6">
													<input id="get_g_a_name" name="name" class="form-control"
														type="text" value="${user.name}" placeholder="이름을 입력하세요" />
												</div>
											</div>

											<div class="form-group">
												<label for="get_g_a_phone"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
												<div class="col-sm-6">
													<input id="get_g_a_phone" name="phone" class="form-control "
														type="text" value="${user.phone}" maxlength="11" readonly />

												</div>


												<div class="form-group">
													<label for="get_g_a_addr"
														class="col-sm-offset-1 col-sm-3 control-label"
														style="margin-top: 15px;"><strong>주소</strong></label>
													<div class="col-sm-6">
														<input id="get_g_a_addr" name="addr" class="form-control"
															type="text" value="${user.addr}" placeholder="주소를 입력하세요."
															style="margin-top: 15px;" />
													</div>
												</div>

												<div class="form-group">
													<label for="get_g_a_userAddr"
														class="col-sm-offset-1 col-sm-3 control-label"></label>
													<div class="col-sm-6">
														<input id="get_g_a_userAddr" name="userAddr"
															class="form-control" type="text" placeholder="상세주소를 입력하세요."
															style="display: none;" />
														<input type="hidden" name="allAddr" />
													</div>
												</div>

												<div class="form-group">
													<label for="get_g_a_accountInfo"
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
														<input id="get_g_a_accountHolder" name="accountHolder"
															class="form-control" type="text"
															value="${user.accountHolder}" placeholder="예금주" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-offset-1 col-sm-3 control-label"></label>
													<div class="col-sm-6">
														<input id="get_g_a_accountNum" name="accountNum"
															class="form-control" type="text"
															value="${user.accountNum}" placeholder="계좌번호를 숫자만 입력하세요" maxlength="14" />
													</div>
												</div>
												<div id="general-point" class="form-group">
													<label for="get_g_a_general-point"
														class="col-sm-offset-1 col-sm-3 control-label"><strong>포인트
														</strong></label>
													<div class="col-sm-6">
														<input id="get_g_a_generalPoint" name="havingPoint"
															class="form-control" type="text" value="${user.havingPoint}"
															readonly />
													</div>
												</div>

												<div id="general-entryDate" class="form-group">
													<label for="get_g_a_general-entryDate"
														class="col-sm-offset-1 col-sm-3 control-label"><strong>회원가입
															일자</strong></label>
													<div class="col-sm-6">
														<input id="get_g_a_generalEntryDate" name="addUserRegDate"
															class="form-control" type="text"
															value="${user.addUserRegDate}" readonly />
													</div>
												</div>

												<c:if test="${user.suspensionDate}  !=null">
													<div id="get_g_a_general-suspention-date" class="form-group">
														<label for="general-suspention-date"
															class="col-sm-offset-1 col-sm-3 control-label"><strong>이용정지
																일자</strong></label>
														<div class="col-sm-6">
															<input id="get_g_a_generalAddsuspention-date"
																name="suspensionDate" class="form-control" type="text"
																value="${user.suspensionDate}" readonly />
														</div>
													</div>
												</c:if>
												<c:if test="${user.secessionRegDate !=null}">
													<div id="get_g_a_general-secession-date" class="form-group">
														<label for="general-secession-date"
															class="col-sm-offset-1 col-sm-3 control-label"><strong>탈퇴
																일자</strong></label>
														<div class="col-sm-6">
															<input id="get_g_a_generalAddSecession-date"
																name="secessionRegDate" class="form-control" type="text"
																value="${user.secessionRegDate}" readonly />
														</div>
													</div>
												</c:if>
										</form>

									</div>
								</div>
								<div id="approval-general-btn">
									<button id="get_g_a_cancel" class="btn btn-xs btn-border-d btn-circle"
										type="button">취소</button>
									<button id="get_g_a_general-updateUser" class="btn btn-xs btn-border-d btn-circle"
										type="submit">수정하기</button>

								</div>
							</div>
				</div>
			</section>

			</div>
			</main>

			<jsp:include page="/resources/commonScriptAdmin.jsp" />

			<!-- Specific Page Vendor -->
			<script src="/resources/lib/select2/select2.js"></script>
			<script src="/resources/lib/jquery-datatables/media/js/jquery.dataTables.js"></script>
			<script src="/resources/lib/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
			<script src="/resources/lib/jquery-datatables-bs3/assets/js/datatables.js"></script>

			<script type="text/javascript">

				$(function () {


					//닉네임 중복체크
					$("#get_g_a_nickName").on("keyup", function () {

						var nickName = $("#get_g_a_nickName").val();

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
										$("#get_g_a_check-nickName").html('사용 가능한 닉네임입니다.');
										$("#get_g_a_check-nickName").css('color', 'green');
									} else {
										$("#get_g_a_check-nickName").html("");
									}
								} else {
									$("#get_g_a_check-nickName").html('이미 사용중이거나 중복된 닉네임 입니다.');
									$("#get_g_a_check-nickName").css('color', 'red');
								}
							}
						});

					});


					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#get_g_a_general-updateUser").on("click", function () {
						console.log("뭐지");
						fncupdateUser();
					});

					function fncupdateUser() {

						var addr = "";
						if ($("#get_g_a_addr").val() != "" && $("#get_g_a_userAddr").val() != "") {
							var value = $("#get_g_a_addr").val() + $("#get_g_a_userAddr").val();
						}

						$("#get_g_a_allAddr").val(value);

						Swal.fire({
							icon: 'success',
							title: '수정완료',
							html: '정보수정이 완료되었습니다:)'

						}).then(() => {
							$("#update_g_a_form").attr("method", "POST").attr("action", "/user/updateUser").submit();
						});
					}


					//주소검색
					document.getElementById("get_g_a_addr").addEventListener("click", function () { //주소입력칸을 클릭하면
						new daum.Postcode({
							oncomplete: function (data) { //선택시 입력값 세팅
								document.getElementById("get_g_a_addr").value = data.address; // 주소 넣기
								document.querySelector("#get_g_a_userAddr").focus(); //상세입력 포커싱
							}
						}).open();
					});

					$("#get_g_a_cancel").on("click", function () {
						window.history.go(-1);
					})
				});

			</script>
		</body>

		</html>