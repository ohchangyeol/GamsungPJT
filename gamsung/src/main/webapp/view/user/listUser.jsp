<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!doctype html>
		<html class="fixed">

		<head>

			<!-- Basic -->
			<meta charset="UTF-8">

			<title>회원목록</title>
			<meta name="keywords" content="HTML5 Admin Template" />
			<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
			<meta name="author" content="JSOFT.net">

			<jsp:include page="../../resources/commonCssAdmin.jsp" />

			<!-- Specific Page Vendor CSS -->
			<link rel="stylesheet" href="/resources/lib/select2/select2.css" />
			<link rel="stylesheet" href="/resources/lib/jquery-datatables-bs3/assets/css/datatables.css" />
			<!-- <link rel="stylesheet" href="../../resources/lib/magnific-popup/magnific-popup.css" /> -->

			<style>
				.list ul li {
					list-style: none;
					display: flex;
				}

				.panel-heading {
					background-color: transparent;
				}

				/* .panel-body .table-responsive .mb-none tbody tr+tr{ margin-top: 13px;} */
				.panel .panel-heading .row h4 {
					font-size: 20px;
				}

				td:nth-child(2) {
					cursor: pointer;
				}

				#addSuspension_modal .modal#addSuspensionModal {
					position: absolute;
					/* width: 500px; */
					/* height: 700px; */
					left: 50%;
					top: 50%;
					transform: translateY(-50%);
				}

				.modal-body {
					position: initial;
				}

				#addSuspension_modal .modal#addSuspensionModal .modal-content {
					position: relative;
					width: 500px;
					height: 300px;
					/* left: 50%; */
					/* top: 50%; */
					/* transform: translateY(-50%); */
				}

				.modal-body #suspension-btn {
					position: absolute;
					bottom: 10%;
					right: 7%;
				}
			</style>
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

						<section class="panel">
							<header class="panel-heading">
								<div class="row">
									<c:if test="${info eq 'list'}">
										<h4 class="col-sm-7 mb-0">회원목록</h4>
									</c:if>
									<c:if test="${info eq 'dormant'}">
										<h4 class="col-sm-7 mb-0">휴면회원 목록</h4>
									</c:if>
									<c:if test="${info eq 'secession'}">
										<h4 class="col-sm-7 mb-0">탈퇴회원 목록</h4>
									</c:if>
									<c:if test="${info eq 'reportSuspension'}">
										<h4 class="col-sm-7 mb-0">신고/이용정지 회원목록</h4>
									</c:if>
									<div class="col-sm-5 mb-sm-0">
										<div class="row">
											<form id="listForm" role="form" class="user-search">
												<div class="col-sm-4">
													<select class="form-control" name="searchCondition">
														<option value="">회원전체
														</option>
														<option value="1" ${ ! empty search.searchCondition &&
															search.searchCondition==1 ? "selected" : "" }> 일반회원</option>
														<option value="2" ${ ! empty search.searchCondition &&
															search.searchCondition==2 ? "selected" : "" }>사업자회원</option>

														<c:if test="${info eq 'list'}">
															<option value="3" ${ ! empty search.searchCondition &&
																search.searchCondition==3 ? "selected" : "" }>사업자회원 대기
															</option>
														</c:if>
													</select>
												</div>
												<div class="col-sm-8">
													<div class="user-search-box">
														<input class="form-control" name="searchKeyword" type="text"
															value="${search.searchKeyword}" placeholder="Search...">
														<button id="user_search_btn" class="search-btn" type="button"><i
																class="fa fa-search"></i></button>
													</div>
												</div>
												<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
												<input type="hidden" id="currentPage" name="currentPage"
													value='${search.currentPage=="" ? "currentPage" : 1 }' />
											</form>
										</div>
									</div>

								</div>
							</header>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover mb-none">
										<thead>
											<c:if test="${info eq 'list'}">
												<tr>
													<th>회원유형</th>
													<th>아이디</th>
													<th>이름</th>
													<th>닉네임/캠핑장명</th>
													<th>회원가입 일자</th>
													<th>최근 로그인 일자</th>
													<th>이용정지</th>
												</tr>
											</c:if>

											<c:if test="${info eq 'dormant'}">
												<tr>
													<th>회원유형</th>
													<th>아이디</th>
													<th>이름</th>
													<th>닉네임/캠핑장명</th>
													<th>최근 로그인 일자</th>
													<th>휴면전환 일자</th>
												</tr>
											</c:if>

											<c:if test="${info eq 'secession'}">
												<tr>
													<th>회원유형</th>
													<th>아이디</th>
													<th>이름</th>
													<th>닉네임/캠핑장명</th>
													<th>최근 로그인 일자</th>
													<th>탈퇴 일자</th>
												</tr>
											</c:if>

											<c:if test="${info eq 'reportSuspension'}">
												<tr>
													<th>회원유형</th>
													<th>아이디</th>
													<th>이름</th>
													<th>닉네임/캠핑장명</th>
													<th>신고횟수</th>
													<th id="check_suspension">이용정지 일자</th>
												</tr>
											</c:if>
										</thead>
										<tbody>
											<!--리스트에 순서 찍는거 <c:set var ="i" value="0" /> -->
											<c:if test="${info eq 'list' && !empty list}">
												<c:forEach var="user" items="${list}">
													<tr>
														<td>${user.role}</td>
														<td id="suspension_id_name">${user.id}</td>
														<td>${user.name}</td>
														<td>
															<c:if test="${user.role == 'GENERAL'}">
																${user.nickName}
															</c:if>
															<c:if test="${user.role == 'BUSINESS'}">
																${user.campName}
															</c:if>
														</td>
														<td>${user.addUserRegDate}</td>
														<td>${user.currentLoginRegDate}</td>
														<td>
															<a href="#addSuspensionModal" data-toggle="modal"
																data-target="#addSuspensionModal">
																<button id="list-addSuspension" type="button"
																	class="list-addSuspension">이용정지</button>
															</a>
														</td>

													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${info eq 'dormant' && !empty list}">
												<c:forEach var="user" items="${list}">
													<tr>
														<td>${user.role}</td>
														<td>${user.id}</td>
														<td>${user.name}</td>
														<td>
															<c:if test="${user.role == 'GENERAL'}">
																${user.nickName}
															</c:if>
															<c:if test="${user.role == 'BUSINESS'}">
																${user.campName}
															</c:if>
														</td>
														<td>${user.currentLoginRegDate}</td>
														<td>${user.dormantConversionDate}</td>

													</tr>

												</c:forEach>
											</c:if>

											<c:if test="${info eq 'secession' && !empty list}">
												<c:forEach var="user" items="${list}">

													<tr>
														<td>${user.role}</td>
														<td>${user.id}</td>
														<td>${user.name}</td>
														<td>
															<c:if test="${user.role == 'GENERAL'}">
																${user.nickName}
															</c:if>
															<c:if test="${user.role == 'BUSINESS'}">
																${user.campName}
															</c:if>
														</td>
														<td>${user.currentLoginRegDate}</td>
														<td>${user.secessionRegDate}</td>

													</tr>

												</c:forEach>
											</c:if>

											<c:if test="${info eq 'reportSuspension' && !empty list}">
												<c:forEach var="user" items="${list}">

													<tr>
														<td>${user.role}</td>
														<td>${user.id}</td>
														<td>${user.name}</td>
														<td>
															<c:if test="${user.role == 'GENERAL'}">
																${user.nickName}
															</c:if>
															<c:if test="${user.role == 'BUSINESS'}">
																${user.campName}
															</c:if>
														</td>
														<td>${user.reportTotalCount}</td>
														<a href="#addSuspensionModal" data-toggle="modal"
															data-target="#addSuspensionModal">
															<div style="cursor: pointer;">
																<td>${user.suspensionDate}</td>
															</div>
														</a>
													</tr>

												</c:forEach>
											</c:if>

										</tbody>
									</table>
								</div>

								<!-- PageNavigation Start... -->
								<jsp:include page="../common/pageNavigator.jsp" />
								<!-- PageNavigation End... -->
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
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
			<script src="../../resources/lib/jquery/jquery.js"></script>

		</body>

		<!-- The Modal -->
		<div id="addSuspension_modal">
			<div class="modal" id="addSuspensionModal">
				<!-- <div class="modal-dialog-centered"> -->
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h5 class="modal-title">회원 이용정지 등록</h5>
					</div>

					<form class="modal-body" role="form">
						<div id="" class="form-group row">

							<label for="" class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
							<div class="col-sm-6">
								<input id="addSuspention_id" name="id" class="form-control " type="text"
									style="border-radius:10px;" />
							</div>

						</div>
						<div id="content_textarea" class="form-group row">

							<label for="message-text" class="col-sm-offset-1 col-sm-3 col-form-label"><strong>이용정지
									사유</strong></label>
							<div class="col-sm-6">
								<textarea class="form-control" id="message-text" name="suspensionContent"
									style="border-radius:10px; height: 110px;" maxlength="200"> </textarea>
							</div>
						</div>

						<div id="suspension-btn">
							<button id="cancel" class="btn btn-border-d btn-circle" type="button"
								data-dismiss="modal">취소</button>
							<button id="addSuspension_user_btn" class="btn btn-border-d btn-circle" type="button"
								data-dismiss="modal">확인</button>
						</div>
					</form>
				</div>
				<!-- </div> -->
			</div>
		</div>

		<script type="text/javascript">

			//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
			function fncGetList(currentPage) {
				$("#currentPage").val(currentPage)
				$("#listForm").attr("method", "POST").attr("action", "/user/listUser/${info}").submit();
			}

			$("#user_search_btn").on("click", function () {
				$("#listForm").attr("method", "POST").attr("action", "/user/listUser/${info}").submit();
			});


			//============= "검색"  Event  처리 =============	
			$(function () {

				$("td:nth-child(7)").on("click", function () {
					// var suspension_id_val = document.getElementById('addSuspention_id').innerText;
					//var suspension_id_val = $(this).prevAll().value;

					var id = $(this).prevAll("td:nth-child(2)").text();
					$("#addSuspention_id").val(id);

					console.log("아이디" + id);

					$("#addSuspension_user_btn").on("click", function () {
						var suspensionContent = $("#message-text").val();
						$.ajax(
							{
								url: "/user/rest/addSuspensionUser",
								method: "POST",
								dataType: "json",
								headers: {
									"Accept": "application/json",
									"Content-Type": "application/json"
								},
								data: JSON.stringify({
									"id": id,
									"suspensionContent": suspensionContent
								}),
								success: function (susData) {

									console.log('성공: ' + susData);
									if (susData == 0) {

										Swal.fire("이용정지 등록되었습니다.").then(() => {
											$('#addSuspensionModal').hide();
											window.location = "/user/listUser/list"
										});
									} else {
										Swal.fire("이용정지 등록에 실패하였습니다.").then(() => {
											$('#addSuspensionModal').hide();
										});
									}
								}
							});
					});

				});

				$("td:nth-child(6)").on("click", function () {
					var id = $(this).prevAll("td:nth-child(2)").text();
					$("#addSuspention_id").val(id);
					console.log(id);
					var check = $("#check_suspension").text();
					console.log(check);
					if (check == '이용정지 일자') {
						$.ajax(
							{
								url: "/user/rest/getUser",
								method: "POST",
								dataType: "text",
								headers: {
									"Accept": "application/json",
									"Content-Type": "application/json"
								},
								data: JSON.stringify({
									"id": id
								}),
								success: function (susContent) {
									console.log('성공: ' + susContent);
									if (susContent != null) {
										$("#message-text").val(susContent);
										$(".modal-title").html("이용정지 조회");
										$("#addSuspension_user_btn").hide();
										$("#addSuspensionModal").show();

									} $("#suspension-btn").on("click", function () {
										$("#addSuspensionModal").hide();
									});
								}, error: function (request, status, error) {
									alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
								}

							});
					}
				});
				//============= userId 에 회원정보보기  Event  처리(Click) =============	


				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("td:nth-child(2)").on("click", function () {
					self.location = "/user/getUser?userId=" + $(this).text().trim();
				});

				//==> userId LINK Event End User 에게 보일수 있도록 
				$("td:nth-child(2)").css("color", "blue");




			});
		</script>

		</html>