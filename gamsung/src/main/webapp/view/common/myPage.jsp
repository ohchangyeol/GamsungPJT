<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" href="/resources/images/favicons/favicon.ico" type="image/x-icon" />
		<link rel="icon" href="/resources/images/favicons/favicon.ico" type="image/x-icon" />

		<title>MyPage</title>

		<jsp:include page="/resources/commonLib.jsp"></jsp:include>
		
		<jsp:include page="/resources/commonCssMypage.jsp" />



		<style type="text/css">
			.time {
				display: flex;
			}

			/* .form-group .form-control{
											display:inline-block;
											width: 50%;
										} */
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

			#checkMailAuthNum {
				margin: 14px;
			}

			#get_checkPhoneAuthNum {
				margin: 14px;
			}
		</style>

		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	</head>

	<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
		<main>
			<div class="inner-wrapper">
				<jsp:include page="userSideBar.jsp"></jsp:include>


				<section role="main" class="content-body mypage-body" >
					<jsp:include page="../user/getGeneralUserUpdate.jsp"></jsp:include>
				</section>
			</div>
		</main>
		


		<jsp:include page="/resources/commonScriptMypage.jsp" />
	</body>

</html>