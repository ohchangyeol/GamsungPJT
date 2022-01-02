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

<div id="modalBasic" class="modal-block modal-block-primary mfp">
	<section class="panel">
<header class="panel-heading">
<button class="close" data-dismiss="modal">&times;</button>
	</header>
	<div class="panel-body" >
		
	<form action="" class="was-validated">
		<div class="form-group">
			<label for="findIdName" class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
			<div class="col-sm-6">
			<input type="text" class="form-control" id="findIdName" placeholder="이름을 입력하세요." name="name" required>
	</div>
	</div>
		<div class="form-group">
			<label for="findIdPhone" class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
					<div class="col-sm-6">
					<input id="findIdPhone" name="phone" class="form-control " type="text" placeholder="숫자만 입력해주세요" maxlength="11"/>
					</div>
					<button id="findIdPhoneAuthNum" class="btn btn-circle btn-xs" type="button">인증번호 받기</button>
					<div id="findIdCheckPhoneAuth" class="col-sm-offset-3 col-sm-6" style="display:none;">
					<input id="findIdCheckPhoneAuthNum" name ="checkPhoneAuthNum" class="form-control " type="text" placeholder="인증번호를 입력하세요." maxlength="4"/>
					</div>
					<div id="findId-check-phone" class='col-sm-offset-3 col-sm-6'></div>
					<div id="findId-check-phone-auth" class='col-sm-offset-3 col-sm-6'></div>
								</div>
		<div align="right"><button type="submit" class="btn btn-default btn-sm" id="findId">아이디찾기</button></div>
	</form>
		</div>
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
		 
		//휴대폰번호 중복체크
/* 		 $("input[name='phone']").on("keyup" , function() {

			 var regExp = /^[0-9]*$/;
			 var phone=$("#findIdPhone").val();
				    
				$.ajax({
					url : '/user/rest/checkDuplication',
					headers :{
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					method : 'POST',
					dataType:'json',
					data : JSON.stringify({"phone" : phone}),	
					success : function(result) {
						console.log('성공: '+result);
						
						if(result== 0){
							if(email != ""){
								if(!(regExp.test(phone))){
									$("#findIdPhone").val("");
									$("#findId-check-phone").html("휴대폰번호는 숫자로만 입력 가능합니다.");
								}else if(phone.length==11){
									$("#findId-check-phone").html('사용 가능한 번호입니다.');
									$("#findId-check-phone").css('color','green');
								}else if(phone.length>11){
									$("#findIdPhone").val("");
									$("#findId-check-phone").html("휴대폰번호는 11자리만 가능합니다.");
								}else{
									$("#findId-check-phone").html("");
								}
												
						}else{
							$("#findId-check-phone").html('이미 사용중이거나 중복된 휴대폰번호 입니다.');
							$("#findId-check-phone").css('color','red');
						} 
					}
					}
				});
		
			}); */
		
		//휴대폰 인증번호 받기
			$("#findIdPhoneAuthNum").on("click", function() {
				
				$("#findIdPhoneAuthNum").text("인증번호 재발송");
				$("#findId-check-phone").hide();
				$("#findIdCheckPhoneAuth").show();
				//세션에 담긴 값이랑 입력된 값이 맞는지 비교하기 #check-phone-auth
				var phone=$("input[name='phone']").val();
				
				$.ajax({
							url : '/user/rest/sendPhoneAuthNum/'+phone,
							 headers :{
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, 
							method : 'GET',
							//dataType:'json',
							//data : JSON.stringify({"phone" : phone}),	
							success : function(dataa) {
								console.log('성공: '+dataa);
								
								 $("input[name='findIdCheckPhoneAuthNum']").on("keyup", function() {
									 console.log('되는가');
									 var ab=$("input[name='findIdCheckPhoneAuthNum']").val();
									 
									if(ab.length>0){
										if(dataa == ab){
										$("#findId-check-phone-auth").html("인증번호가 일치합니다.");
										}else{
										$("#findId-check-phone-auth").html('인증번호를 확인하세요.');
								}
							}
						});	 
					}
				});
			});
		
	//	$("#modalId").focus();
	$("button:contains(아이디찾기)").on("click" , function() {
		//alert("gkgkgkgk");
/* 		var id=$("input:text").val();
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
		 */
		 
		$("form").attr("method","POST").attr("action","/user/rest/findId").submit();
	});
});
		 	
   
</script>