<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>회원가입</title>

<link rel="apple-touch-icon" sizes="57x57"
	href="../../resources/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="../../resources/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="../../resources/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="../../resources/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="../../resources/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="../../resources/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="../../resources/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="../../resources/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="../../resources/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="../../resources/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../../resources/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="../../resources/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../../resources/images/favicons/favicon-16x16.png">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="../../resources/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

<link href="../../resources/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="../../resources/lib/animate.css/animate.css"
	rel="stylesheet">
<link
	href="../../resources/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../resources/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link href="../../resources/lib/flexslider/flexslider.css"
	rel="stylesheet">
<link
	href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="../../resources/lib/magnific-popup/magnific-popup.css"
	rel="stylesheet">
<link
	href="../../resources/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="../../resources/css/style.css" rel="stylesheet">
<link id="color-scheme" href="../../resources/css/colors/default.css"
	rel="stylesheet">

<style>

/* .form-group{
		 	display: flex;
		 	flex: 1 auto;
		 } */
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
	margin:14px;
}

#checkPhoneAuthNum{
	margin:14px;
}

</style>

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="main">
			<section class="module bg-dark-30 about-page-header"
				data-background="assets/images/about_bg.jpg">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h1 class="module-title font-alt mb-0">Forms</h1>
						</div>
					</div>
				</div>
			</section>
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2">
							<h4 class="font-alt mb-0">일반회원 회원가입</h4>
							<hr class="divider-w mt-10 mb-20">
							<form class="form" role="form">
								<div id="email" class="form-group">
								<div><input id="role" name="role" value="GENERAL" hidden="hidden"></div>
									<label for="id" class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
									<div class="col-sm-6">
										<input id="id" name="id" class="form-control " type="text" placeholder="아이디는 이메일 형식만 가능합니다." />
									</div>
									<div>
										<button id="mailAuthNum" class="btn btn-circle btn-xs" type="button">인증번호 받기</button>
									</div>
									<div id="checkMailAuth" class="col-sm-offset-3 col-sm-6" style="display:none;">
									<input id="checkMailAuthNum" name="checkMailAuthNum" class="form-control " type="text" placeholder="인증번호를 입력하세요." maxlength="6"/>
									</div>
									<div id="check-email" class='col-sm-offset-3 col-sm-6'></div>
									<div id="check-email-auth" class='col-sm-offset-3 col-sm-6'></div>
								</div>

								<div class="form-group">
									<label for="password"
										class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호</strong></label>
									<div class="col-sm-6">
										<input id="password" name="password" class="form-control "
											type="password" placeholder="비밀번호는 8~15자까지 입력 가능합니다." />
									</div>
								</div>

								<div class="form-group">
									<label for="confirmPassword"
										class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호 재확인</strong></label>
									<div class="col-sm-6">
										<input id="confirmPassword" name="confirmPassword"
											class="form-control" type="password"
											placeholder="비밀번호를 입력해 주세요." />
									</div>
									<div id="check-pwd" class='col-sm-offset-3 col-sm-6'></div>
								</div>

								<div id="nick-name" class="form-group">
									<label for="nickName"
										class="col-sm-offset-1 col-sm-3 control-label"><strong>닉네임</strong></label>
									<div class="col-sm-6">
										<input id="nickName" name="nickName" class="form-control"
											type="text" placeholder="닉네임을 입력해 주세요."/>
									</div>
									<div id="check-nickName" class='col-sm-offset-3 col-sm-6'></div>
								</div>


								<div class="form-group">
									<label for="name"
										class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
									<div class="col-sm-6">
										<input id="name" name="name" class="form-control" type="text"
											placeholder="이름을 입력하세요" />
									</div>
								</div>

								<div class="form-group">
									<label for="phone"
										class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대폰번호</strong></label>
									<div class="col-sm-6">
										<input id="phone" name="phone" class="form-control " type="text" placeholder="숫자만 입력해주세요" maxlength="11"/>
											
									</div>
									<button id="phoneAuthNum" class="btn btn-circle btn-xs" type="button">인증번호 받기</button>
									<div id="checkPhoneAuth" class="col-sm-offset-3 col-sm-6" style="display:none;">
									<input id="checkPhoneAuthNum" name ="checkPhoneAuthNum" class="form-control " type="text" placeholder="인증번호를 입력하세요." maxlength="4"/>
									</div>
									<div id="check-phone" class='col-sm-offset-3 col-sm-6'></div>
									<div id="check-phone-auth" class='col-sm-offset-3 col-sm-6'></div>
								</div>

								<div class="form-group">
									<label for="addr"
										class="col-sm-offset-1 col-sm-3 control-label"><strong>주소</strong></label>
									<div class="col-sm-6">
										<input id="addr" name="addr" class="form-control" type="text"
											placeholder="주소를 입력하세요." />
									</div>
								</div>

								<div class="form-group">
									<label for="userAddr"
										class="col-sm-offset-1 col-sm-3 control-label"></label>
									<div class="col-sm-6">
										<input id="userAddr" name="userAddr" class="form-control"
											type="text" placeholder="상세주소를 입력하세요." /> <input
											type="hidden" name="allAddr" />
									</div>
								</div>
							</form>

						</div>
					</div>

						<br/>
					<div class="col-sm-3 col-sm-offset-2"></div>
					<div class="col-sm-3 col-sm-offset-2">
						<div class="row">
							<button id="cancel" class="btn btn-border-d btn-circle"
								type="button">취소</button>
							<button id="joinAddUser" class="btn btn-border-d btn-circle"
								type="submit">가입하기</button>

						</div>
					</div>
				</div>
			</section>
		</div>
	</main>


	<script src="../../resources/lib/jquery/jquery.js"></script>
	<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resources/lib/wow/wow.js"></script>
	<script
		src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
	<script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../../resources/lib/smoothscroll.js"></script>
	<script
		src="../../resources/lib/magnific-popup/jquery.magnific-popup.js"></script>
	<script
		src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../../resources/js/plugins.js"></script>
	<script src="../../resources/js/main.js"></script>

	<script>
	
	$(function(){
		
		//아이디 유효성 및 중복체크
		 $("input[name='id']").on("keyup", function() {
			// console.log("가나다");
		 var email = $("#id").val();
		    console.log(email);
		    console.log(email);
			$.ajax({
				url : '/user/rest/checkDuplication',
				headers :{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				method : 'POST',
				dataType:'json',
				data : JSON.stringify({"id" : email}),	
				success : function(result) {

					console.log('성공: '+result);

					if(result== 0){
						if(email != ""){
							if(email.indexOf('@') < 1 || email.indexOf('.') == -1 ){
								$("#check-email").html("Email형식이 아닙니다.");
							}else{
								$("#check-email").html('사용 가능한 아이디입니다.');
								$("#check-email").css('color','green');
							}
						}else{
							$("#check-email").html("");
						}
						
					}else{
						$("#check-email").html('이미 사용중이거나 중복된 아이디 입니다.');
						$("#check-email").css('color','red');
					} 
					
				} /* ,error :  function(request,status,error){// 에러발생시 실행할 함수
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}*/
			});
		});
			 
		//이메일 인증번호 받기
		$("#mailAuthNum").on("click", function() {
			
			var id = $("#id").val();
		
			if(id != (id.indexOf('@') < 1 || id.indexOf('.') == -1)){

				//$("#mailAuthNum").hide();
				$("#mailAuthNum").text("인증번호 재발송");
				$("#check-email").html("");
				$("#checkMailAuth").show();
				//$("#reMailAuth").show();

					$.ajax({
						url : '/user/rest/sendEmailAuthNum/'+id,
						headers :{
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						method : 'GET',
						//dataType:'json',
						//data : JSON.stringify(data),	
						success : function(data) {
							//console.log(JSON.stringify(data));
							console.log('성공: '+data);
							//console.log('성공: '+data.id);
							
						 $("input[name='checkMailAuthNum']").on("keyup", function() {
							 console.log('되는가');
							 var aa=$("input[name='checkMailAuthNum']").val();
							 
							if(aa.length>0){
								if(data=== aa){
										$("#check-email-auth").html("인증번호가 일치합니다.");
									}else{
										$("#check-email-auth").html('인증번호를 확인하세요.');
								}
							}else{
								$("#check-email-auth").html("");
							}
						});	 
					}
				});						
			}
		});
		
	   //비밀번호 확인
		$('#confirmPassword').on("keyup",function(){

			
			 if($('#confirmPassword').val().length<0){
					$("#check-pwd").html("");
				}else if($('#password').val() != $('#confirmPassword').val()||$('#confirmPassword').val()!=''){
					$("#check-pwd").html('비밀번호가 일치하지 않습니다.');
					$("#check-pwd").css('color','red');
				    $('#confirmPassword').focus();
				}
			 if($('#password').val() == $('#confirmPassword').val()){
					$("#check-pwd").html('비밀번호가 일치합니다.');
					$("#check-pwd").css('color','green');
				}
		});
	
	//닉네임 중복체크
	 $("input[name='nickName']").on("keyup" , function() {

		 var nickName=$("input[name='nickName']").val();
			    
			$.ajax({
				url : '/user/rest/checkDuplication',
				headers :{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				method : 'POST',
				dataType:'json',
				data : JSON.stringify({"nickName" : nickName}),	
				success : function(result) {
					console.log('성공: '+result);
					if(result== 0){
						if(nickName.length>2){
							$("#check-nickName").html('사용 가능한 닉네임입니다.');
							$("#check-nickName").css('color','green');
						}else{
							$("#check-nickName").html("");
						}
					}else{
						$("#check-nickName").html('이미 사용중이거나 중복된 닉네임 입니다.');
						$("#check-nickName").css('color','red');
					} 
				}
			});
	
		});
		
	//휴대폰번호 중복체크
	 $("input[name='phone']").on("keyup" , function() {

		 var regExp = /^[0-9]*$/;
		 var phone=$("input[name='phone']").val();
			    
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
								$("#phone").val("");
								$("#check-phone").html("휴대폰번호는 숫자로만 입력 가능합니다.");
							}else if(phone.length==11){
								$("#check-phone").html('사용 가능한 번호입니다.');
								$("#check-phone").css('color','green');
							}else if(phone.length>11){
								$("#phone").val("");
								$("#check-phone").html("휴대폰번호는 11자리만 가능합니다.");
							}else{
								$("#check-phone").html("");
							}
											
					}else{
						$("#check-phone").html('이미 사용중이거나 중복된 휴대폰번호 입니다.');
						$("#check-phone").css('color','red');
					} 
				}
				}
			});
	
		});
	
	//휴대폰 인증번호 받기
		$("#phoneAuthNum").on("click", function() {
			
			$("#phoneAuthNum").text("인증번호 재발송");
			$("#check-phone").hide();
			$("#checkPhoneAuth").show();
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
							
							 $("input[name='checkPhoneAuthNum']").on("keyup", function() {
								 console.log('되는가');
								 var ab=$("input[name='checkPhoneAuthNum']").val();
								 
								if(ab.length>0){
									if(dataa == ab){
									$("#check-phone-auth").html("인증번호가 일치합니다.");
									}else{
									$("#check-phone-auth").html('인증번호를 확인하세요.');
							}
						}
					});	 
				}
			});
		});
	
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "#joinAddUser" ).on("click" , function() {
			//console.log("뭐지");
			fncAddUser();
		});
	 
	 function fncAddUser() {
			
			//var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='confirmPassword']").val();
			var name=$("input[name='name']").val();
			var nickName=$("input[name='nickName']").val();
			var phone=$("input[name='phone']").val();
			
			
			/* if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			} *
			
			if(password == null || password.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(7<password.length <16){
				alert("패스워드는 8~15자까지 가능합니다.");
				return;
			}
			
			if(confirmPassword == null || confirmPassword.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( password != confirmPassword ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='confirmPassword']").focus();
				return;
			}
			
			if(nickName == null || nickName.length <1){
				alert("닉네임은 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(phone == null || phone.length <1){
				alert("휴대폰번호는 반드시 입력하셔야 합니다.");
				return;
			}*/
				
			var addr = "";	
			if( $("input:text[name='addr']").val() != ""  &&  $("input:text[name='userAddr']").val() != "") {
				var value =  $("input[name='addr']").val() + "" 
							+ $("input[name='userAddr']").val();
			}

			$("input:hidden[name='allAddr']").val( value );
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}		

		
		//주소검색
	    document.getElementById("addr").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("addr").value = data.address; // 주소 넣기
	                document.querySelector("input[name=userAddr]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	});
			
	</script>
</body>
</html>