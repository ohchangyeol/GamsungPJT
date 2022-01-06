<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<script type="text/javascript">

	$(function() {	
			
		$("#main").on("click" , function() {
			$(self.location).attr("href","/main.jsp");
		}); 		
				
	 	$("a:contains('캠핑장정보 조회')").on("click" , function() {
	 		
	 		var role = $("input[name='role']").val(); 		
	 		
	 		if( role == 'BUSINESS') {
	 			$("form[id=headhidden]").attr("method", "GET").attr("action", "/campBusiness/getCamp").submit();
	 		}
	 		
	 		if( role == 'ADMIN') {
	 			$("form[id=headhidden]").attr("method", "POST").attr("action", "/campBusiness/listCamp").submit();
	 		}
	 		
		}); 
	
	 	$("a:contains('캠핑장정보 등록')").on("click" , function() {
	 		window.self.location = "/campBusiness/addCampView";
		}); 
		 
		$("a:contains('주요시설 목록')" ).on("click" , function() {
			$("form[id=headhidden]").attr("method", "POST").attr("action", "/campBusiness/listMainSite").submit();
		});
		
	 	$("a:contains('주요시설 등록')" ).on("click" , function() {
	 		window.self.location = "/campBusiness/addMainSiteView";
		}); 
	 	
	 	$("a:contains('부가시설 목록')" ).on("click" , function() {
	 		$("form[id=headhidden]").attr("method", "POST").attr("action", "/campBusiness/listSubSite").submit();
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
       		window.self.location = "/payment/managePoint";
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


<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
  <div class="container">
  
  	<form id="headhidden">
		<input type="hidden" name="role" id="role" value="${campSession.user.role}">
		<input type="hidden" name="campNo" id="campNo" value="${campSession.campNo}">
		<input type="hidden" name="campTempSave" id="campTempSave" value="${campSession.campTempSave}">			
	</form> 
  
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="/">Gamsung</a>
    </div>
    
    
    <div class="collapse navbar-collapse" id="custom-collapse">
      <ul class="nav navbar-nav navbar-right">
      
      	<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">${campSession.user.campName}</a>	
				<ul class="dropdown-menu">
					<br>
					<li><a href="#">보유 포인트 - ${campSession.user.havingPoint} (P)</a></li>
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
		</ul>
      
      	<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">캠핑장 관리</a>
          <ul class="dropdown-menu">
			<c:if test="${campSession.campTempSave == '3' || campSession.user.role == 'ADMIN'}">
				<li><a href="#">캠핑장정보 조회</a></li>
			    <li><br></li>
			    <li><a href="#">주요시설 목록</a></li>
			    <li><a href="#">주요시설 등록</a></li>
				<li><br></li>
				<li><a href="#">부가시설 목록</a></li>
				<li><a href="#">부가시설 등록</a></li>
			</c:if>
						
			<c:if test="${campSession.campTempSave != '3'}">	
				<c:if test="${campSession.user.role != 'ADMIN'}">	
					<li><a href="#">캠핑장정보 등록</a></li>
				</c:if>
			</c:if>
          </ul>
        </li>
                
        <c:if test="${campSession.campTempSave == '3' || campSession.user.role == 'ADMIN'}">			
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">사이트 고객센터</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">캠핑장 공지사항</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">캠핑장 Q&A</a></li>		
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
  	
</nav>


