<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>공지사항 등록</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
		<meta name="author" content="JSOFT.net">

		<jsp:include page="/resources/commonCssAdmin.jsp"/>

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="../../../resources/lib/bootstrap-tagsinput/bootstrap-tagsinput.css" />
		<link rel="stylesheet" href="../../../resources/lib/summernote/summernote.css" />
		<link rel="stylesheet" href="../../../resources/lib/summernote/summernote-bs3.css" />
		<link rel="stylesheet" href="../../../resources/css/serviceCenter.css">

		


	</head>
	<body>
		<section class="body add-notice">

			<!-- start: header -->
			<jsp:include page="../../../view/common/adminHeader.jsp"/>
			
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<jsp:include page="../../../view/common/adminSidebar.jsp"/>
				<!-- end: sidebar -->

				<section role="main" class="content-body">
					<section class="content-with-menu content-with-menu-has-toolbar mailbox add-notice">
						<div class="content-with-menu-container" data-mailbox data-mailbox-view="compose">
							<div class="inner-body qna">
								<c:if test="${!empty qnaType}">
									
									<c:if test='${qnaType == "list"}'>
									<section class="panel">
										<header class="panel-heading" style="background-color: transparent;border-bottom: none;">
											<div class="row">
												<h4 class="col-sm-7 mb-0">Q&A 문의 내역</h4>
												<div class="col-sm-5 mb-sm-0">
													<div class="row">
													<form role="form" class="qna-search" method="post">
														<div class="col-sm-4">
														<select class="form-control" name="searchCondition">
															<option value="0" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==0 ? "selected" : "" }>제목+내용</option>
															<option value="1" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==1 ? "selected" : "" }>제목</option>
															<option value="2" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==2 ? "selected" : "" }>내용</option>
														</select>
														</div>
														<div class="col-sm-8">
														<div class="search-box">
															<input class="form-control" type="text" name="searchKeyword" value="${wrapper.search.searchKeyword}" placeholder="Search...">
															<button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
														</div>
														</div>
														<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
														
													</form>
													</div>
												</div>
						
											</div>
										</header>
										
										<jsp:include page="../qna/listMyQna.jsp"/>
									</section>
									</c:if>
									<c:if test='${qnaType == "get"}'>
										<div class="sub-title">
											<h4>Q&A 상세</h4>
											<div class="btn-box">
											  <button class="btn btn-d btn-round qna-back" type="button">목록가기</button>
											</div>
										</div>
										<hr class="divider-w mt-10 mb-20">
										<jsp:include page="../qna/getQna.jsp"/>
									</c:if>
								</c:if>
								
							</div>
						</div>
					</section>
					<!-- end: page -->
				</section>
			</div>

		</section>

		<jsp:include page="/resources/commonScriptAdmin.jsp"/>
		
		<script src="/resources/lib/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
		<script src="/resources/lib/summernote/summernote.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

		<script src="../../../resources/js/servicecenter/qna.js"></script>

	</body>
</html>