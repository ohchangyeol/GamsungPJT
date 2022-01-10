<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!doctype html>
		<html class="fixed">

		<head>

			<!-- Basic -->
			<meta charset="UTF-8">

			<title>경매 정지 회원</title>
			<meta name="keywords" content="HTML5 Admin Template" />
			<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
			<meta name="author" content="JSOFT.net">

			<jsp:include page="../../resources/commonCssAdmin.jsp" />

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
			</style>
		</head>

		<body class="admin-page">
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
									<h4 class="col-sm-7 mb-0">경매 정지 회원 목록</h4>
									<div class="col-sm-5 mb-sm-0">
										<div class="row">
											<form id="listForm" role="form" class="notice-search">
												<div class="col-sm-4"></div>
												<div class="col-sm-8">
													<div class="search-box">
														<input class="form-control" type="text" placeholder="Search...">
														<button class="search-btn" type="submit"><i
																class="fa fa-search"></i></button>
													</div>
												</div>

											</form>
										</div>
									</div>

								</div>
							</header>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover mb-none">
										<thead>
											<tr>
												<th>아이디</th>
												<th>이름</th>
												<th>닉네임</th>
												<th>경매등급</th>
												<th>이용 정지 일자</th>
												<th>정지 해제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="user" items="${list}">
												<tr>
													<td>${user.id}</td>
													<td>${user.name}</td>
													<td>${user.nickName}</td>
													<td>${user.auctionGrade}</td>
													<td>${user.auctionSuspension}</td>
													<td class="actions-hover actions-fade">
														<a class="delSuspension"><i class="fa fa-check"></i></a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="pagination font-alt page-nav">
									<a href="#">
										<i class="fa fa-angle-left"></i>
									</a>
									<c:forEach var="i" begin="1" end="${count}" step="1">
										<a class="active" href="#">${i}</a>
									</c:forEach>
									<a>
										<i class="fa fa-angle-right"></i>
									</a>
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

		</body>

		<script type="text/javascript">
		$(function(){
			$('.delSuspension').on('click',function(){
				
				var id = $(this).parent().prev().prev().prev().prev().prev().text();
				var location = $(this).parent().parent()
				$.ajax({
					url : "/auction/rest/deleteSuspension",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					method : "POST",
					data : JSON.stringify({
						id : id
					}),
					dataType : "json",
					success : function(JSONData, status){
						alert(JSONData.info);
						location.remove();
					}
				});
				
			});			
		});
		</script>


		</html>