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
  	
  	
  	<!-- 버튼 Start -->
  	<script type="text/javascript">  	
  			
		$(function() {
			
		
			
		});
		
	</script>
	<!-- 버튼 End --> 	 	

	<style>
	    body > div.container-fluid{
	        margin-top: 70px;
	    }
	    
	    .form-horizontal .control-label{
	        text-align: left;
	    }
	
	</style>	


</head>

<body>

	<!-- header -->
	<jsp:include page="/view/common/header.jsp"/>
	<!-- header End -->
	
<div class="container-fluid">	
	<div class="row">	  
	  <div class="col-xs-12">
	    
	    <div class="row">	      
			<h3 class="col-sm-7 mb-0">&nbsp;&nbsp;&nbsp;&nbsp;결제내역</h3>	      
		    <div class="col-sm-5">
		      	<div class="row">	          
					<form role="form" class="notice-search">
						
						<br>
						<div class="col-sm-4">
						  <select class="form-control">
						    <option selected="selected">제목+내용</option>
						    <option>제목</option>
						    <option>내용</option>
						  </select>
						</div>
						
						<div class="col-sm-6">
						  <div class="search-box">
						    <input class="form-control" type="text" placeholder="Search...">
						    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
						  </div>
						</div>
					  
					</form>	        
				</div>		    
		    </div>
	    </div>
	   
	    <hr class="divider-w mt-10 mb-20">
	    <div class="notice-list">
	      <ul>
	        <!-- list Start -->
	        <c:forEach var ="notice" items="${wrapper.notices}">
	        <li>
	          <div class="row">
	            <div class="col-sm-2 notice-no">${notice.noticeNo}</div>
	            <div class="col-sm-6 notice-title">${notice.noticeTitle}</div>
	            <div class="col-sm-2 notice-view-count"><i class="fa fa-fw"></i> ${notice.viewCount}</div>
	            <div class="col-sm-2 notice-reg-date">${notice.regDate}</div>
	          </div>
	        </li>
	      </c:forEach>
	        
	      </ul>
	    </div>
	    
	  </div>	
	</div>
	
	<div class="row">
		<!-- PageNavigation -->
		<jsp:include page="../common/pageNavigator.jsp"/>
	</div>	
	
</div>

</body>

</html>