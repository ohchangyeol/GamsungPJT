<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!doctype html>
	<html class="fixed">

	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>회원 목록</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
		<meta name="author" content="JSOFT.net">

		<%-- <jsp:include page="../../resources/commonCssAdmin.jsp" /> --%>

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="/resources/lib/select2/select2.css" />
		<link rel="stylesheet" href="/resources/lib/jquery-datatables-bs3/assets/css/datatables.css" />

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
			<%-- <jsp:include page="../../view/common/adminHeader.jsp" /> --%>

			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<jsp:include page="../../view/common/adminSidebar.jsp" />
				<!-- end: sidebar -->

				<section role="main" class="content-body">

					<section class="panel">
						<header class="panel-heading">
							<div class="row">
								<h4 class="col-sm-7 mb-0">신고 내역 조회</h4>
								<div class="col-sm-5 mb-sm-0">
									<div class="row">
										<form role="form" class="notice-search">
											<div class="col-sm-4">
												<select class="form-control">
													<option selected="selected">role+id</option>
													<option>role</option>
													<option>id</option>
												</select>
											</div>
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
											<th>회원유형</th>
											<th>아이디</th>
											<th>이름</th>
											<th>닉네임/캠핑장명</th>
											<th>회원가입일자</th>
											<th>최근로그인일자</th>
											<th>이용정지등록</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>근육대지</td>
											<td>욕설</td>
											<td>황현지</td>
											<td></td>
											<td>2022.01.05</td>
											<td></td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="pagination font-alt page-nav">
								<a href="#">
									<i class="fa fa-angle-left"></i>
								</a>
								<a class="active" href="#">1</a>
								<a href="#">2</a>
								<a href="#">3</a>
								<a href="#">4</a>
								<a href="#">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
					</section>

					<!-- end: page -->
				</section>
			</div>


		</section>

		<%-- <jsp:include page="/resources/commonScriptAdmin.jsp" /> --%>

		<!-- Specific Page Vendor -->
		<script src="/resources/lib/select2/select2.js"></script>
		<script src="/resources/lib/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="/resources/lib/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
		<script src="/resources/lib/jquery-datatables-bs3/assets/js/datatables.js"></script>

	</body>

	</html>