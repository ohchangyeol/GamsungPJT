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
  	
  	
  	<!-- 화면 Controller Start -->
  	<script type="text/javascript">  	
  			
		$(function() {
			
			const paymentNo = $("#paymentNo").val();
			const paymentRespond = $("#paymentRespond").val();
			
			if(paymentNo == null && paymentRespond != null){
				alert("결제가 실패하였습니다."
						+"\n내용 : "+paymentRespond
						+"\n처음으로 돌아갑니다.");				
			}			

			// 테스트용
			$("#temp1").on("click" , function() {		
				$(".container").show();
				$("div").show();
			});
			
			$("#temp2").on("click" , function() {				
				const paymentPriceTotal = $("#paymentPriceTotal").val();
				
				$("#paymentPriceTotal").val(uncomma(paymentPriceTotal));
				$("#paymentCode").val("P1");													
				
				$("#payForm").attr("method" , "POST").attr("action" , "/payment/updatePointTransfer").submit();	
			});
			// 테스트용
					
			$("#pointContainer").hide();
			$("#chargeDiv").hide();
			$("#withdrawDiv").hide();
			$("#campContainer").hide();
			$("#auctionContainer").hide();
			$("#transferContainer").hide();
			
			$("#pointButtonContainer").hide();
			$("#campButtonContainer").hide();
			$("#pointPayButtonContainer").hide();
						
			const viewController = $("#viewController").val();
			const ctrlViewCode = viewController.charAt();
			
			console.log("ctrlViewCode : "+ctrlViewCode);

			if( viewController == "P1" ){
				$("#pointContainer").show();
				$("#chargeDiv").show();
				$("#pointButtonContainer").show();
			}
			
			if( viewController == "P2" ){
				$("#pointContainer").show();				
				$("#withdrawDiv").show();
				$("#pointButtonContainer").show();
			}
			
			if(ctrlViewCode == "R"){
				$("#campContainer").show();
				$("#campButtonContainer").show();
			}
			
			if(ctrlViewCode == "A"){
				$("#auctionContainer").show();
				$("#pointPayButtonContainer").show();
			}
			
			if(ctrlViewCode == "T"){
				$("#transferContainer").show();
				$("#pointPayButtonContainer").show();
			}
			
		});
		
	</script>
	<!-- 화면 Controller End -->
  	
  	
  	<!-- 버튼 Start -->
  	<script type="text/javascript">  
  	
		$(function() {
	   
		    // 확인
		    $("#payment_confirm").on("click" , function() {
		    			 
			});	
		    
		    // 결제취소
		    $("#payment_cancle").on("click" , function() {
		    	 
			});	
		    
		});  			
	  		
	</script>		
  	<!-- 버튼 End --> 
   	  	  	
  	
  	<!-- import 결제모둘 Start -->  	
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>  	
	<script type="text/javascript">		
		
	
			
	</script>	  	
  	<!-- import 결제모둘 End -->
  	
  	 	

	<style>
	    body > div.container{
	        margin-top: 50px;
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
	
	
	<!-- 화면 Controller Start -->  	
  	<input type="hidden" id="viewController" name="viewController" value="${payment.paymentCode}">
  	<input type="hidden" id="paymentRespond" name="paymentRespond" value="${payment.paymentNotice}">
  	<input type="hidden" id="paymentNo" name="paymentNo" value="${payment.paymentNo}">
  	<!-- 화면 Controller End -->
	
	
	<!-- 포인트관리 start-->
	<div id="pointContainer" class="container">	
				
		<!-- 포인트충전 start-->
		<div id="chargeDiv" class="row">	
		
			<div class="row">
				<div class="page-header">
					<h3 class="text-info">포인트 구매완료</h3>
				</div>					
			</div>
			
			<form id="chargeForm">		
				<div class="row">
					<label class="col-xs-2">이전 포인트 (P)</label>
					<div class="col-md-3 form-group">
						${user.havingPoint - payment.pointChargeTotal}
					</div>					
					<label class="col-xs-2 col-xs-offset-1">구매한 포인트 (P)</label>
					<div class="col-md-3 form-group">
						${payment.pointChargeTotal}
					</div>	
					<label class="col-xs-2">현재 포인트 (P)</label>
					<div class="col-md-3 form-group">
						${user.havingPoint}
					</div>	
					<label class="col-xs-2 col-xs-offset-1">결제금액 (원)</label>
					<div class="col-md-3 form-group">
						${payment.paymentPriceTotal}
					</div>							
				</div>			
			</form>	
		
		</div>
		<!-- 포인트충전 end -->	
					
		
		<!-- 포인트출금 start -->	
		<div id="withdrawDiv" class="row">
		
			<div class="row">
				<div class="page-header">
					<h4 class="text-info">포인트 출금완료</h4>
				</div>
			</div>
			
			<form id="withdrawForm">
				
				
			</form>					
		</div>
		<!-- 포인트출금 end -->			

	</div>
	<!-- 포인트관리 end-->
			
			
	<!-- 캠핑 start-->
	<div id="campContainer" class="container">
		
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">캠핑예약 내역</h4>
			</div>					
		</div>
		
		<form id="campForm">
		
		</form>
			
		캠핑 영역

	</div>
	<!-- 캠핑 end-->
	
	
	
	<!-- 경매 start -->
	<div id="auctionContainer" class="container">
		
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">경매확정 내역</h4>
			</div>					
		</div>
		
		<form id="auctionForm">
		
		</form>
		
		경매 영역
	

	</div>
	<!-- 경매 end -->
	
	
	
	<!-- 양도양수 start -->
	<div id="transferContainer" class="container">
		
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">양수양도 내역</h4>
			</div>					
		</div>
		
		<form id="transferForm">
		
		</form>
	
		양도양수 영역
	
	
	</div>
	<!-- 양도양수 end -->
	
		
	<!-- 결제모듈 start -->	
	<div id="payformContainer" class="container">
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">결제 내역</h4>
			</div>					
		</div>
		
		<form id="payResultForm">
			<div class="row">
				<label class="col-xs-2">* 구매상품명</label>
				<div class="col-md-10 form-group">
					${payment.paymentProduct}
				</div>
			<div class="row">
			</div>	
				<label class="col-xs-2">* 상품참조번호</label>
				<div class="col-md-10 form-group">
					<input type="hidden" id="campFormReservationNo" name="campFormReservationNo" value="${campReservation.reservationNo}">
					${payment.paymentReferenceNum}
				</div>
			</div>								
			<div class="row">
				<label class="col-xs-2">* 결제번호</label>
				<div class="col-md-3 form-group">
					${payment.paymentNo}
				</div>
				<label class="col-xs-2 col-xs-offset-1">* 구매자ID</label>
				<div class="col-md-3 form-group">
					${payment.paymentSender}
				</div>	
			</div>	
			<div class="row">
				<label class="col-xs-2">* 결제 금액</label>
				<div class="col-md-3 form-group">
					<c:if test="${payment.paymentMethodSecond eq 'point' && empty payment.paymentMethod}">
							포인트 - ${payment.paymentPriceTotalSecond}[P] 
					</c:if>
					
					<c:if test="${ empty payment.paymentMethodSecond && !empty payment.paymentMethod}">
							<c:if test="${payment.paymentMethod eq 'card'}">
									신용카드/간편결제
							</c:if>
							<c:if test="${payment.paymentMethod eq 'samsung'}">
									삼성페이
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'trans'}">
									실시간 계좌이체
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'vbank'}">
									가상 계좌
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'phone'}">
									휴대폰 소액결제
							</c:if>
									 - ${payment.paymentPriceTotal}(원)
					</c:if>	
					
					<c:if test="${ !empty payment.paymentMethodSecond && !empty payment.paymentMethod}">
							포인트 - ${payment.paymentPriceTotalSecond}[P] &
							
							<c:if test="${payment.paymentMethod eq 'card'}">
									신용카드/간편결제
							</c:if>
							<c:if test="${payment.paymentMethod eq 'samsung'}">
									삼성페이
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'trans'}">
									실시간 계좌이체
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'vbank'}">
									가상 계좌
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'phone'}">
									휴대폰 소액결제
							</c:if>
									 - ${payment.paymentPriceTotal}(원)
					</c:if>					
				</div>							
				<label class="col-xs-2 col-xs-offset-1">* 결제방법</label>
				<div class="col-md-3 form-group">					
					<c:if test="${payment.paymentMethodSecond eq 'point' && empty payment.paymentMethod}">
							포인트 
					</c:if>
					<c:if test="${payment.paymentMethodSecond eq 'point' && !empty payment.paymentMethod}">
							포인트/
					</c:if>
					<c:if test="${payment.paymentMethod eq 'card'}">
							신용카드/간편결제
					</c:if>
					<c:if test="${payment.paymentMethod eq 'samsung'}">
							삼성페이
					</c:if>					
					<c:if test="${payment.paymentMethod eq 'trans'}">
							실시간 계좌이체
					</c:if>					
					<c:if test="${payment.paymentMethod eq 'vbank'}">
							가상 계좌
					</c:if>					
					<c:if test="${payment.paymentMethod eq 'phone'}">
							휴대폰 소액결제
					</c:if>	
				</div>			
			</div>					
		</form>	
	</div>
	<!-- 결제모듈 end -->
	
	
	<!-- #### 버튼 #### start -->
	<div class="container">
		<hr>
	</div>
	<!-- #### 버튼 #### end -->
	
	
	<!-- 포인트관리 버튼 start -->
	<div id="pointChargeButtonContainer" class="container">
		<div class="row">
		
			<div class="col-xs-2">
				<button id="payment_cancle" type="button" class="btn btn-warning" value="1">결제 취소</button>
			</div>
			
			<div class="col-xs-2 col-xs-offset-7">
	            <button id="payment_confirm" type="button" class="btn btn-primary">확인</button>
	        </div> 
	
		</div>
	</div>
	<!-- 포인트관리 버튼 end -->
	
	
	<!-- 테스트 버튼 -->
	<div class="container">		
		<br>
		<div class="row">
 			<div class="col-xs-2">
	            <button id="temp1" type="button" class="btn btn-primary">임시모두보기</button>
	        </div>

		</div>
	</div>		


</body>

</html>