<%@ page contentType="text/html; charset=EUC-KR" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="/resources/lib/jquery/jquery.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
  	<link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css"></link>

	<style>
		.container {
			padding-top: 70px;
			padding-right: 15px;
			padding-left: 15px;
			margin-right: auto;
			margin-left: auto;
		}
		
		@media ( min-width : 768px) {
			.container {
				width: 750px;
			}
		}
		
		@media ( min-width : 992px) {
			.container {
				width: 970px;
			}
		}
		
		@media ( min-width : 1200px) {
			.container {
				width: 1170px;
			}
		}
		
		.container-fluid {
			padding-right: 15px;
			padding-left: 15px;
			margin-right: auto;
			margin-left: auto;
		}
	</style>

	<!-- JavaScript -->
	<script type="text/javascript">
		
		function calculateNumber() {
			var count1 = $("#count1").val();
			var count2 = $("#count2").val();
			var count3 = $("#count3").val();
							
			var pointChargeTotaltext = (95000*count1) + (10000*count2) + (1000*count3);
			var chargePriceTotaltext = (100000*count1) + (10000*count2) + (1000*count3);
							
			$("#pointChargeTotal").val(comma(pointChargeTotaltext));
			$("#paymentPriceTotal").val(comma(chargePriceTotaltext));	
		}
			
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		function uncomma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}		
		
		$(function() {
			
			$(document).ready(function() { 
				$("#havingPoint").val(comma($("#havingPoint").val()));		
			});
						
			$("#count1").on("propertychange change keyup paste input", function() {				
				calculateNumber();								
			});
			
			$("#count2").on("propertychange change keyup paste input", function() {
				calculateNumber();
			});
						
			$("#count3").on("propertychange change keyup paste input", function() {
				calculateNumber();
			});
			
		
			$("#pointWithdrawTotal").on("propertychange change keyup paste input", function() {				
				
				var havingPoint = $("#havingPoint").val();
				var withdrawPoint = $("#pointWithdrawTotal").val();	
				var refundFee = $("#paymentRefundReferenceFee").val();
				
				var havingPointUc = uncomma(havingPoint);
				var withdrawPointUc = uncomma(withdrawPoint);				
				var afterWithdrawUc = havingPointUc - withdrawPointUc;				
				var cashRefund = withdrawPointUc * ( 1 - refundFee * 0.01);
		
				if( afterWithdrawUc < 0 ){
					alert("출금 할 포인트가 부족합니다.");
					$("#pointWithdrawTotal").val("0");
				}
				
				$("#pointWithdrawTotal").val(comma(withdrawPointUc));								
				$("#pointAfterWithdraw").val(comma(afterWithdrawUc));
				$("#paymentRefundPriceTotal").val(comma(cashRefund));			
				
			});			
			
			$("#charge").on("click" , function() {
				alert("충전 되었습니다.");
				$("#chargeForm").attr("method" , "POST").attr("action" , "/payment/addMakePayment").submit();
			});
			
			$("#withdraw").on("click" , function() {
				alert("출금 되었습니다.");
				$("#withdrawForm").attr("method" , "POST").attr("action" , "/payment/addRefundPayment").submit();
			});
			
			$("#cancle").on("click" , function() {
				alert("취소 되었습니다.");
				window.history.back();			
			});
				
		});			 

	</script>		

</head>

<body>

	<div class="container">	
		
		<div class="row">
			<div class="page-header">
	       		<h1 class=" text-info">포인트 관리</h1>
	    	</div>
		</div>
		
		<div class="row">
			<div class="page-header">
	       		<h3 class=" text-info">포인트 충전</h3>
	   		</div>
		</div>
	
		<div class="row">
			<div class="col-xs-2">보유 포인트</div>
			<div class="col-md-3 form-group">
				<input type="text" id="havingPoint" name="havingPoint" value="${user.havingPoint}" class="form-control" readonly>
			</div>    
		</div>
		
		<hr>
		
		<div class="row">
			<div class="col-lg-5">
				<div class="row">
					<div class="col-lg-7">
						<div class="col-xs-12">- 95,000 원 -</div>
						<div class="col-xs-12 form-group">
							<input type="text" id="100k" name="100k" value="100,000 P 충전" class="form-control" readonly>
						</div>
						
						<div class="col-xs-12">- 10,000 원 -</div>
						<div class="col-xs-12 form-group">
							<input type="text" id="10k" name="10k" value="10,000 P 충전" class="form-control" readonly>
						</div>
						
						<div class="col-xs-12">- 1,000 원 -</div>						
						<div class="col-xs-12 form-group">
							<input type="text" id="1k" name="1k" value="1,000 P 충전" class="form-control" readonly>
						</div>
					</div>
					
					<div class="col-lg-5">
						<div class="col-xs-12">- 수량 -</div>
						<div class="col-xs-12 form-group">
							<input type="number" id="count1" name="count1" value="0" min="0" max="10" class="form-control">
						</div>
						<div class="col-xs-12">- 수량 -</div>
						<div class="col-xs-12 form-group">
							<input type="number" id="count2" name="count2" value="0" min="0" max="10" class="form-control">
						</div>				
						<div class="col-xs-12">- 수량 -</div>		
						<div class="col-xs-12 form-group">
							<input type="number" id="count3" name="count3" value="0" min="0" max="10" class="form-control">
						</div>						
					</div>		   	
					
				</div>												 
		    </div>
		    
		    <form id="chargeForm">
		    <input type="hidden" id="paymentSender" name="paymentSender" value="admin">
		    <input type="hidden" id="paymentReceiver" name="paymentReceiver" value="${user.id}">
		    <input type="hidden" id="paymentCode" name="paymentCode" value="P1">
		    <input type="hidden" id="paymentReferenceNum" name="paymentReferenceNum" value="pointCharge(PointManager)">
		    <input type="hidden" id="paymentReferenceFee" name="paymentReferenceFee" value="${pointChargeFee}">
		    
		    <div class="col-lg-5">
	  	    	<div class="col-xs-12">충전 포인트</div>
				<div class="col-md-10 form-group">
					<input type="text" id="pointChargeTotal" name="pointChargeTotal" value="" class="form-control" readonly>
				</div>
		
				<div class="col-xs-12">충전 결제금액(원)</div>
				<div class="col-md-10 form-group">
					<input type="text" id="paymentPriceTotal" name="paymentPriceTotal" value="" class="form-control" readonly>
				</div>
				
				<div class="row">
					<div class="col-xs-12">결제 방법</div>
				</div>					
				<div class="row">						
					<div class="col-xs-3">
						<input type="radio" id="cash" name="paymentMethod" value="2" checked>
						<label for="cash">현금결제</label>
					</div>  							
					<div class="col-xs-3">
						<input type="radio" id="card" name="paymentMethod" value="3">
						<label for="card">카드결제</label>
					</div>  							
					<div class="col-xs-3">
						<input type="radio" id="simple" name="paymentMethod" value="4">
						<label for="simple">간편결제</label>
					</div>						
				</div>
		    </div>
		    
		    <div class="col-lg-2">
		      	<div id="charge" style="background-color: #00aaff; width: 150px; height: 150px; border-radius: 10px; display: flex; justify-content: center; align-items: center">
		      	<div style="font-size:30px; color:white">충전</div></div>				    	
    		</div>
    		</form>   
    	</div>
    	
    	<hr>
    	
    	<div class="row">
			<div class="page-header">
	       		<h3 class=" text-info">포인트 출금</h3>
	   		</div>
		</div>
		
		<form id="withdrawForm">
		<input type="hidden" id="paymentSender" name="paymentSender" value="admin">
	    <input type="hidden" id="paymentReceiver" name="paymentReceiver" value="${user.id}">
		<input type="hidden" id="paymentRefundCode" name="paymentRefundCode" value="P2">
	    <input type="hidden" id="paymentRefundReferenceNum" name="paymentRefundReferenceNum" value="pointWithdraw(PointManager)">
		<input type="hidden" id="paymentRefundReferenceFee" name="paymentRefundReferenceFee" value="${pointWithdrawFee}">
		
		<div class="row">
			<div class="col-lg-10">
				<div class="row">
					<br>
			    	<div class="col-xs-2">출금포인트</div>
					<div class="col-md-2 form-group">
						<input type="text" id="pointWithdrawTotal" name="pointWithdrawTotal" value="" class="form-control">
					</div>
						
					<div class="col-xs-2">잔여포인트</div>
					<div class="col-md-2 form-group">
						<input type="text" id="pointAfterWithdraw" name="pointAfterWithdraw" value="" class="form-control" readonly>
					</div>
					
					<div class="col-xs-2">현금지급액(원)</div>
					<div class="col-md-2 form-group">
						<input type="text" id="paymentRefundPriceTotal" name="paymentRefundPriceTotal" value="" class="form-control" readonly>
					</div>
				</div>
				
				<hr>
				
				<div class="row">
					<div class="col-xs-2">입금 계좌정보</div>
				</div>
								
				<div class="row">
				<br>				
				   	<div class="col-xs-3 form-group">
						<input type="text" id="bank" name="bank" value="${user.bank}" class="form-control">
					</div>
			    	<div class="col-xs-3 form-group">
						<input type="text" id="accountHolder" name="accountHolder" value="${user.accountHolder}" class="form-control">
					</div>
					<div class="col-xs-5 form-group">
						<input type="text" id="accountNum" name="accountNum" value="${user.accountNum}" class="form-control">
					</div>
				</div>	
											 
		    </div>
		    
		    <div class="col-lg-2 text-center" style="">
		      	<div id="withdraw" style="background-color: #ff4400; width: 150px; height: 150px; border-radius: 10px; display: flex; justify-content: center; align-items: center">
		      	<div style="font-size:30px; color:white">출금</div></div>		  
    		</div>   
    	</div>
    	</form>    	
    	
	</div>

</body>
</html>
