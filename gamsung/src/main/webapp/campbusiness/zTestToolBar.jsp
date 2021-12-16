<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<script type="text/javascript">

	$(function() {	
			
		$("#main").on("click" , function() {
			$(self.location).attr("href","/main.jsp");
		}); 		
		
		$("a:contains('캠핑')").on("click" , function() {
			$(self.location).attr("href","/user/addUserView.jsp");
		}); 
			
	 	$("a:contains('캠핑장정보 조회')").on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	
	 	$("a:contains('캠핑장정보 등록')").on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
		 
		$("a:contains('주요시설 목록')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
		
	 	$("a:contains('주요시설 등록')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	
	 	$("a:contains('부가시설 목록')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=manage");
		}); 
	 	
	 	$("a:contains('부가시설 등록')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	
	 	$("a:contains('예약관리')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	
	 	$("a:contains('리뷰관리')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	
	 	$("a:contains('캠핑장 공지사항')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	 		 	
	 	$("a:contains('캠핑장 Q&A')").on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");		
		}); 
	 	
	 	$("a:contains('사이트 고객센터')").on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});	 	
	 	
	 	$("a:contains('포인트 관리')").on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});
	 	
	 	$("a:contains('결제 내역')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	
	 	$("a:contains('내 정보')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});

	 	$("a:contains('로그아웃')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});
	 	
	 	$("a:contains('탈퇴하기')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});
	 	
	 	
	});
		
</script>  
	
<style>
	.navbar.navbar-inverse.navbar-fixed-top {
   		background-color: green;
	}
</style>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" id="main">
			<img src="/images/logo.png" alt="Brand" class="img-rounded" width="100%" align="top"/>
		</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
	    	    

		<div class="collapse navbar-collapse" id="target" 
			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
		<!-- Tool Bar 를 다양하게 사용하면.... -->
		<ul class="nav navbar-nav">
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">캠핑</a></li>
			</ul>
			
			<li class="dropdown">
				<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<span>캠핑장 관리</span>
					<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">캠핑장정보 조회</a></li>
						<li><a href="#">캠핑장정보 등록</a></li>
						<br>
	                    <li><a href="#">주요시설 목록</a></li>
						<li><a href="#">주요시설 등록</a></li>
						<br>
						<li><a href="#">부가시설 목록</a></li>
						<li><a href="#">부가시설 등록</a></li>
					</ul>
			</li>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">예약관리</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">리뷰관리</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">캠핑장 공지사항</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">캠핑장 Q&A</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">사이트 고객센터</a></li>
			</ul>			
	            
			<li class="dropdown">
				<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<span>[캠핑장이름]</span>
					<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">캠핑장 이름</a></li>
						<br>
						<li><a href="#">보유 포인트</a></li>
						<li><a href="#">포인트 관리</a></li>
						<li><a href="#">결제 내역</a></li>
						<br>
						<li><a href="#">내 정보</a></li>
						<br>
						<li><a href="#">로그아웃</a></li>
						<br>						
						<li><a href="#">탈퇴하기</a></li>					
					</ul>
			</li>             
	            
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>

<!-- ToolBar End /////////////////////////////////////-->

<!-- Modal Start	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<div class="modal-dialog modal-dialog-centered" role="document">
    		<div class="modal-content">
      			<div class="modal-header border-bottom-0">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">×</span>
        			</button>
    			</div>
     		 	<div class="modal-body">
        <div class="form-title text-center">
          <span><img alt="loginimg" src="/images/login.png" width="180" height="90" ></span>
          <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
        </div>
       
        <div class="d-flex flex-column text-center">
          	<form>
            	<div class="form-group">
              		<input type="text" class="form-control form-control-color" id="userId" name="userId" placeholder="ID">
            	</div>
            	<div class="form-group">
              		<input type="password" class="form-control" id="password" name="password" placeholder="Password">
            	</div>
           		<button type="button" id="loginButton" class="btn btn-primary btn-block ">Login</button>
          	</form>
           	<div class="modal-footer d-flex justify-content-center">
        		<div class="signup-section"> <a href="#" class="text-info">회원가입</a></div>
      		</div>
        </div>
        
     	 	</div>
    		</div>
  		</div>
	</div>
Modal End -->	

<!--  	
   	function history(){
		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}
	
	function DeveloperWin(){
		alert("저희 비트문고에서는 개발자를 모집하고 있습니다. \n\n연봉은 1억부터 시작합니다.");
		popWin = window.open("http://bftest.wecode.co.kr/","popWin","left=200, top=200, width=1024, height=768, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, location=no, titlebar=no");
	}
	
	
	function Login(){
		$("#userId").focus();

		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#loginButton").on(
				"click",
				function() {
					var id = $("input:text").val();
					var pw = $("input:password").val();

					if (id == null || id.length < 1) {
						alert('ID 를 입력하지 않으셨습니다.');
						$("#userId").focus();
						return;
					}

					if (pw == null || pw.length < 1) {
						alert('패스워드를 입력하지 않으셨습니다.');
						$("#password").focus();
						return;
					}

					$("form").attr("method", "POST").attr("action",
							"/user/login").attr("target", "_parent").submit();
		});
	}
	
	
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2. $(#id) : 3. $(.className)
	$(function() {	
		
		$("a:contains('로그인')").on("click" , function() {			
			$('#loginModal').modal('show');
			
		  	$(function () {
		    	$('[data-toggle="tooltip"]').tooltip()
		  	})
		  	Login();			
	
		});
		
		$( "a:contains('최근 본 상품')" ).on("click" , function() {
	 		history();
		}); 
	 	
	 		 	
	 	$("a:contains('개발자채용')").on("click" , function() {
	 		DeveloperWin(); 			
		}); 
	 	
	 	$( "a:contains('도서요청 결과')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listRequest");
		}); 
	 	
	});
	
-->	

 	
   	
   	
  