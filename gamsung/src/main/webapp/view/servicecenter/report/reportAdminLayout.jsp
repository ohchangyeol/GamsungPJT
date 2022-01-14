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
		<section class="body admin-report">

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
							
							
							
							<div class="inner-body">

								<c:if test="${!empty reportType}">
									
                  <c:if test='${reportType == "list"}'>
                    <jsp:include page="../report/listReport.jsp"/>
                  </c:if>
                  <c:if test='${reportType == "get"}'>
                    <jsp:include page="../report/getReport.jsp"/>
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
    <script src="/resources/lib/magnific-popup/magnific-popup.js"></script>

    <script src="../../../resources/js/servicecenter/report.js"></script>
    

	</body>
</html>