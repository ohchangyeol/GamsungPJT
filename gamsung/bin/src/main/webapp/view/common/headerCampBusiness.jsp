<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<script type="text/javascript">

	$(function() {	
			
		$("#main").on("click" , function() {
			$(self.location).attr("href","/main.jsp");
		}); 		
				
	 	$("a:contains('캠핑장정보 조회')").on("click" , function() {
	 		
	 		var role = $("input[name='role']").val();
	 		
	 		if( role == 'BUSINESS') {
	 			$("form[id=navhidden]").attr("method", "GET").attr("action", "/campBusiness/getCamp").submit();
	 		}
	 		
	 		if( role == 'ADMIN') {
	 			$("form[id=navhidden]").attr("method", "POST").attr("action", "/campBusiness/listCamp").submit();
	 		}
	 		
		}); 
	
	 	$("a:contains('캠핑장정보 등록')").on("click" , function() {
	 		window.self.location = "/campBusiness/addCampView";
		}); 
		 
		$("a:contains('주요시설 목록')" ).on("click" , function() {
			$("form[id=navhidden]").attr("method", "POST").attr("action", "/campBusiness/listMainSite").submit();
		});
		
	 	$("a:contains('주요시설 등록')" ).on("click" , function() {
	 		window.self.location = "/campBusiness/addMainSiteView";
		}); 
	 	
	 	$("a:contains('부가시설 목록')" ).on("click" , function() {
	 		$("form[id=navhidden]").attr("method", "POST").attr("action", "/campBusiness/listSubSite").submit();
		}); 
	 	
	 	$("a:contains('부가시설 등록')" ).on("click" , function() {
	 		window.self.location = "/campBusiness/addSubSiteView";
		}); 
	 	
	 	$("a:contains('예약관리')" ).on("click" , function() {
	 		
		}); 
	 	
	 	$("a:contains('리뷰관리')" ).on("click" , function() {
	 		
		}); 
	 	
	 	$("a:contains('캠핑장 공지사항')" ).on("click" , function() {

	    }); 
              
       	$("a:contains('캠핑장 Q&A')").on("click" , function() {
          
     	});
       
     	$("a:contains('캠핑')").on("click" , function() {

     	}); 
          
       	$("a:contains('사이트 고객센터')").on("click" , function() {
          
      	});       
       
       	$("a:contains('포인트 관리')").on("click" , function() {

      	});
       
       	$("a:contains('결제 내역')" ).on("click" , function() {
       
      	}); 
       
       	$("a:contains('내 정보')" ).on("click" , function() {

      	});

       	$("a:contains('로그아웃')" ).on("click" , function() {

      	});
       
       	$("a:contains('탈퇴하기')" ).on("click" , function() {
       
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

		<a class="navbar-brand" id="main"> <img src="/images/logo.png"
			alt="Logo" class="img-rounded" width="100%" align="top" />
		</a>

		<!-- toolBar Button Start -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#target">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>


		<!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target" data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
		

			<ul class="nav navbar-nav">
			<form id ="navhidden">	
				<input type="hidden" name="campNo" value="${campSession.campNo}">
				<input type="hidden" name="campTempSave" value="${campSession.campTempSave}">	
				<input type="hidden" name="role" value="${campSession.user.role}">	
			</form>
	
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>${campSession.user.campName}</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" style="right: 0;">
						<li><a href="#">${campSession.user.campName}</a></li>
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
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>캠핑장
							관리</span> <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<c:if test="${ empty campSession.campTempSave || campSession.campTempSave == '3' }">	
					 		<li><a href="#">캠핑장정보 조회</a></li>
					 		<br>
					 		<li><a href="#">주요시설 목록</a></li>
							<li><a href="#">주요시설 등록</a></li>
							<br>
							<li><a href="#">부가시설 목록</a></li>
							<li><a href="#">부가시설 등록</a></li>
						</c:if>			
						
					 	<c:if test="${ empty campSession.campTempSave || campSession.campTempSave != '3' }">	
					 		<c:if test="${ empty campSession.user.role || campSession.user.role != 'ADMIN' }">	
								<li><a href="#">캠핑장정보 등록</a></li>
							</c:if>
						</c:if>				
						
					</ul></li>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">사이트 고객센터</a></li>
				</ul>

				<c:if test="${ empty campSession.campTempSave || campSession.campTempSave == '3' }">	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">캠핑</a></li>
					</ul>
	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">캠핑장 Q&A</a></li>
					</ul>
	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">캠핑장 공지사항</a></li>
					</ul>
	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">리뷰관리</a></li>
					</ul>
	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">예약관리</a></li>
					</ul>
				</c:if>
				
		 	</ul>
		
		</div>

	</div>
</div>