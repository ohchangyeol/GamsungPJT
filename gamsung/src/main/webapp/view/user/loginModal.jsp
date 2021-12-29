<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="../../resources/lib/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="../../resources/lib/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="../../resources/lib/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="../../resources/lib/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="../../resources/lib/pnotify/pnotify.custom.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="../../resources/css/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="../../resources/css/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="../../resources/css/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>

<meta charset="UTF-8">
</head>
<body>

<script src="../../resources/lib/jquery/jquery.js"></script>
<script src="../../resources/lib/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="../../resources/lib/bootStrap/js/bootstrap.js"></script>
<script src="../../resources/lib/nanoscroller/nanoscroller.js"></script>
<script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
<script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
<script src="../../resources/lib/pnotify/pnotify.custom.js"></script>
<script src="../../resources/js/theme.js"></script>
<script src="../../resources/js/theme.custom.js"></script>
<script src="../../resources/js/theme.init.js"></script>
<script src="../../resources/js/ui-elements/examples.modals.js"></script>

<div class="mfp-content">
<div id="modalMD" class="modal-block modal-block-md">

<section class="panel">
	<!--  <header class="panel-heading">
	</header> -->
	<div class="panel-body" style="align: center;">
	<form action="" class="was-validated">
	<button class="close" data-dismiss="modal">&times;</button>
		<div class="form-group">
			<label for="userId">아이디 </label>
			<input type="text" class="form-control" id="userId" placeholder="Enter ID" name="userId" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>
		<div class="form-group">
			<label for="userPw">비밀번호 </label>
			<input type="password" class="form-control" id="userPw" placeholder="Enter Password" name="userPw" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>
		<button type="submit" class="btn btn-primary" style="margin-left:50%;">로그인</button>
		<button type="button" class="btn btn-secondary">회원가입</button>
		<img src="../../resources/images/kakao_login_small.png"/>
	</form>
		</div>
			<footer class="panel-footer">
				<div class="row">
					<div class="col-md-12 text-right">
						<button class="btn btn-primary modal-confirm">아이디 찾기</button>
						<button class="btn btn-default modal-dismiss">비밀번호 찾기</button>
					</div>
				</div>
			</footer>
		</section>
	</div>
	</div>

</body>
</html>