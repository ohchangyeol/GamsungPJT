<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
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
			<label for="findPwdId" class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
			<div class="col-sm-6">
			<input type="text" class="form-control" id="findPwdId" placeholder="아이디를 입력하세요." name="id" required>
	</div>
	</div>
	<div class="form-group">
			<label for="findPwdName" class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
			<div class="col-sm-6">
			<input type="text" class="form-control" id="findPwdName" placeholder="이름을 입력하세요." name="name" required>
	</div>
	</div>
		<div class="form-group">
			<label for="findPwdPhone" class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
					<div class="col-sm-6">
					<input id="findPwdPhone" name="phone" class="form-control " type="text" placeholder="숫자만 입력해주세요" maxlength="11"/>
					</div>
<!-- 				<button id="findIdPhoneAuthNum" class="btn btn-circle btn-xs" type="button">인증번호 받기</button>
					<div id="findIdCheckPhoneAuth" class="col-sm-offset-3 col-sm-6" style="display:none;">
					<input id="findIdCheckPhoneAuthNum" name ="checkPhoneAuthNum" class="form-control " type="text" placeholder="인증번호를 입력하세요." maxlength="4"/>
					</div>
					<div id="findId-check-phone" class='col-sm-offset-3 col-sm-6'></div>
					<div id="findId-check-phone-auth" class='col-sm-offset-3 col-sm-6'></div> -->
								</div>
		<div align="right"><button type="submit" class="btn btn-default btn-sm" id="findPwd">비밀번호 찾기</button></div>
	</form>
		</div>
	</section>
</div>

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
/* 			$("#findIdPhoneAuthNum").on("click", function() {
				
				$("#findIdPhoneAuthNum").text("인증번호 재발송");
				$("#findId-check-phone").hide();
				$("#findIdCheckPhoneAuth").show();
	
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
			}); */
		
	//	$("#modalId").focus();
	$("#findPwd").on("click" , function() {
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
		 
		//$("form").attr("method","POST").attr("action","/user/rest/findPassword").submit();
	});
});
		 	
   
</script>