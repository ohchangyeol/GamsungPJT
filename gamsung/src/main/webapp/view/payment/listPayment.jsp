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
		<form role="form" class="notice-search">
		
		<!-- 상단 Start -->
		<div class="row">	      
			<h3 class="col-sm-2 mb-0">&nbsp;&nbsp;&nbsp;&nbsp;결제내역 - ${user.role}</h3>	  
		  
			<div class="col-sm-10">	
			<br>
				<div class="col-sm-2 col-xs-offset-1">
					<select class="form-control" name="searchCondition" >			  
						<c:if test="${! empty user.role && user.role == 'ADMIN'}">
							<option value="xxx" selected }>Keyword</option>	
							<option value="paymentSender" ${! empty search.searchCondition && search.searchCondition == 'paymentSender' ? "selected" : "" }>주는사람</option>			
							<option value="paymentReceiver" ${! empty search.searchCondition && search.searchCondition == 'paymentReceiver' ? "selected" : "" }>받는사람</option>
							<option value="paymentNo" ${! empty search.searchCondition && search.searchCondition == 'paymentNo' ? "selected" : "" }>결제 번호</option>
							<option></option>
							<option value="paymentProduct" ${! empty search.searchCondition && search.searchCondition == 'paymentProduct' ? "selected" : "" }>결제 상품</option>
							<option value="paymentProductPriceTotal" ${! empty search.searchCondition && search.searchCondition == 'paymentProductPriceTotal' ? "selected" : "" }>결제 전체금액</option>
							<option></option>
							<option value="paymentRegTime" ${! empty search.searchCondition && search.searchCondition == 'paymentRegTime' ? "selected" : "" }>결제 등록일자</option>						    
							<option value="paymentCode" ${! empty search.searchCondition && search.searchCondition == 'paymentCode' ? "paymentCode" : "" }>결제 유형</option>
							<option value="paymentReferenceNum" ${! empty search.searchCondition && search.searchCondition == 'paymentReferenceNum' ? "selected" : "" }>결제 참조번호</option>						    
							<option value="paymentMethod" ${! empty search.searchCondition && search.searchCondition == 'paymentMethod' ? "selected" : "" }>결제 방법</option>
							<option></option>
							<option value="paymentPriceTotal" ${! empty search.searchCondition && search.searchCondition == 'paymentPriceTotal' ? "selected" : "" }>일반결제 총금액</option>
							<option value="paymentPricePay" ${! empty search.searchCondition && search.searchCondition == 'paymentPricePay' ? "selected" : "" }>일반결제 상품대금</option>
							<option value="paymentPriceFee" ${! empty search.searchCondition && search.searchCondition == 'paymentPriceFee' ? "selected" : "" }>일반결제 수수료</option>
							<option></option>
							<option value="paymentMethodSecond" ${! empty search.searchCondition && search.searchCondition == 'paymentMethodSecond' ? "selected" : "" }>포인트결제 유무</option>
							<option value="paymentPriceTotalSecond" ${! empty search.searchCondition && search.searchCondition == 'paymentPriceTotalSecond' ? "selected" : "" }>포인트결제 총금액</option>
							<option value="paymentPricePaySecond" ${! empty search.searchCondition && search.searchCondition == 'paymentPricePaySecond' ? "selected" : "" }>포인트결제 상품대금</option>
							<option value="paymentPriceFeeSecond" ${! empty search.searchCondition && search.searchCondition == 'paymentPriceFeeSecond' ? "selected" : "" }>포인트결제 수수료</option>
							<option></option>
							<option value="paymentRefundRegTime" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundRegTime' ? "selected" : "" }>환불 등록일자</option>
							<option value="paymentRefundCode" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundCode' ? "selected" : "" }>환불 유형</option>
							<option value="paymentRefundReferenceNum" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundReferenceNum' ? "selected" : "" }>환불 참조번호</option>
							<option></option>
							<option value="paymentRefundPriceTotal" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundPriceTotal' ? "selected" : "" }>일반환불 금액합계</option>
							<option value="paymentRefundPricePay" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundPricePay' ? "selected" : "" }>일반환불 상품대금</option>
							<option value="paymentRefundPriceFee" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundPriceFee' ? "selected" : "" }>일반환불 수수료</option>
							<option></option>
							<option value="paymentRefundPriceTotalSecond" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundPriceTotalSecond' ? "selected" : "" }>포인트환불 금액합계</option>
							<option value="paymentRefundPricePaySecond" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundPricePaySecond' ? "selected" : "" }>포인트환불 상품대금</option>
							<option value="paymentRefundPriceFeeSecond" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundPriceFeeSecond' ? "selected" : "" }>포인트환불 수수료</option>			
						</c:if>	
					
						<c:if test="${! empty user.role && user.role != 'ADMIN'}">
							<option value="paymentProduct" ${! empty search.searchCondition && search.searchCondition == 'paymentProduct' ? "selected" : "" }>결제 상품</option>
							<option value="paymentProductPriceTotal" ${! empty search.searchCondition && search.searchCondition == 'paymentProductPriceTotal' ? "selected" : "" }>결제 전체금액</option>
							<option></option>
							<option value="paymentRegTime" ${! empty search.searchCondition && search.searchCondition == 'paymentRegTime' ? "selected" : "" }>결제 등록일자</option>						    
							<option value="paymentCode" ${! empty search.searchCondition && search.searchCondition == 'paymentCode' ? "paymentCode" : "" }>결제 유형</option>
							<option value="paymentReferenceNum" ${! empty search.searchCondition && search.searchCondition == 'paymentReferenceNum' ? "selected" : "" }>결제 참조번호</option>						    
							<option value="paymentMethod" ${! empty search.searchCondition && search.searchCondition == 'paymentMethod' ? "selected" : "" }>결제 방법</option>
							<option value="paymentPriceTotal" ${! empty search.searchCondition && search.searchCondition == 'paymentPriceTotal' ? "selected" : "" }>일반결제 총금액</option>
							<option value="paymentMethodSecond" ${! empty search.searchCondition && search.searchCondition == 'paymentMethodSecond' ? "selected" : "" }>포인트결제 유무</option>
							<option value="paymentPriceTotalSecond" ${! empty search.searchCondition && search.searchCondition == 'paymentPriceTotalSecond' ? "selected" : "" }>포인트결제 총금액</option>
							<option></option>
							<option value="paymentRefundRegTime" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundRegTime' ? "selected" : "" }>환불 등록일자</option>
							<option value="paymentRefundCode" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundCode' ? "selected" : "" }>환불 유형</option>
							<option value="paymentRefundReferenceNum" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundReferenceNum' ? "selected" : "" }>환불 참조번호</option>
							<option value="paymentRefundPriceTotal" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundPriceTotal' ? "selected" : "" }>일반환불 금액합계</option>
							<option value="paymentRefundPriceTotalSecond" ${! empty search.searchCondition && search.searchCondition == 'paymentRefundPriceTotalSecond' ? "selected" : "" }>포인트환불 금액합계</option>
						</c:if>  
					</select>
				</div>
			
				<div class="col-sm-3">
				  <div class="search-box">
				    <input class="form-control" id="searchKeyword" name="searchKeyword" type="text" placeholder="Search...">
				    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
				  </div>
				</div>	

				
				<div class="col-sm-2 col-xs-offset-1">
				  <div class="search-box">
				    <input class="form-control" id="searchKeyword" name="searchKeyword" type="text" placeholder="시작일자">
				  </div>
				</div>	
				
				<div class="col-sm-2">					
				  <div class="search-box">
				  	<input class="form-control" id="searchKeyword" name="searchKeyword" type="text" placeholder="종료일자">
				  </div>
				</div>	
						
						  
			 </div>
		</div>
		<!-- 상단 End -->
		
		<hr class="divider-w mt-10 mb-20">
		
		<!-- 목록 Start -->			   
		<div class="row" style="white-space:nowrap; overflow:auto;  width:1800px; height:700px; margin:0 auto;">
		
			<div class="row">	          
		
			</div>
			
			<div class="row">
				<ul>
			
		
				<c:forEach var ="notice" items="${wrapper.notices}">
				<li>
				  <div class="row">
				    <div class="col-sm-2">${notice.noticeNo}</div>
				<div class="col-sm-6">${notice.noticeTitle}</div>
				<div class="col-sm-2"><i class="fa fa-fw"></i> ${notice.viewCount}</div>
				<div class="col-sm-2">${notice.regDate}</div>
				  </div>
				</li>
				</c:forEach>
			     
				</ul>
			</div>
		  
		</div>
		<!-- 목록 End -->	
		
		<!-- PageNavigation Start -->
		<div class="row">			
			<jsp:include page="../common/pageNavigator.jsp"/>
		</div>	
		<!-- PageNavigation End -->

	</form>		
</div>

</body>
</html>