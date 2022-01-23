<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">

			<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

			<title>사업자회원정보 조회/수정</title>

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

				#approval-business-btn {
					position: relative;
					bottom: 0;
					right: -57%;
					margin-top: 15px;
				}


				.pictureWrapper {
					position: absolute;
					display: none;
					justify-content: center;
					align-items: center;
					top: 0%;
					width: 100%;
					height: 100%;
					background-color: gray;
					z-index: 100;
					background: rgba(255, 255, 255, 0.5);
				}

				.business_pic {
					position: relative;
					display: flex;
					justify-content: center;
					align-items: center;
				}

				.business_pic img {
					width: 600px;
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
							style="background-image: url(../../resources/images/getBusinessUserUpdateAdminImg.jpg)">>
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
										<form class="form" role="form" id="update_b_a_form">
											<div id="email" class="form-group row">
												<div><input id="role" name="role" value="BUSINESS" hidden="hidden">
												</div>
												<label for="get_b_a_id"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_id" name="id" class="form-control "
														value="${user.id}" readonly />
												</div>
												<div class='col-sm-offset-3 col-sm-6 checkFont'><span id="helpBlock"
														class="help-block">
														<strong class="text-danger">아이디는 수정이 불가합니다.</strong>
													</span></div>
											</div>
											<div id="get_b_a_campName1" class="form-group row">
												<label for="get_b_a_campName"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>캠핑장명</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_campName" name="campName" class="form-control"
														type="text" value="${user.campName}"
														placeholder="캠핑장명을 입력해 주세요." />
												</div>
											</div>

											<div class="form-group row">
												<label for="get_b_a_campBusinessNum"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자
														등록번호</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_campBusinessNum" name="campBusinessNum"
														class="form-control" type="text" value="${user.campBusinessNum}"
														maxlength="10" readonly />
												</div>
												<div id="get_b_a_check-business"
													class='col-sm-offset-3 col-sm-6 checkFont'></div>
											</div>

											<div class="form-group row">
												<div class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자
														등록증 사진</strong></div>
												<div class="pictureWrapper">
													<div class="business_pic">
													</div>
												</div>
												<img class="clickImg" alt="" id="get_b_a_input_businessImg_file"
													style="width:20%; margin-top:10px;"
													src="/uploadfiles/userBusinessImg/${user.campBusinessImg}">

											</div>


											<div class="form-group row">
												<label for="get_b_a_name"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>사업자대표
														이름</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_name" name="name" class="form-control"
														type="text" value="${user.name}" placeholder="이름을 입력하세요" />
												</div>
											</div>

											<div class="form-group row">
												<label for="get_b_a_phone"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_phone" name="phone" class="form-control "
														type="text" value="${user.phone}" placeholder="숫자만 입력해주세요"
														maxlength="11" readonly />

												</div>
											</div>

											<div class="form-group row">
												<label for="get_b_a_addr"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>주소</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_addr" name="addr" class="form-control"
														type="text" value="${user.addr}" placeholder="주소를 입력하세요." />
												</div>
											</div>

											<div class="form-group row">
												<label for="get_b_a_userAddr"
													class="col-sm-offset-1 col-sm-3 control-label"></label>
												<div class="col-sm-6">
													<input id="get_b_a_userAddr" name="userAddr" class="form-control"
														type="text" placeholder="상세주소를 입력하세요." style="display: none;" />
													<input type="hidden" name="allAddr" />
												</div>
											</div>

											<div class="form-group row">
												<label for="get_b_a_campCall"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>캠핑장
														전화번호</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_campCall" name="campCall" class="form-control"
														value="${user.campCall}" type="text"
														placeholder="숫자만 입력해주세요." />
												</div>
											</div>

											<div class="form-group row">
												<label for="get_b_a_accountInfo"
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
													<input id="get_b_a_accountHolder" name="accountHolder"
														class="form-control" type="text" value="${user.accountHolder}"
														placeholder="예금주" />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-offset-1 col-sm-3 control-label"></label>
												<div class="col-sm-6">
													<input id="get_b_a_accountNum" name="accountNum"
														class="form-control" type="text" value="${user.accountNum}"
														placeholder="계좌번호를 숫자만 입력하세요" maxlength="14" />
												</div>
											</div>

											<div id="point" class="form-group row">
												<label for="get_b_a_point"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>포인트
													</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_point" name="havingPoint" class="form-control"
														type="text" value="${user.havingPoint}" readonly />
												</div>
											</div>

											<div id="entryDate" class="form-group row">
												<label for="get_b_a_entryDate"
													class="col-sm-offset-1 col-sm-3 control-label"><strong>회원가입
														일자</strong></label>
												<div class="col-sm-6">
													<input id="get_b_a_entryDate" name="addUserRegDate"
														class="form-control" type="text" value="${user.addUserRegDate}"
														readonly />
												</div>
											</div>

											<c:if test="${user.suspensionDate != null}">
												<div id="get_b_a_suspention-date" class="form-group row">
													<label for="suspention-date"
														class="col-sm-offset-1 col-sm-3 control-label"><strong>이용정지
															일자</strong></label>
													<div class="col-sm-6">
														<input id="get_b_a_suspensionDate" name="suspensionDate"
															class="form-control" type="text"
															value="${user.suspensionDate}" readonly />
													</div>
												</div>
											</c:if>

											<c:if test="${user.secessionRegDate != null}">
												<div id="secession-date" class="form-group row">
													<label for="get_b_a_secession-date"
														class="col-sm-offset-1 col-sm-3 control-label"><strong>탈퇴
															일자</strong></label>
													<div class="col-sm-6">
														<input id="get_b_a_secessionDate" name="secessionRegDate"
															class="form-control" type="text"
															value="${user.secessionRegDate}" readonly />
													</div>
												</div>
											</c:if>
										</form>
									</div>
								</div>
								<div class="row" id="approval-business-btn">
									<c:if test="${user.businessUserApprovalFlag !='Y'}"> <button id="approval-btn"
											class="btn btn-xs btn-border-d btn-circle" type="button">가입승인</button>
									</c:if>
									<button id="get_b_a_cancel" class="btn btn-xs btn-border-d btn-circle"
										type="button">취소</button>
									<button id="get_b_a_business-updateUser" class="btn btn-xs btn-border-d btn-circle"
										type="submit">수정하기</button>

								</div>
							</div>
				</div>
			</section>

			<!-- end: page -->
			</section>
			</div>


			</section>

			<jsp:include page="/resources/commonScriptAdmin.jsp" />

			<!-- Specific Page Vendor -->
			<script src="/resources/lib/select2/select2.js"></script>
			<script src="/resources/lib/jquery-datatables/media/js/jquery.dataTables.js"></script>
			<script src="/resources/lib/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
			<script src="/resources/lib/jquery-datatables-bs3/assets/js/datatables.js"></script>

			<script type="text/javascript">



				$(function () {

					$(document).on("click", "img", function () {
						var path = $(this).attr('src')
						showImage(path);
					});//end click event

					function showImage(fileCallPath) {

						$(".pictureWrapper").css("display", "flex").show();

						$(".business_pic")
							.html("<img src='" + fileCallPath + "' >")
							.animate({ width: '100%', height: '100%' }, 1000);

					}//end fileCallPath

					$(".pictureWrapper").on("click", function (e) {
						$(".business_pic").animate({ width: '0%', height: '0%' }, 1000);
						setTimeout(function () {
							$('.pictureWrapper').hide();
						}, 1000);
					});//end bigWrapperClick event


					//휴대폰번호 중복체크
					$("#get_b_a_phone").on("keyup", function () {

						var regExp = /^[0-9]*$/;
						var phone = $("#get_b_a_phone").val();

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
											$("#get_b_a_phone").val("");
											$("#get_b_a_check-phone").html("휴대폰번호는 숫자로만 입력 가능합니다.");
										} else if (phone.length == 11) {
											$("#get_b_a_check-phone").html('사용 가능한 번호입니다.');
											$("#get_b_a_check-phone").css('color', 'green');
										} else if (phone.length > 11) {
											$("#get_b_a_phone").val("");
											$("#get_b_a_check-phone").html("휴대폰번호는 11자리만 가능합니다.");
										} else {
											$("#get_b_a_check-phone").html("");
										}

									} else {
										$("#get_b_a_check-phone").html('이미 사용중이거나 중복된 휴대폰번호 입니다.');
										$("#get_b_a_check-phone").css('color', 'red');
									}
								}
							}
						});

					});

					$("#approval-btn").on("click", function () {
						var id = $("#get_b_a_id").val();

						console.log("가입승인");
						$.ajax({
							url: '/user/rest/approvalBusinessUser',
							// headers: {
							// 	"Accept": "application/json",
							// 	"Content-Type": "application/json"
							// },
							method: 'POST',
							//dataType: 'json',
							data: ({
								"id": id
							}),
							success: function (result) {
								console.log('성공: ' + result);

								if (result == 1) {
									Swal.fire(
										'승인완료!',
										'가입승인이 완료되었습니다..',
										'success'
									).then((result) => {
										window.location = "/user/listUser/list";
									})
								} else {
									Swal.fire('가입승인에 실패했습니다.')
								}
							}



						});
					});

					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#get_b_a_business-updateUser").on("click", function () {
						console.log("뭐지");
						fncupdateUser();
					});

					function fncupdateUser() {

						var addr = "";
						if ($("#get_b_a_addr").val() != "" && $("#get_b_a_userAddr").val() != "") {
							var value = $("#get_b_a_addr").val() + ""
								+ $("#get_b_a_userAddr").val();
						}

						$("#get_b_a_allAddr").val(value);

						Swal.fire({
							icon: 'success',
							title: '수정완료',
							html: '정보수정이 완료되었습니다:)'

						}).then(() => {
							$("#update_b_a_form").attr("method", "POST").attr("action", "/user/updateUser").submit();
						});

					}


					//주소검색
					document.getElementById("get_b_a_addr").addEventListener("click", function () { //주소입력칸을 클릭하면
						$("#get_b_a_userAddr").show();
						new daum.Postcode({
							oncomplete: function (data) { //선택시 입력값 세팅
								document.getElementById("get_b_a_addr").value = data.address; // 주소 넣기
								document.querySelector("#get_b_a_userAddr").focus(); //상세입력 포커싱
							}
						}).open();
					});

					$("#get_b_a_cancel").on("click", function () {
						window.history.go(-1);
					})
				});

			</script>
		</body>

		</html>