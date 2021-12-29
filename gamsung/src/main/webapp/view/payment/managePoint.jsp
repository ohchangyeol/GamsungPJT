<%@ page contentType="text/html; charset=EUC-KR" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"	crossorigin="anonymous">
	
	<script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>

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
				var count1 = $("#count1").val();
				var count2 = $("#count2").val();
				var count3 = $("#count3").val();
								
				var pointChargeTotaltext = (95000*count1) + (10000*count2) + (1000*count3);
				var chargePriceTotaltext = (100000*count1) + (10000*count2) + (1000*count3);
								
				$("#pointChargeTotal").val(comma(pointChargeTotaltext));
				$("#chargePriceTotal").val(comma(chargePriceTotaltext));								
			});
			
			$("#count2").on("propertychange change keyup paste input", function() {
				var count1 = $("#count1").val();
				var count2 = $("#count2").val();
				var count3 = $("#count3").val();
								
				var pointChargeTotaltext = (95000*count1) + (10000*count2) + (1000*count3);
				var chargePriceTotaltext = (100000*count1) + (10000*count2) + (1000*count3);
								
				$("#pointChargeTotal").val(comma(pointChargeTotaltext));
				$("#chargePriceTotal").val(comma(chargePriceTotaltext));	
			});
						
			$("#count3").on("propertychange change keyup paste input", function() {
				var count1 = $("#count1").val();
				var count2 = $("#count2").val();
				var count3 = $("#count3").val();
								
				var pointChargeTotaltext = (100000*count1) + (10000*count2) + (1000*count3);
				var chargePriceTotaltext = (95000*count1) + (10000*count2) + (1000*count3);
								
				$("#pointChargeTotal").val(comma(pointChargeTotaltext));
				$("#chargePriceTotal").val(comma(chargePriceTotaltext));	
			});
			
		
			$("#pointWithdrawTotal").on("propertychange change keyup paste input", function() {				
				
				var havingPoint = $("#havingPoint").val();
				var withdrawPoint = $("#pointWithdrawTotal").val();	
				
				var havingPointUc = uncomma(havingPoint);
				var withdrawPointUc = uncomma(withdrawPoint);				
				var afterWithdrawUc = havingPointUc - withdrawPointUc;				
				
				if( afterWithdrawUc < 0 ){
					alert("출금 할 포인트가 부족합니다.");
					$("#pointWithdrawTotal").val(0);
				}
				
				$("#pointWithdrawTotal").val(comma(withdrawPointUc));								
				$("#pointAfterWithdraw").val(comma(afterWithdrawUc));
							
			});			
			
			$("#charge").on("click" , function() {
				alert("충전 되었습니다.");		
			});
			
			$("#withdraw").on("click" , function() {
				alert("출금 되었습니다.");							
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
				<input type="text" id="havingPoint" name="havingPoint" value="${user.havingPoint}" class="form-control">
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
		    
		    <div class="col-lg-5">
		    	<div class="row">
			    	<div class="col-xs-12">충전 포인트</div>
			    </div>	
			    <div class="row">	
			    	<br>
					<div class="col-md-10 form-group">
						<input type="text" id="pointChargeTotal" name="pointChargeTotal" value="" class="form-control" readonly>
					</div>
				</div>	
	
				<div class="row">
					<br>
					<div class="col-xs-12">충전 결제금액</div>
				</div>	
			    <div class="row">
			    	<br>	
					<div class="col-md-10 form-group">
						<input type="text" id="chargePriceTotal" name="chargePriceTotal" value="" class="form-control" readonly>
					</div>
				</div>	
		    </div>
		    
		    <div class="col-lg-2">
		      	<div id="charge" style="background-color: #00aaff; width: 150px; height: 150px; border-radius: 10px; display: flex; justify-content: center; align-items: center">
		      	<div style="font-size:30px; color:white">충전</div></div>				    	
    		</div>   
    	</div>
    	
    	<hr>
    	
    	<div class="row">
			<div class="page-header">
	       		<h3 class=" text-info">포인트 출금</h3>
	   		</div>
		</div>
		
		<div class="row">
			<div class="col-lg-10">
				<div class="row">
					<br>
			    	<div class="col-xs-2">출금 포인트</div>
					<div class="col-md-3 form-group">
						<input type="text" id="pointWithdrawTotal" name="pointWithdrawTotal" value="" class="form-control">
					</div>
						
					<div class="col-xs-2 col-xs-offset-1">남은 포인트</div>
					<div class="col-md-3 form-group">
						<input type="text" id="pointAfterWithdraw" name="pointAfterWithdraw" value="" class="form-control" readonly>
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

	</div>

</body>

</html>
