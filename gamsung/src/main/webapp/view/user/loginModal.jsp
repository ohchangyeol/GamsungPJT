<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div id="modalBasic" class="modal-block modal-block-primary mfp mfp-hide">
	<section class="panel">
<header class="panel-heading">
<button type="button" class="close" data-dismiss="modal">&times;</button>
	</header>
	<div class="panel-body" >
		
	<form action="" class="was-validated">
		<div class="form-group">
		<div class="col-sm-2"></div>
			<div><label for="modalId">아이디 </label></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-8"><input type="text" class="form-control" id="modalId" placeholder="아이디를 입력하세요." name="id" required></div>
		</div>
		<div class="form-group">
		<div class="col-sm-2"></div>
			<div><label for="pwd">비밀번호 </label></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-8"><input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="password" required></div>

		</div>
		<div class="col-sm-3"></div>
		<div class="col-sm-6"><button type="submit" class="btn-info btn-round btn-block">로그인</button></div>
		<br/><br/>
		<div align="center"><a href="javascript:kakaoLogin();"><img src="../../resources/images/kakaolink_btn_small.png"/></a>
		<button type="submit" class="btn btn-g btn-round" id="joinUser"><i class="fa fa-smile-o"></i>회원가입</button>
		<button type="submit" class="btn btn-g btn-round" id="joinBusinessUser"><i class="fa fa-smile-o"></i>사업자 회원가입</button></div>
		
	</form>
		</div>
			<footer class="panel-footer">
				<div class="row">
					<div class="col-md-12 text-right">
						<button class="btn btn-default btn-sm">아이디 찾기</button>
						<button class="btn btn-default btn-sm">비밀번호 찾기</button>
					</div>
				</div>
			</footer>
		</section>
</div>


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
<script type="text/javascript">
    //============= logout Event =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#logout").on("click" , function() {
		 		//$(self.location).attr("href","/user/logout");
				self.location = "/user/logout"
			}); 
			
		 	$("#joinUser").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
			self.location = "/view/user/addGeneralUser.jsp"
		}); 
		 	
			$("#joinBusinessUser").on("click" , function() {
			self.location = "/view/user/addBusinessUser.jsp"
		}); 
			
			$("#id").focus();
		$("button:contains(로그인)").on("click" , function() {
			//alert("gkgkgkgk");
			var id=$("input:text").val();
			var pwd=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#id").focus();
				return;
			}
			
			if(pwd == null || pwd.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#pwd").focus();
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/login").submit();
		});
		});

		//카카오로그인
		function kakaoLogin() {

		$.ajax({
		    url: '/user/getKakaoAuthUrl',
		    type: 'get',
		    async: false,
		    dataType: 'text',
		    success: function (res) {
		        location.href = res;
		    }
		});

		}

		$(document).ready(function() {

		  var kakaoInfo = '${kakaoInfo}';

		  if(kakaoInfo != ""){
		      var data = JSON.parse(kakaoInfo);

		      alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
		      alert(
		      "user : \n" + "email : "
		      + data['email']  
		      + "\n nickname : " 
		      + data['nickname']);
		  }
		});  
		 	
   
</script> 