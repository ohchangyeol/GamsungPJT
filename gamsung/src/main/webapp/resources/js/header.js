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

	$(document).on('click', '.modal-dismiss', function (e) {
		e.preventDefault();
		$.magnificPopup.close();
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
				} else{
					Swal.fire("가입되지 않은 정보입니다. 다시 확인바랍니다.").then(()=>{
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
		var split = id.split('@');
		var result = split[0].replace(/(?<=.{3})./gi,"*")+"@"+split[1];
		
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
					
					result=id+"로 임시 비밀번호가 발송되었습니다";
					Swal.fire(result).then(()=>{
						self.location = "/";
					});
				} else{
					Swal.fire("가입되지 않은 회원입니다. 회원가입 후 이용바랍니다.").then(()=>{
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
		self.location = "/user/addUser"
	}); 
	
	$("#joinBusinessUser").on("click" , function() {
		self.location = "/user/addBusinessUser"
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

		$.ajax({
			url: '/user/rest/checkIdPassword',
			headers: {
				"Accept": "application/json",
				"Content-Type": "application/json"
			},
			type: 'POST',
			dataType: 'json',
			data: JSON.stringify({ 
				"id": id ,
				"password" : pwd
			}),
			success: function (loginResult) {
				console.log('성공: ' + loginResult);

				if (loginResult == 0) {

					$("form#login-modal-form").attr("method","POST").attr("action","/user/login").submit();

					} else if(loginResult==1){
						Swal.fire({
							text:"가입되지 않았거나 아이디와 비밀번호가 다릅니다. 다시 확인바랍니다.",
							icon: 'error'
					}).then(()=>{
							sdocument.location.href = "/view/user/addGeneralUser.jsp";
						});
					}else if(loginResult==11){
						Swal.fire({
							title: '일반계정으로 전환하시겠습니까?',
							text: "고객님의 ID는 1년이상 로그인하지 않아 휴면계정으로 전환되었습니다. 일반계정으로 변경시 다시 사용하실 수 있습니다.",
							showCancelButton: true,
							confirmButtonColor: '#3085d6',
							cancelButtonColor: '#d33',
							confirmButtonText: '확인',
							cancelButtonText : '취소',
							icon: 'warning',
							width: 600
						}).then((result) => {
							if (result.isConfirmed) {
								$.ajax({
									url: '/user/rest/updateDormantGeneralUserConvert',
									// headers: {
									// 	"Accept": "application/json",
									// 	"Content-Type": "application/json"
									// },
									method: 'POST',
									//dataType: 'json',
									data: ({
										"id": id
									}),
									success: function (result) {
										console.log('성공: ' + result);
		
										if (result == 1) {
											Swal.fire(
												'전환성공!',
												'로그인 후 사용가능합니다.',
												'success'
											).then((result) => {
												document.location.href = "/";
											})
										} else {
											Swal.fire('전환에 실패하였습니다.')
										}
									}
		
		
		
								});
		
							} else {
								document.location.href = "/";
							}
						})
					} else if(loginResult==12){
						Swal.fire({
							text:"탈퇴한 아이디 입니다. 사이트 이용을 원하시면 새로운 아이디로 재가입 후 이용 부탁드립니다.",
							icon: 'error'
					}).then(()=>{
							self.location = "/";
						});
					}else if(loginResult==13){
						Swal.fire({
							text:"이용정지된 아이디입니다.",
							icon: 'error'
					}).then(()=>{
							self.location = "/";
						});
					}else if(loginResult==14){
						Swal.fire({
							text:"아직 회원가입 승인되지 않았습니다. 가입승인후 안내메일이 발송됩니다.",
							icon: 'warning'
					}).then(()=>{
							self.location = "/";
						});
					}		

				
					
			}

		});


		
		//$("form").attr("method","POST").attr("action","/user/login").submit();
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

