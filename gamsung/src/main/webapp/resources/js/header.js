//============= logout Event =============	
$(document).ready(function(){

	// $("#modalBasic").on("click", ()=>{
	// 	$('#modalBasic').show();
	// })

	$('#header-login').magnificPopup({
		type: 'inline',
		preloader: false,
		focus: '#id'
	});
	
		
	//휴대폰 인증번호 받기
	$("#findIdPhoneAuthNum").on("click", function() {
		
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
				
				$("#findIdCheckPhoneAuthNum").on("keyup", function() {
					console.log('되는가');
					var ab=$("#findIdCheckPhoneAuthNum").val();
					
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
 		var name=$("#findIdName").val();
		var phone=$("#findIdPhone").val();
		
		if(name == null || name.length <1) {
			alert('이름을 입력하지 않으셨습니다.');
			$("#findIdName").focus();
			return;
		}
		
		if(phone == null || phone.length <1) {
			alert('휴대폰번호를 입력하지 않으셨습니다.');
			$("#findIdPhone").focus();
			return;
		}
		
		
 		$.ajax({
			url : '/user/rest/findId',
		/* 	 headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},  */
			method : 'POST',
			//dataType:'json',
			data : {
				"name" :name,
				"phone":phone
			},
			success : function(data) {
				
				console.log('성공: '+data);
				if(data!=null){
					var email=data;
					var split = data.split('@');
					var result = split[0].replace(/(?<=.{3})./gi,"*")+"@"+split[1];
					
					Swal.fire(result).then(()=>{
						self.location = "/";
					});
				} 
			}
		});	   
		 		 
	});

	$("button:contains(비밀번호찾기)").on("click" , function() {
		//alert("gkgkgkgk");
 		var id=$("#findPwdId").val();
		var name=$("#findPwdName").val();
		var phone=$("#findPwdPhone").val();
		
		if(name == null || name.length <1) {
			alert('이름을 입력하지 않으셨습니다.');
			$("#findIdName").focus();
			return;
		}
		
		if(phone == null || phone.length <1) {
			alert('휴대폰번호를 입력하지 않으셨습니다.');
			$("#findIdPhone").focus();
			return;
		}
		
		
 		$.ajax({
			url : '/user/rest/findPassword',
		 	 headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},  
			method : 'POST',
			dataType:'json',
			data : JSON.stringify({
				"id" : id,
				"name" :name,
				"phone":phone
			}),
			success : function(data) {
				
				console.log('성공: '+data);
				if(data==1){
					
					result="아이디로 임시 비밀번호가 발송되었습니다";
					Swal.fire(result).then(()=>{
						self.location = "/";
					});
				} 
			}
		});	   
		 		 
	});

	
	// 로그아웃
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
				
	// $("#id").focus();
	$("#loginBtn").on("click" , function() {
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


	$(".text-right #findId").on("click", function(e) {
		
		// console.log("dddd");
		// console.log($('div#findIdModal'));
		
		//$(".mfp-ready").
		$('#modalBasic').modal('hide');
		//$(this).collapse('hide');
			
		//	$('#findIdModal').modal('show');
			
	}); 

	$("#kakaobtn").on("click", kakaoLogin);

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
	
});// end of jQuery

