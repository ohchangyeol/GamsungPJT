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
  	
  	<script type="text/javascript">  
  	
  		
		<!-- 화면 Controller Start -->		
		// 로딩시 화면 컨트롤
		$(function() {
					
			$("#pointContainer").hide();			
			$("#campContainer").hide();
			$("#paySecond").hide();			
			
			$("#auctionContainer").hide();
			$("#transferContainer").hide();
			
			$("#pointButtonContainer").hide();
			$("#campButtonContainer").hide();
			$("#pointPayButtonContainer").hide();
						
			const viewController = $("#viewController").val();
				
			if( viewController == "P2" ){
				$("#pointContainer").show();
				$("#pointButtonContainer").show();
			} 
			
			if(viewController == "R1" || viewController == "R2"){
				$("#campContainer").show();
				$("#campButtonContainer").show();
				$("#paySecond").show();		
			}
			
			if(viewController == "A"){
				$("#auctionContainer").show();
				$("#pointPayButtonContainer").show();
			}
			
			if(viewController == "T"){
				$("#transferContainer").show();
				$("#pointPayButtonContainer").show();
			}
			
		});
		<!-- 화면 Controller End -->
		
		
  		<!-- 포인트관리 Start -->	
  		// 포인트 금액 계산
		$(function() {
			
			const havingPoint1 = $("#havingPoint1").val();			
			const havingPoint2 = $("#havingPoint2").val();
			
			$(document).ready(function() { 
				$("#havingPoint1").val(comma(havingPoint1));
				$("#havingPoint2").val(comma(havingPoint2));
			});
			
			// 포인트 충전금액 계산 버튼
			$("#count1").on("propertychange change keyup paste input", function() {				
				calculateNumber();
				checkPaymentMethod();
			});
			
			$("#count2").on("propertychange change keyup paste input", function() {
				calculateNumber();
				checkPaymentMethod();
			});
						
			$("#count3").on("propertychange change keyup paste input", function() {
				calculateNumber();
				checkPaymentMethod();
			});
			
			// 포인트 출금금액 계산 입력
			$("#pointWithdrawTotal").on("propertychange change keyup paste input", function() {				
				
				const withdrawPoint = $("#pointWithdrawTotal").val();	
				const refundFee = $("#paymentRefundReferenceFee").val();
				
				const havingPointUc = uncomma(havingPoint2);
				const withdrawPointUc = uncomma(withdrawPoint);				
				const afterWithdrawUc = havingPointUc - withdrawPointUc;				
				const cashRefund = withdrawPointUc * ( 1 - refundFee * 0.01);
		
				if( afterWithdrawUc < 0 ){
					alert("출금 할 포인트가 부족합니다.");
					$("#pointWithdrawTotal").val("0");
					return;
				}
				
				$("#pointWithdrawTotal").val(comma(withdrawPointUc));								
				$("#pointAfterWithdraw").val(comma(afterWithdrawUc));
				$("#paymentRefundPriceTotal").val(comma(cashRefund));			
				
			});			
			
			// 포인트출금 페이지/버튼 로딩시 숨기기
			$("#withdrawDiv").hide();
			$("#point_withdrawButton").hide();
			
		});	  		
  		
		// 포인트 버튼
		$(function() {
			
			// 포인트 충전/출금 변경 버튼
			$("#point_showWithDraw").on("click" , function() {
						
				if($(this).val()==0){
					$(this).val(1); 
		        } else{
		        	$(this).val(0);
		        }
								
				const withdrawHide = $(this).val();

				if(withdrawHide==1){				
		           	$("#withdrawDiv").hide();
		           	$("#point_withdrawButton").hide();

		           	$("#point_showWithDraw").html('포인트 출금');
		           	$("#chargeDiv").show();
		           	$("#point_chargeButton").show();
		           	$("#payformContainer").show();		           	
		           	
		        } else{		  
		        	$("#chargeDiv").hide();
		        	$("#point_chargeButton").hide();
		        	$("#payformContainer").hide();
		        	
		        	$("#point_showWithDraw").html('포인트 충전'); 
					$("#withdrawDiv").show();
					$("#point_withdrawButton").show();
		        	
		        }					
			});
				
			
			// 포인트구매 버튼
			$("#point_chargeButton").on("click" , function() {	
				
				const count1 = $("#count1").val();
				const count2 = $("#count2").val();
				const count3 = $("#count3").val();
				
				if( count1 != 0 || count2 != 0 || count3 != 0 ){					
					iamport();					
				} else {
					alert("수량을 선택하세요.");
				}						
			});	
			
			// 포인트출금 버튼
			$("#point_withdrawButton").on("click" , function() {	
		
			});	
		
		});	
		
		// 충전 포인트 계산
		function calculateNumber() {
			
			const havingPoint1 = uncomma($("#havingPoint1").val());
			
			const count1 = $("#count1").val();
			const count2 = $("#count2").val();
			const count3 = $("#count3").val();
							
			const pointChargeTotaltext = parseInt(100000*count1) + parseInt(10000*count2) + parseInt(1000*count3);
			const paymentPriceTotaltext = parseInt(90000*count1) + parseInt(9500*count2) + parseInt(1000*count3);
			const finalPointtext = parseInt(havingPoint1) + parseInt(pointChargeTotaltext);
			
			$("#finalPoint").val(comma(finalPointtext));
			$("#pointChargeBalance").val(comma(pointChargeTotaltext));
			$("#paymentPriceBalance").val(comma(paymentPriceTotaltext));
						
			// 포인트 결제내용 동기화 
			$("#pointChargeTotal").val(pointChargeTotaltext);
			$("#paymentPriceTotal").val(comma(paymentPriceTotaltext));					
			$("#paymentProduct").val("포인트구매"+pointChargeTotaltext+"[p]");			
			$("#paymentReferenceNum").val( "[PC/" + new Date().toISOString().substring(0, 19) +"/"+$("#pay_buyerEmail").val() + "]");

		}	
		<!-- 포인트관리 End --> 

		
		<!-- 캠핑예약결제 Start --> 	
		// 포인트결제 사용 Y/N
		$(function() {
			
			$("#paymentPriceTotal").val($("#tempPriceTotal").val());
			
			$("#useAllPoint").attr("disabled", true);	
			$("#currentPoint").val(comma($("#currentPoint").val()));			
		  
			$("input:checkbox[id=paymentMethodSecond]").click(function () {
		        
		        if ($("input:checkbox[id=paymentMethodSecond]").is(":checked")) { 
		        	
		        	$("#paymentPriceTotalSecond").removeAttr("readonly");	        	
		        	$("#useAllPoint").removeAttr("disabled"); 
		        
		        } else { 
		        	
		        	$("#paymentPriceTotalSecond").attr("readonly", true);
		        	$("#useAllPoint").attr("disabled", true);
		        	$("#paymentPriceTotalSecond").val("0");
		        	return;
		        } 
		    })	  	
		    
		    // 전액사용 버튼
		    $("#useAllPoint").on("click" , function() {
		    	
		    	let useAllPointPushCount = 0;
		    	useAllPointPushCount++;
		    	
		    	const currentPointUC = uncomma($("#currentPoint").val());
		    	const tempPriceTotalUC = uncomma($("#tempPriceTotal").val());					
				const resultPaymentPriceTotal = tempPriceTotalUC - currentPointUC;
				
				if(useAllPointPushCount == 1){
					alert("포인트가 적용되었습니다.");
					$("#useAllPoint").attr("disabled", true);
					$("#paymentPriceTotalSecond").attr("readonly", true);
				}
								
				if( resultPaymentPriceTotal < 0 ){
				
					$("#paymentPriceTotalSecond").val(tempPriceTotalUC);
					
					const paymentPriceTotalSecondUC = uncomma($("#paymentPriceTotalSecond").val());						
					const resultPaymentPriceTotal = tempPriceTotalUC - paymentPriceTotalSecondUC;
					
					$("#paymentPriceTotal").val(resultPaymentPriceTotal);
					$("#currentPoint").val(comma(currentPointUC-tempPriceTotalUC));					
					return;
				
				} else {
					
					$("#paymentPriceTotalSecond").val(currentPointUC);
					
					const tempPriceTotalUC = uncomma($("#tempPriceTotal").val());
					const paymentPriceTotalSecondUC = uncomma($("#paymentPriceTotalSecond").val());						
					const resultPaymentPriceTotal = tempPriceTotalUC - paymentPriceTotalSecondUC;
					
					$("#paymentPriceTotal").val(resultPaymentPriceTotal);	
				}	
				
				 
			});
			
			// 캠핑장 예약보기 버튼
			$("#goGetRsv").on("click" , function() {
				self.location ="/campGeneral/getMyReservation?reservationNo="+$("#reservationNo").val();				
			});
						
			// 캠핑장 예약결제 버튼
			$("#camp_pay").on("click" , function() {
				
				const viewController = $("#viewController").val();
				let reservationStatus = "";
				
				if( viewController == "R1" ){
					reservationStatus ="예약등록";
				} 
				
				if(viewController == "R2"){
					reservationStatus ="예약변경";
				}
				
				$("#paymentProduct").val( "[" + $("#campName").attr("data") +"/"+reservationStatus+"/" + new Date().toISOString().substring(0, 10) + "]");
				$("#paymentReferenceNum").val( "[" + $("#reservationNo").val( ) + "/"+reservationStatus+"/" + new Date().toISOString().substring(0, 19) + "]");				
				$("#paymentCode").val(viewController);					
				$("#paymentSender").val( $("#pay_buyerEmail").val() );				
				
				if( $("#paymentPriceTotal").val() > 0 ) {
					 
					if( $("#paymentPriceTotal").val() <= 99 ) {
						alert("일반결제는 100원 이상부터 가능합니다.");
						
					} else {						
						checkPaymentMethod();				
						iamport();						
					}								
					
				} else {									
					
					$("#paymentPriceTotal").val(uncomma($("#paymentPriceTotal").val()));
									
					if( $("#paymentPriceTotal").val() == 0 ){						
						$("#paymentProductPriceTotal").val(uncomma($("#paymentPriceTotalSecond").val()));						
					}
					
					checkPaymentMethod();					

					$("#campForm").attr("method" , "POST").attr("action" , "/payment/paymentSystem").submit();				
					$("#payForm").attr("method" , "POST").attr("action" , "/payment/paymentSystem").submit();	
				}
				
			});					
	  	  	
			// 포인트 사용금액 입력
			$("#paymentPriceTotalSecond").on("propertychange change keyup paste input", function() {
								
				const tempPriceTotalUC = uncomma($("#tempPriceTotal").val());
				const paymentPriceTotalUC = uncomma($("#paymentPriceTotal").val());	
				const paymentPriceTotalSecondUC = uncomma($("#paymentPriceTotalSecond").val());						
				const resultPaymentPriceTotal = tempPriceTotalUC - paymentPriceTotalSecondUC;				
			
				if( resultPaymentPriceTotal < 0 ){
					alert("결제 금액을 초과하였습니다.");
					$("#paymentPriceTotalSecond").val(tempPriceTotalUC);
					$("input:checkbox[id='paymentMethodSecond']").attr("checked", true);
					return;
				}
				
				 $("#paymentPriceTotal").val(resultPaymentPriceTotal);	 
							
			});				
			
			<!-- 캠핑예약결제 End -->		
			
		}); 
		
		
		<!-- 공통 Start -->			
		//결제방법 라디오버튼체크
		function checkPaymentMethod() {	
			
			const paymentPriceTotal = $("#paymentPriceTotal").val();
			
			if(paymentPriceTotal == 0){				
				$("#method_card").prop("checked", false);				
			}
			if(paymentPriceTotal != 0){
				$("#method_card").prop("checked", true);
			}
		}
		
		// 금액 "," 추가
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		// 금액 "," 제거
		function uncomma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}		
			
	</script>
	<!-- 공통 End -->	  	
  	
  	
  	<!-- import 결제모둘 Start -->  	
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>  	
	<script type="text/javascript">
	
		function iamport() {
			
			const payViewCode = $("#viewController").val();			
			const vPaymethod = $("input[name=paymentMethod]:checked").val();
			const vMerchant_uid = $("#paymentReferenceNum").val(); 
			const vName = $("#paymentProduct").val();
			const vAmount = uncomma($("#paymentPriceTotal").val());			
			const vBuyername = $("#paymentReceiver").val();
			const vBuyeremail = $("#pay_buyeremail").val();
			const vBuyertel = $("#pay_buyertel").val();
					
			console.log("vPaymethod 	: " + vPaymethod);
			console.log("vMerchant_uid 	: " + vMerchant_uid);
			console.log("vName 			: " + vName);
			console.log("vAmount		: " + vAmount);
			console.log("vBuyername 	: " + vBuyername);
			console.log("vBuyeremail 	: " + vBuyeremail);			
			console.log("vBuyertel 		: " + vBuyertel);
					
			IMP.init('imp23070563');			//가맹점 식별코드
			IMP.request_pay({
				pg: 'html5_inicis', 			// PG사 선택
				pay_method: vPaymethod,			// 지불 수단	
				merchant_uid: vMerchant_uid, 	// 가맹점에서 구별가능한 고유한id
				name: vName, 					// 상품명
				amount: vAmount, 				// 가격
				buyer_email: vBuyeremail,		// 구매자 이메일
				buyer_name: vBuyername, 		// 구매자 이름
				buyer_tel: vBuyertel, 			// 구매자 연락처		
		
			}, function(rsp) {
				console.log(rsp);
				
				// 결제 검증
				$.ajax({
					type : "POST",
					url : "/payment/rest/verifyIamport/" + rsp.imp_uid
				
				}).done(function(data) {
	
					console.log(data);
	
					// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
					if(rsp.paid_amount == data.response.amount){
						alert("결제가 완료 되었습니다.");					
						
						const payCode = $("#viewController").val();	
						console.log("payCode : "+payCode);						
						
						//포인트 구매
						if( payCode == "P2" ){		
																	
							$("#paymentCode").val("P1");
							$("#reservationStatus").val(parseInt("0"));
							$("#totalPaymentPrice").val(parseInt("0"));							
							$("#useNum").val(parseInt("0"));						
							$("#rCampNo").val(parseInt("0"));							
							$("#rMainSiteNo").val(parseInt("0"));
							$("#reservationRegDate").val("2000-01-01");
							$("#reservationStartDate").val("2000-01-01");
							$("#reservationEndDate").val("2000-01-01");
							
						}
						
						if(payCode == "R1" && payViewCode == "R2"){
							$("#paymentProductPriceTotal").val( parseInt(uncomma($("#paymentPriceTotal").val())) + parseInt(uncomma($("#paymentPriceTotalSecond").val())) );
						}	
						
						const paymentPriceTotal = $("#paymentPriceTotal").val();						

						$("#paymentPriceTotal").val(uncomma(paymentPriceTotal));
						$("#paymentSender").val( $("#pay_buyerEmail").val() );
						$("#impUid").val(rsp.imp_uid);
						console.log("imp_uid : "+rsp.imp_uid);
						
						$("#payForm").attr("method" , "POST").attr("action" , "/payment/paymentSystem").submit();	
						
					} else {
						alert("결제가 실패 되었습니다.");
					}
				
				});
			});	
		}	
		
	</script>	  	
  	<!-- import 결제모둘 End -->
  	  	
  	
	<style>
	    body > div.container{
	        margin-top: 40px;
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
  	<!-- 화면 Controller End -->
	
	
	<!-- 포인트관리 start-->
	<div id="pointContainer" class="container">	
				
		<!-- 포인트충전 start-->
		<div id="chargeDiv" class="row">	
		
			<div class="row">
				<div class="page-header">
					<h4 class="text-info">포인트 충전</h4>
				</div>					
			</div>
			
			<form id="chargeForm">		
				<div class="row">
					<label class="col-xs-2">* 보유 포인트 [P]</label>
					<div class="col-md-3 form-group">
						<input type="text" id="havingPoint1" name="havingPoint1" value="${user.havingPoint}" class="form-control" readonly>
					</div>					
					<label class="col-xs-2 col-xs-offset-1">* 구매 후 포인트 [P]</label>
					<div class="col-md-3 form-group">
						<input type="text" id="finalPoint" name="finalPoint" value="0" class="form-control" readonly>
					</div>										
				</div>
				<div class="row">
					<label class="col-xs-2">* 구매 포인트 [P]</label>
					<div class="col-md-3 form-group">
						<input type="text" id="pointChargeBalance" name="pointChargeBalance" value="0" class="form-control" readonly>
					</div>
	
					<label class="col-xs-2 col-xs-offset-1">* 구매 결제금액 (원)</label>
					<div class="col-md-3 form-group">
						<input type="text" id="paymentPriceBalance" name="paymentPriceBalance" value="0" class="form-control" readonly>
					</div>					
				</div>				
			</form>	
		
			<hr>
			<form id="chargeCountForm">
				<div class="row">				
					<div class="col-xs-2">
						<div class="row">
							<label class="col-xs-12">* 100,000[P] 구매</label>
							<div class="col-xs-12 form-group">
								<input type="text" id="100k" name="100k" value="90,000 원" class="form-control" readonly>
							</div>
						</div>
					</div>	
					<div class="col-xs-2">	
						<div class="row">
							<label class="col-xs-12">- 수량 -</label>
							<div class="col-xs-12 form-group">
								<input type="number" id="count1" name="count1" value="0" min="0" max="10" class="form-control">
							</div>
						</div>	
					</div>
						
					<div class="col-xs-2">
						<div class="row">
							<label class="col-xs-12">* 10,000[P] 구매</label>
							<div class="col-xs-12 form-group">
								<input type="text" id="10k" name="10k" value="9,500 원" class="form-control" readonly>
							</div>
						</div>
					</div>
					<div class="col-xs-2">	
						<div class="row">	
							<label class="col-xs-12">- 수량 -</label>
							<div class="col-xs-12 form-group">
								<input type="number" id="count2" name="count2" value="0" min="0" max="10" class="form-control">
							</div>
						</div>	
					</div>
					
					<div class="col-xs-2">
						<div class="row">	
							<label class="col-xs-12">* 1,000[P] 구매</label>
							<div class="col-xs-12 form-group">
								<input type="text" id="1k" name="1k" value="1,000 원" class="form-control" readonly>
							</div>
						</div>	
					</div>
					<div class="col-xs-2">
						<div class="row">	
							<label class="col-xs-12">- 수량 -</label>
							<div class="col-xs-12 form-group">
								<input type="number" id="count3" name="count3" value="0" min="0" max="10" class="form-control">
							</div>
						</div>								
					</div>			
				</div>
			</form>		
		</div>
		<!-- 포인트충전 end -->	
					
		
		<!-- 포인트출금 start -->	
		<div id="withdrawDiv" class="row">
		
			<div class="row">
				<div class="page-header">
					<h4 class="text-info">포인트 출금</h4>
				</div>
			</div>
			
			<form id="withdrawForm">
				<input type="hidden" id="paymentMethod" name="paymentMethod" value="cash">
				<input type="hidden" id="campPaymentReceiver" name="campPaymentReceiver" value="${payment.paymentReceiver}">
				<input type="hidden" id="paymentRefundReferenceFee" name="paymentRefundReferenceFee" value="${payment.paymentRefundReferenceFee}">				
				
				<div class="row">
				<div class="col-xs-2">보유 포인트 (P)</div>
					<div class="col-md-3 form-group">
						<input type="text" id="havingPoint2" name="havingPoint2" value="${user.havingPoint}" class="form-control"
							readonly>
					</div>
					
					<div class="col-xs-2 col-xs-offset-1">잔여 포인트 (P)</div>
					<div class="col-md-3 form-group">
						<input type="text" id="pointAfterWithdraw" name="pointAfterWithdraw" value="" class="form-control" readonly>
					</div>													
				</div>
				
				<div class="row">
					<div class="col-xs-2">출금 포인트 (P)</div>
					<div class="col-md-3 form-group">
						<input type="text" id="pointWithdrawTotal" name="pointWithdrawTotal" value="" class="form-control">
					</div>
						
					<div class="col-xs-2 col-xs-offset-1">현금 환급액 (원)</div>
					<div class="col-md-3 form-group">
						<input type="text" id="paymentRefundPriceTotal" name="paymentRefundPriceTotal" value="" class="form-control" readonly>
					</div>
				</div>
				
				<hr>
	
				<div class="row">
					<div class="col-xs-2">입금 계좌정보</div>
				</div>

				<div class="row">
					<br>
					<div class="col-xs-3">
						<div class="col-xs-12">은행명</div>
						<div class="col-xs-12 form-group">
						<input type="text" id="bank" name="bank" value="${user.bank}" class="form-control">
					</div>
					
					</div>
					<div class="col-xs-3">
						<div class="col-xs-12">예금주</div>
						<div class="col-xs-12 form-group">
						<input type="text" id="accountHolder" name="accountHolder" value="${user.accountHolder}"
							class="form-control">
					</div>
					
					</div>
					<div class="col-xs-5">
						<div class="col-xs-12">계좌번호</div>
						<div class="col-xs-12 form-group">
						<input type="text" id="accountNum" name="accountNum" value="${user.accountNum}"
							class="form-control">
						</div>
					</div>				
				</div>
				
			</form>					
		</div>
		<!-- 포인트출금 end -->			

	</div>
	<!-- 포인트관리 end-->
			
			
	<!-- 캠핑 start-->
	<div id="campContainer" class="container">
		
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">캠핑장 예약내역</h4>
			</div>					
		</div>
		
		<form id="campForm">
			<input type="hidden" id="campPaymentSender" name="campPaymentSender" value="${payment.paymentSender}">
			<input type="hidden" id="campPaymentReceiver" name="campPaymentReceiver" value="${payment.paymentReceiver}">
			<input type="hidden" id="campPaymentCode" name="campPaymentCode" value="${payment.paymentCode}">
		
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
								예약대기/결제대기								
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
				<h4 class="text-info">경매 확정내역</h4>
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
				<h4 class="text-info">결제 정보</h4>
			</div>					
		</div>
		
		<form id="payForm">
		
			<!-- camp start -->
			<input type="hidden" id="reservationNo" name="reservationNo" value="${campReservation.reservationNo}">
			<input type="hidden" id="reservationRegDate" name="reservationRegDate" value="${campReservation.reservationRegDate}">
			<input type="hidden" id="reservationStartDate" name="reservationStartDate" value="${campReservation.reservationStartDate}">
			<input type="hidden" id="reservationEndDate" name="reservationEndDate" value="${campReservation.reservationEndDate}">
			<input type="hidden" id="reservationUserName" name="reservationUserName" value="${campReservation.reservationUserName}">	
			<input type="hidden" id="reservationStatus" name="reservationStatus" value="${campReservation.reservationStatus}">
			<input type="hidden" id="camp.user.campName" name="camp.user.campName" value="${campReservation.camp.user.campName}">
			<input type="hidden" id="rCampNo" name="camp.campNo" value="${campReservation.camp.campNo}">
			<input type="hidden" id="camp.campImg1" name="camp.campImg1" value="${campReservation.camp.campImg1}">
			<input type="hidden" id="rMainSiteNo" name="mainSite.mainSiteNo" value="${campReservation.mainSite.mainSiteNo}">
			<input type="hidden" id="mainSite.mainSiteType" name="mainSite.mainSiteType" value="${campReservation.mainSite.mainSiteType}">
			<input type="hidden" id="useNum" name="useNum" value="${campReservation.useNum}">	
			<input type="hidden" id="totalPaymentPrice" name="totalPaymentPrice" value="${campReservation.totalPaymentPrice}">			
			<!-- camp end -->
			
			<input type="hidden" id="paymentSender" name="paymentSender" value="unknownPS">
			<input type="hidden" id="paymentReceiver" name="paymentReceiver" value="${payment.paymentReceiver}">	
			<input type="hidden" id="paymentCode" name="paymentCode" value="unknownPC">	
			<input type="hidden" id="pointChargeTotal" name="pointChargeTotal" value="0">
			<input type="hidden" id="paymentProductPriceTotal" name="paymentProductPriceTotal" value="0">
			<input type="hidden" id="impUid" name="impUid" value="unknownUid">			
			
			<div class="row">
				<div id="paySecond" class="row">			
					<div class="col-xs-4">
					    <div class="row">	
					        <label class="col-xs-12"># 결제 전체금액</label>
					        <div class="col-xs-12 form-group">
					            <input type="number" id="tempPriceTotal" name="tempPriceTotal" value="${campReservation.totalPaymentPrice}" class="form-control" disabled>
					        </div>    <!-- disabled ${payment.paymentProductPriceTotal} -->
					    </div>								
					</div>
					<div class="col-xs-2">
					    <div class="row">	
					        <label class="col-xs-12">* 포인트 사용</label>
					        <div class="col-xs-12 form-group">					       
					            <input type="checkbox" id="paymentMethodSecond" name="paymentMethodSecond" value="point"/>
					        </div>
					    </div>								
					</div>
					<div class="col-xs-2">
					    <div class="row">	
					        <label class="col-xs-12">* 보유 포인트</label>
					        <div class="col-xs-12 form-group">
					            <input type="text" id="currentPoint" name="currentPoint" value="${user.havingPoint}" class="form-control" disabled>
					        </div>
					    </div>								
					</div>
					<div class="col-xs-2">
					    <div class="row">	
					        <label class="col-xs-12">* 사용 포인트</label>
					        <div class="col-xs-12 form-group">
					            <input type="number" id="paymentPriceTotalSecond" name="paymentPriceTotalSecond" value="0" min="1" max="${user.havingPoint}" class="form-control" readonly>
					        </div>
					    </div>								
					</div>
					<div class="col-xs-2">
					    <div class="row">	
					        <label class="col-xs-12"></label>
					        <br>
					        <div class="col-xs-12 form-group">
					            <button id="useAllPoint" type="button" class="btn btn-info">전액사용</button>
					        </div>
					    </div>								
					</div>
				<hr>	
				</div>						
							
				<div class="row">	
					<div class="col-xs-2">	
						<div class="row">
							<label for="card">* 결제 방법</label>				
						</div>						
						<br>
						<div class="row">
							<input type="radio" id="method_card" name="paymentMethod" value="card">
					    	<label for="method_card">신용카드/간편결제</label>		
						</div>	
						<div class="row">
							<input type="radio" id="method_samsung" name="paymentMethod" value="samsung">
					   		<label for="method_samsung">삼성페이</label>
						</div>	
						<div class="row">
							<input type="radio" id="method_trans" name="paymentMethod" value="trans">
					    	<label for="method_trans">실시간계좌이체</label>
						</div>		
						<div class="row">
							<input type="radio" id="method_vbank" name="paymentMethod" value="vbank">
					    	<label for="method_vbank">가상계좌</label>				
						</div>			
						<div class="row">
							<input type="radio" id="method_phone" name="paymentMethod" value="phone">
					    	<label for="method_phone">휴대폰소액결제</label>
						</div>			
					</div>
			
					<div class="col-xs-10">
						<br>				
						<div class="row">
							<label class="col-xs-2">* 상품명</label>
							<div class="col-md-4 form-group">
								<input type="text" id="paymentProduct" name="paymentProduct" value="-" class="form-control" readonly>
							</div>
							<label class="col-xs-2">* 결제 금액</label>
							<div class="col-md-4 form-group">
								<input type="text" id="paymentPriceTotal" name="paymentPriceTotal" value="-" class="form-control" readonly>
							</div>										
						</div>				
						<div class="row">
							<label class="col-xs-2">* 상품참조번호</label>
							<div class="col-md-10 form-group">
								<input type="text" id="paymentReferenceNum" name="paymentReferenceNum" value="-" class="form-control" readonly>
							</div>
						</div>						
						<div class="row">
							<label class="col-xs-2">* 구매자 이름</label>
							<div class="col-md-4 form-group">
								<input type="text" id="pay_buyerName" name="pay_buyerName" value="${user.name}" class="form-control" disabled>
							</div>
							<label class="col-xs-2">* 구매자 연락처</label>
							<div class="col-md-4 form-group">
								<input type="text" id="pay_buyerTel" name="pay_buyerTel" value="${user.phone}" class="form-control" disabled>
							</div>									
						</div>
						<div class="row">				
							<label class="col-xs-2">* 구매자 이메일</label>
							<div class="col-md-10 form-group">
								<input type="text" id="pay_buyerEmail" name="pay_buyerEmail" value="${user.id}" class="form-control" disabled>
							</div>	
						</div>
					</div>
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
	<div id="pointButtonContainer" class="container">
		<div class="row">		
			<div class="col-xs-2">
				<button id="point_showWithDraw" type="button" class="btn btn-warning" value="1">포인트 출금</button>
			</div>			
			<div class="col-xs-2 col-xs-offset-5">
	            <button id="point_withdrawButton" type="button" class="btn btn-primary">포인트 출금요청</button>
	        </div>	        	    	        
	        <div class="col-xs-2 col-xs-offset-1">
	            <button id="point_chargeButton" type="button" class="btn btn-primary">포인트 구매</button>
	        </div>
		</div>
	</div>
	<!-- 포인트관리 버튼 end -->
	
	
	<!-- 캠핑 버튼 start -->
	<div id="campButtonContainer" class="container">
		<div class="row">		
			<div class="col-xs-2 col-xs-offset-10">
	            <button id="camp_pay" type="button" class="btn btn-primary">예약내역 결제</button>
	        </div>	        	    	        	
		</div>
	</div>
	<!-- 캠핑 버튼 end -->


</body>

</html>