<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>공지사항</title>
		
		<jsp:include page="/resources/commonCssAdmin.jsp"/>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

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
						<div class="content-with-menu-container add-notice" data-mailbox data-mailbox-view="compose">
							
							
							
							<div class="inner-body">

								<c:if test="${!empty noticeType}">
									
									<c:if test='${noticeType == "list"}'>
										<div class="inner-body-notice">
											<jsp:include page="../notice/listNotice.jsp"/>

										</div>
									</c:if>
									<c:if test='${noticeType == "add"}'>
										<jsp:include page="../notice/addNotice.jsp"/>
									</c:if>
									<c:if test='${noticeType == "update"}'>
										<jsp:include page="../notice/updateNotice.jsp"/>
									</c:if>
									<c:if test='${noticeType == "get"}'>
										<div class="inner-body-notice">
											<jsp:include page="../notice/getNotice.jsp"/>
										</div>
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


		<script src="../../../resources/js/servicecenter/notice.js"></script>
		<script src="../../../resources/js/servicecenter/noticeFileDropDown.js"></script>

	</body>
</html>