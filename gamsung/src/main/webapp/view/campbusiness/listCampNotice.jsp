<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>

<html lang="ko">

<head>

	<meta charset="utf-8">
	
	<!-- Bootstrap, jQuery CDN -->
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<script src="/resources/lib/jquery/jquery.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
  	<link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css"></link>  	
  	
  	
  	<!-- ### headerCampBusiness resources Start ### -->
  	<script src="/resources/lib/jquery/jquery.js"></script>
    
    <!-- Favicons -->
    <meta name="msapplication-TileImage" content="/resources/images/favicons/ms-icon-144x144.png">    
    <meta name="msapplication-TileColor" content="#ffffff">  
    <meta name="theme-color" content="#ffffff">
   
    <!-- Stylesheets -->
    
    <!-- Default stylesheets-->
    <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template specific stylesheets-->
    <link href="/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="/resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">       
    
    <!-- Main stylesheet and color file-->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="/resources/css/colors/default.css" rel="stylesheet">  
  	<!-- ### headerCampBusiness resources End ### -->
  
  	<style>
	  body {
            padding-top : 50px;
        }
    </style>

	<script type="text/javascript">
	
		$(function() {
				
			$( "td:nth-child(2)" ).on("click" , function() {
				self.location ="/campBusiness/getCampNotice?noticeNo="+$(this).attr("data-noticeNo");
			});
					
			$( "td:nth-child(2)" ).css("color" , "red");
			
			$("#addNoticebtn").on("click" , function() {
				self.location ="/campBusiness/addCampNotice";
			});	
				
		});	
    
	</script>

</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />
   	
   	<!-- Page Start -->
	<div class="container">
	
		
		<div class="page-header text-info">
			<h3>공지사항</h3>
	    </div>
	    
	    <!-- 상단 -->
	    <div class="row">
	        <div class="col-xs-2 ofsform-group">
				<button id="addNoticebtn" type="button" class="btn btn-primary">공지사항 등록</button>
			</div>			    	
	    </div>
	    
		<!-- 하단 -->
		<br>
		<table class="table table-hover table-striped" >
      
			<thead>
				<tr>
            		<th align="left">No</th>       		
            		<th align="left">제목</th>
          			<th align="left">내용</th> 
          			<th align="left">등록일</th> 
				</tr>
       		</thead>
       		
       		<tbody>      		
				<c:set var="i" value="0" />
		  		<c:forEach var="notice" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
			  			<td align="left">${ i }</td>				
			  			<td align="left" id="subSiteName" data-noticeNo="${notice.noticeNo}">${notice.noticeTitle}</td>
          				<td align="left">${notice.noticeContent}</td>
          				<td align="left">${notice.regDate}</td>
					</tr>
          		</c:forEach>
          		
        	</tbody>
      
      </table>
	  
 	</div>
 	

</body>

</html>
	