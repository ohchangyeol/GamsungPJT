<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	$(function () {
		
		let campNo = $("#campNo").val();
	
		$("#main").on("click", function () {
			$(self.location).attr("href", "/main.jsp");
		});
		
		$("a:contains('캠핑장정보 조회')").on("click", function () {		
			$("form[id=headhidden]").attr("method", "GET").attr("action", "/campBusiness/getCamp").submit();
		});
				
		$("a:contains('주요시설 목록')").on("click", function () {
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
	 		window.self.location = "/campBusiness/goSubMainCampBusiness";
		}); 
	 	
	 	$("a:contains('리뷰관리')" ).on("click" , function() {		
			window.self.location = "/campGeneral/listBusinessCampRatingReview?campNo="+campNo;
		});
	 	
		$("a:contains('캠핑장 Q&A')").on("click", function () {
			$("form[id=headhidden]").attr("method", "POST").attr("action", "/campBusiness/listCampQna").submit();
		});
	 					
		$("a:contains('캠핑장 공지사항')").on("click", function () {
			$("form[id=headhidden]").attr("method", "POST").attr("action", "/campBusiness/listCampNotice").submit();
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

				<li class="dropdown"><a class="dropdown-toggle" href="/campBusiness/goSubMainCampBusiness" data-toggle="dropdown">캠핑장 관리</a>
					<ul class="dropdown-menu">
						<c:if test="${campSession.campTempSave == '3' || campSession.user.role == 'ADMIN'}">
							<li><a href="#">캠핑장정보 조회</a></li>
							<li><br></li>
							<li><a href="#">주요시설 목록</a></li>
							<li><a href="/campBusiness/addMainSiteView">주요시설 등록</a></li>
							<li><br></li>
							<li><a href="#">부가시설 목록</a></li>
							<li><a href="/campBusiness/addSubSiteView">부가시설 등록</a></li>
						</c:if>
						
						<c:if test="${campSession.campTempSave != '3'}">
							<c:if test="${campSession.user.role != 'ADMIN'}">
								<li><a href="/campBusiness/addCampView">캠핑장정보 등록</a></li>
							</c:if>
						</c:if>
					</ul>
				</li>
				
				<c:if test="${campSession.campTempSave == '3' || campSession.user.role == 'ADMIN'}">

				<li class="dropdown">	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">예약관리</a></li>
					</ul>
				</li>
				
				<li class="dropdown">	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">리뷰관리</a></li>
					</ul>
				</li>
				
				<li class="dropdown">	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">캠핑장 Q&A</a></li>
					</ul>
				</li>
				
				<li class="dropdown">	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">캠핑장 공지사항</a></li>
					</ul>
				</li>
				
				</c:if>
				
				<li class="dropdown">
					<a class="dropdown-toggle" href="/servicecenter/home" data-toggle="dropdown">
						사이트 고객센터
					</a>
					<ul class="dropdown-menu">
						<li><a href="/servicecenter/listNotice">공지사항</a></li>
						<li><a href="/servicecenter/listQna"> Q&A </a></li>
						<li><a href="/servicecenter/listReport/my">내 신고 내역</a></li>
					</ul>
				</li>
				
				<li class="dropdown"><a class="dropdown-toggle" href="/campBusiness/goSubMainCampBusiness" data-toggle="dropdown">${campSession.user.campName} [사업자]</a>
					<ul class="dropdown-menu">
						<li>
							<p>보유 포인트</p>
							<p style="padding-bottom: 10px; border-bottom: 1px #ddd solid;">
								<span id="havingPoint" class="main-color" style="font-weight: 700;">${user.havingPoint}</span>p
							</p>
						</li>
						
						<li>
							<a href="/payment/listPayment" style="border-bottom: none !important;">
								<i class="fa fa-money" aria-hidden="true"></i>&nbsp;결제 내역
							</a>
						</li>
										
						<li>
							<a href="/payment/managePoint" style="border-bottom: none !important;">
								<i class="fa fa-money" aria-hidden="true"></i>&nbsp;포인트 관리
							</a>
						</li>
						
						<li>
							<a href="../view/user/getBusinessUserUpdate.jsp" style="border-bottom: none !important;">
								<i class="bi bi-person-circle"></i>&nbsp;내정보
							</a>
						</li>
																	
						<li>
							<a href="/user/logout" style="border-bottom: none !important;">
								<button	class="btn btn-border-w btn-round btn-xs" type="button"	id="logout">LOGOUT</button>
							</a>
						</li>
					</ul>
				</li>

			</ul>
		</div>
	</div>
</nav>