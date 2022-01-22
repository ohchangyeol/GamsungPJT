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
				self.location ="/campBusiness/getCampQna?qnaNo="+$(this).attr("data-qnaNo");
			});
					
			$( "td:nth-child(2)" ).css("color" , "red");
			
			$("#addQnabtn").on("click" , function() {
				self.location ="/campBusiness/addCampQnaQuestion?campNo="+$("#campNo").val();
			});	
				
			
		});	
		
	
	</script>
	
</head>

<body id="qnaschange" data-spy="scroll" data-target=".onpage-navigation" data-offset="60" style="overflow: hidden; width: 100%; height: 100%;" >

	<!-- ToolBar -->
		
	<c:if test="${user.role == 'BUSINESS' }">
		<jsp:include page="/view/common/headerCampBusiness.jsp" />	  	
	</c:if>
	
	<c:if test="${user.role == 'GENERAL' && empty campNo}">
		<jsp:forward page="../campbusiness/listUserCampQna.jsp"/>
		<jsp:include page="/view/common/header.jsp" />	

	</c:if>
	   	
   	<!-- Page Start -->
	<div class="container">
	
		<c:if test="${user.role == 'BUSINESS' }">
			<div class="page-header text-info">
				<h3>Q&A</h3>
		    </div>
	    </c:if>
	    
	    <!-- 상단 -->
	    <div class="row">
	       	<c:if test="${user.role == 'GENERAL' && campNo != '0' }">
		        <div class="col-xs-2 ofsform-group">
					<button id="addQnabtn" type="button" class="btn btn-primary">질문등록</button>
					<input type="hidden" name="campNo" id="campNo" value="${campNo}">
				</div>	
			</c:if>
	    </div>
	    
		<!-- 하단 -->
		<br>
		<table class="table table-hover table-striped" >
      
			<thead>
				<tr>
            		<th align="left">No</th>       		
            		<th align="left">제목</th>
          			<th align="left">내용</th> 
          			<th align="left">질문등록일</th>
          			<th align="left">답변</th>
          			<th align="left">답변등록일</th>         			
				</tr>
       		</thead>
       		
       		<tbody>      		
				<c:set var="i" value="0" />
		  		<c:forEach var="qna" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
			  			<td align="left">${ i }</td>				
			  			<td align="left" id="subSiteName" data-qnaNo="${qna.qnaNo}">${qna.questionTitle}</td>
          				<td align="left">${qna.questionContent}</td>
          				<td align="left">${qna.questionRegDate}</td>
          				<td align="left">
          				<c:choose>
          					<c:when test="${ !empty qna.answerContent}">
          						Y
          					</c:when>
          					<c:otherwise>
          						N
          					</c:otherwise>
          				</c:choose>
          				</td>
          				<td align="left">
          				<c:choose>
          					<c:when test="${ !empty qna.answerRegDate}">
								${qna.answerRegDate}
							</c:when>
          					<c:otherwise>
          					</c:otherwise>
          				</c:choose>
          				</td>
					</tr>
          		</c:forEach>
          		
        	</tbody>
      
      </table>
	  
 	</div>

	<script type="text/javascript">
		parent.qnaIframeHeight(document.getElementById("qnaschange").scrollHeight);
	</script>
 	
</body>

</html>
	