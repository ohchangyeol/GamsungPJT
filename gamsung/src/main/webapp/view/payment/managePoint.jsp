<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

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
		    <input type="hidden" id="paymentReceiver" name="paymentReceiver" value="${user.id}">
		    <input type="hidden" id="paymentCode" name="paymentCode" value="P1">
		    
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
	    <input type="hidden" id="paymentReceiver" name="paymentReceiver" value="${user.id}">
	    <input type="hidden" id="paymentMethod" name="paymentMethod" value="2">
	    <input type="hidden" id="paymentCode" name="paymentCode" value="P2">
	
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
