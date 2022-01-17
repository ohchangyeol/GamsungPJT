<%@ page contentType="text/html; charset=utf-8" %>
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
	
	<!-- CSS -->
	<style>
	    body > div.container{
	        margin-top: 30px;
	    }
	    
	    .form-horizontal .control-label{
	        text-align: left;
	    }
	
	</style>

	<!-- JavaScript -->
	<script type="text/javascript">

		// 버튼
		$(function() {
			$("#confirm").on("click" , function() {
				window.history.back();
			});
			
			$("#saveAnswerContent").on("click" , function() {
				alert("답변이 등록 되었습니다.");
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/addCampQnaAnswer").submit();
			});
		
		});	

</script>		

</head>

<body id="qnaschange" data-spy="scroll" data-target=".onpage-navigation" data-offset="60" style="overflow: hidden; width: 100%; height: 100%;" >

	<!-- ToolBar -->
	<c:if test="${user.role == 'BUSINESS' }">
		<jsp:include page="/view/common/headerCampBusiness.jsp" />
	</c:if>
	
	<!-- Page Start -->
	<div class="container">
	
		<c:if test="${user.role == 'BUSINESS' }">
			<div class="page-header">
		       <h1 class=" text-info">QnA</h1>
		    </div>
	    </c:if>

		<!-- Form Start -->
		<form class="form-horizontal" >
	
		<div class="row">
			
			<input type="hidden" name="campNo" id="campNo" value="${qna.campNo}">
			<input type="hidden" name="sender.id" id="sender.id" value="${sender.id}">
			
			<div class="form-group">
				<label for="qnaNo" class="col-sm-offset-1 col-sm-3 control-label">질문등록번호</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="qnaNo" name="qnaNo" value="${qna.qnaNo}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="questionRegDate" class="col-sm-offset-1 col-sm-3 control-label">질문등록일</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="questionRegDate" name="questionRegDate" value="${qna.questionRegDate}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="sender.id" class="col-sm-offset-1 col-sm-3 control-label">질문등록ID</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="sender.id" name="sender.id" value="${qna.sender.id}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="questionTitle" class="col-sm-offset-1 col-sm-3 control-label">질문제목</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="questionTitle" name="questionTitle" value="${qna.questionTitle}" readonly>
					</div>
			</div>
				
			<div class="form-group">
				<label for="questionContent" class="col-sm-offset-1 col-sm-3 control-label">질문내용</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="questionContent" name="questionContent" value="${qna.questionContent}" readonly>
					</div>
			</div>
			
			<c:if test="${ !empty qna.answerContent && user.role != 'BUSINESS'}">
			<br>
				<div class="form-group">
					<label for="answerContentuser" class="col-sm-offset-1 col-sm-3 control-label">답변내용</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="answerContentuser" name="answerContentuser" value="${qna.answerContent}" disabled>
						</div>
				</div>
			</c:if>	
			
			
			<c:if test="${user.role != 'BUSINESS' }">
			<br>
			    <div class="form-group">      	        
			        <div class="col-xs-1 col-xs-offset-5">
			            <button id="confirm" type="button" class="btn btn-primary">확인</button>
			        </div>			
			    </div>
			</c:if>	
		
		</div>	
		
		<div class="row">
		
			<c:if test="${user.role == 'BUSINESS' }">
		
			<hr>
					
				<div class="form-group">
					<label for="answerContent" class="col-sm-offset-1 col-sm-3 control-label">답변내용</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="answerContent" name="answerContent" value="${qna.answerContent}" >
						</div>
				</div>
				
				<br>				
			    <div class="form-group">      	        
			        <div class="col-xs-1 col-xs-offset-1">
			            <button id="confirm" type="button" class="btn btn-warning">뒤로가기</button>
			        </div>	
			        <div class="col-xs-1 col-xs-offset-5">
		            	<button id="saveAnswerContent" type="button" class="btn btn-primary">답변등록</button>
		        	</div>		
			    </div>
	
			</c:if>	
		
		</div>					
		
		<!-- Form End -->
		</form>
 	</div>
	<!-- Page End -->

	<script type="text/javascript">
		parent.qnaIframeHeight(document.getElementById("qnaschange").scrollHeight);
	</script>

</body>

</html>