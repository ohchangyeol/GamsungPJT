<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
 
 	<!-- Bootstrap, jQuery CDN -->
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<script src="/resources/lib/jquery/jquery.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
  	       
    <!-- Default stylesheets-->
    <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        
    <!-- Main stylesheet and color file-->
    <link href="/resources/css/style.css" rel="stylesheet">    
    <link href="/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="/resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet"> 
	
  </head>

  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" class="qna" data-userid ="${user.id}" data-qnatype="${qnaType}">

	<div class="container">
	
		<div class="row">
			<div class="col-xs-2 sub-title">
				<h4>전체 Q&A </h4>
				<sub>${wrapper.totalCount}건</sub>				
			</div>
			<div class="col-xs-1 col-xs-offset-8">
	            <button id="confirm" type="button" class="btn btn-primary">질문등록</button>
		    </div>
		</div>
		
		<hr class="divider-w mt-10 mb-20">
		
		<div class="row" style="text-align:center;">			
		
			<c:forEach var ="qna" items="${wrapper.qnas}">
   			<c:set var="count" value="${count + 1}" />
				
				<div style="display: inline-block; vertical-align:middle; width:450px; height:125px; margin:10px;">
					
					<div class="row" style="text-align:left;border: 1px solid gray;margin: 5px;">
					<div class="col-xs-12 control-label"><strong>Q : ${qna.questionTitle}</strong></div>
						<br>
						<div class="col-xs-12" style="padding-top: 10px;">${qna.questionContent}</div>
					</div>
					
						<div class="row" style="text-align:left;border: 1px solid gray;margin: 5px;">
							<div class="col-xs-12 control-label"><strong>A : 네 고객님</strong></div>
							<br>
							<div class="col-xs-12" style="padding-top: 10px;">원래 그래요</div>
						</div>
			
				</div>
				
			</c:forEach>  				  	
		</div>
		
		<div class="row">
			<jsp:include page="../common/pageNavigator.jsp"/>
		</div>
	        
	</div>
    
    <script src="../../../resources/js/servicecenter/qna.js"></script>
    
  </body>
</html>