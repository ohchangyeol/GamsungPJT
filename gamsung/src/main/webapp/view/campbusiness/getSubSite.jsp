<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- Bootstrap, jQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
	<!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!-- CSS -->
	<style>
		body > div.container{
			margin-top: 70px;
		}
    </style>

	<!-- JavaScript -->
	<script type="text/javascript">

		// 버튼
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#confirm").on("click" , function() {
				alert("1");
				$("form").attr("method" , "get").attr("action" , "/campBusiness/listSubSite").submit();
			});
			
			$("#update").on("click" , function() {
				alert("2");
				$("form").attr("method" , "get").attr("action" , "/campBusiness/updateSubSite").submit();
			});
			
			$("#delete").on("click" , function() {
				alert("3");
				$("form").attr("method" , "get").attr("action" , "/campBusiness/deleteSubSite").submit();
			});
		
		});	

</script>		
	    
</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/campbusiness/campBusinessToolbar.jsp" />

	<!-- Page Start -->
	<div class="container">	
	
		<div class="page-header">
	       <h3 class=" text-info">주요시설 상세정보</h3>
	    </div>
	    	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>부가시설 등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${subSite.subSiteRegDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>부가시설 유형</strong></div>
			<div class="col-xs-8 col-md-4">${subSite.subSiteType}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>부가시설 이름</strong></div>
			<div class="col-xs-8 col-md-4">${subSite.subSiteName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>부가시설 설명</strong></div>
			<div class="col-xs-8 col-md-4">${subSite.subSiteInfo}</div>
		</div>
		
		<hr/>
		
		<!-- 	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>부가시설 사진</strong></div>
			<img src="/uploadFiles/campimg/campbusiness/subSite/${subSite.subSiteImg}" />
		</div>
		-->
		 							  		  
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button id="delete" type="button" class="btn btn-primary">삭제</button>
				<button id="update"type="button" class="btn btn-primary">수정</button>
				<button id="confirm" type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
		  	
 	</div>

</body>

</html>