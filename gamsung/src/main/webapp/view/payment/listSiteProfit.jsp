<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="/resources/lib/jquery/jquery.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
  	<link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css"></link>

	<style>
		.container {
			padding-top: 70px;
			padding-right: 15px;
			padding-left: 15px;
			margin-right: auto;
			margin-left: auto;
		}
		
		@media ( min-width : 768px) {
			.container {
				width: 750px;
			}
		}
		
		@media ( min-width : 992px) {
			.container {
				width: 970px;
			}
		}
		
		@media ( min-width : 1200px) {
			.container {
				width: 1170px;
			}
		}
		
		.container-fluid {
			padding-right: 15px;
			padding-left: 15px;
			margin-right: auto;
			margin-left: auto;
		}
	</style>

	<!-- JavaScript -->
	<script type="text/javascript">
	
		
	
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		function uncomma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}		
		
		$(function() {	
			
			$("#charge").on("click" , function() {
				alert("충전 되었습니다.");		
			});
			
			$("#withdraw").on("click" , function() {
				alert("출금 되었습니다.");							
			});
			
			$("#cancle").on("click" , function() {
				alert("취소 되었습니다.");
				window.history.back();			
			});
				
		});			 

	</script>		

</head>

<body>

	<div class="container">	
		
		<div class="row">
			<div class="page-header">
	       		<h1 class=" text-info">캠핑장 검색</h1>
	    	</div>
		</div>
		
		<!-- 상단 -->
		<div class="row">
		
			<div class="col-xs-6">총 &nbsp;&nbsp;#[el.tag조회수]#&nbsp;&nbsp; 캠핑장이 검색되었습니다</div>
			
			<div class="col-xs-2">
				이름순
				<span>&nbsp;오름&nbsp;</span>
				<span>&nbsp;내림&nbsp;</span>
			</div>
			
			<div class="col-xs-2">
				조회순
				<span>&nbsp;오름&nbsp;</span>
				<span>&nbsp;내림&nbsp;</span>
			</div>
			
			<div class="col-xs-2">
				평점순
				<span>&nbsp;오름&nbsp;</span>
				<span>&nbsp;내림&nbsp;</span>
			</div>	
			 
		</div>
		
		<hr>
		
		<!-- 캠핑장 목록 시작-->	
		<c:set var="i" value="0" />
			<c:forEach var="camp" items="${list}">
				<c:set var="i" value="${ i+1 }" />
					<div class="row">
						
						<!-- 캠핑장 이미지 -->
						<div class="col-lg-3">
					      	<div id="charge" style="background-color: #00aaff; width: 200px; height: 200px; border-radius: 10px; display: flex; justify-content: center; align-items: center">
					      	<div style="font-size:30px; color:white">이미지</div></div>				    	
			    		</div>      		
			    		
			    		<!-- 캠핑장 정보 -->
						<div class="col-lg-9">
						
							<div class="row">
								<div class="col-xs-2">캠핑장 이름</div>					
								<div class="col-xs-4"> #[el.tag 캠핑장이름]#</div>
								
								<div class="col-xs-2">등록일자</div>					
								<div class="col-xs-4"> #[el.tag 등록일자]#</div>
							</div>	
							
							<div class="row">
								<br>
								<br>
								<div class="col-xs-2">평점</div>					
								<div class="col-xs-4"> #[el.tag 평점]#</div>
								
								<div class="col-xs-2">조회수</div>					
								<div class="col-xs-4"> #[el.tag 조회수]#</div>
							</div>
							
							<div class="row">
								<br>
								<br>
								<div class="col-xs-2">주소</div>					
								<div class="col-xs-4"> #[el.tag 주소]#</div>
								
								<div class="col-xs-2">전화번호</div>					
								<div class="col-xs-4"> #[el.tag 전화번호]#</div>
							</div>
							
							<div class="row">
								<br>
								<br>
								<div class="col-xs-2">캠핑장 기본정보</div>					
								<div class="col-xs-4"> #[el.tag 기본정보]#</div>			
							</div>	
																	 
					    </div>    	
			    		
					</div>
		</c:forEach>
		<!-- 캠핑장 목록 끝-->	
		
		<hr>
		
 		<!-- PageNavigation -->
 		<div class="row">
			<jsp:include page="../common/pageNavigator.jsp"/>
		</div>
		

</body>

</html>
