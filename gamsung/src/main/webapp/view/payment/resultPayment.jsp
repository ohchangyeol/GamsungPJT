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
			
			const viewController = $("#viewController").val();
			const ctrlViewCode = viewController.charAt();
	   
		    // 확인
		    $("#payment_confirm").on("click" , function() {
		    	
		    	if( ctrlViewCode == "P" ){
		    		window.location = "/";	
		    	}
		    	
				if( ctrlViewCode == "R" ){
					window.location = "/campGeneral/listMyReservation";	
		    	}
		    		 
			});	
		    
		    // 결제취소
		    $("#payment_cancle").on("click" , function() {
		    	self.location ="/payment/readyRefund?paymentNo="+$("#paymentNo").val();
			});	
		    
			// 캠핑장 예약보기 버튼
			$("#goGetRsv").on("click" , function() {
				self.location ="/campGeneral/getMyReservation?reservationNo="+$("#reservationNo").val();				
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
				<h4 class="text-info">캠핑장 예약완료</h4>
			</div>					
		</div>
		
		<form id="campForm">		
				<div class="row">	
					<div class="col-xs-3">	
						<div class="row">
							<div class="image" style="width: 200px; height: 150px; border-radius: 10px; display: flex; justify-content: center; align-items: center">
	                        	<img src="/uploadfiles/campimg/campbusiness/camp/${campReservation.camp.campImg1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'"  alt="캠핑장 대표이미지" >
	                        </div>			
						</div>						
					</div>
					
					<div class="col-xs-9">					
						<div class="row">							
							<label class="col-xs-2">* 예약번호</label>
							<div class="col-xs-3 form-group">
								${campReservation.reservationNo}
							</div>	
							<div class="col-xs-3 col-xs-offset-1 form-group">
					            <button id="goGetRsv" type="button" class="btn btn-info">예약상세보기</button>
					        </div>						        								
						</div>					
					
						<div class="row">							
							<label class="col-xs-2">* 예약등록일</label>
							<div class="col-md-3 form-group">
								${campReservation.reservationRegDate}
							</div>
							<label class="col-xs-2 col-xs-offset-1">* 예약상태</label>
							<div class="col-md-3 form-group">
								예약완료/결제완료
							</div>							
						</div>
							
						<div class="row">
							<label class="col-xs-2">* 예약자명</label>
							<div class="col-md-3 form-group">
								${campReservation.reservationUserName}
							</div>
							<label class="col-xs-2 col-xs-offset-1">* 예약결제금액</label>
							<div class="col-md-3 form-group">
								${campReservation.totalPaymentPrice}
							</div>						
						</div>	
							
						<div class="row">
							<label class="col-xs-2">* 캠핑장명</label>
							<div id="campName" data="${campReservation.camp.user.campName}" class="col-md-3 form-group">
								${campReservation.camp.user.campName}						
							</div>
							<label class="col-xs-2 col-xs-offset-1">* 주요시설타입</label>
							<div class="col-md-3 form-group">
								${campReservation.mainSite.mainSiteType}
							</div>
						</div>		
												
						<div class="row">
							<label class="col-xs-2">* 예약시작일</label>
							<div class="col-md-3 form-group">
								${campReservation.reservationStartDate}
							</div>
							<label class="col-xs-2 col-xs-offset-1">* 예약종료일</label>
							<div class="col-md-3 form-group">
								${campReservation.reservationEndDate}
							</div>	
						</div>								
					</div>
				</div>
		</form>

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
				<h4 class="text-info">결제 완료내역</h4>
			</div>					
		</div>
		
		<form id="payResultForm">
			<input type="hidden" id="paymentNo" name="paymentNo" value="${payment.paymentNo}">
			<input type="hidden" id="reservationNo" name="reservationNo" value="${campReservation.reservationNo}">	
		
			<div class="row">
				<label class="col-xs-2">* 구매상품명</label>
				<div class="col-md-10 form-group">
					${payment.paymentProduct}
				</div>
			<div class="row">
			</div>	
				<label class="col-xs-2">* 상품번호</label>
				<div class="col-md-10 form-group">
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
				
			<div class="col-xs-2 col-xs-offset-5">
	            <button id="payment_confirm" type="button" class="btn btn-primary">확인</button>
	        </div> 
	
		</div>
	</div>
	<!-- 포인트관리 버튼 end -->
	


</body>

</html>