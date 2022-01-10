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
  	
  	
  	<!-- ### listPayment resources Start ### -->
 	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
 	<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script> 	
  	
  	<script type="text/javascript">
  				
		$(document).ready(function(){ 
									
			var table = $("#myTable").DataTable({
				"columnDefs": [{
			        "defaultContent": "-",
			        "targets": "_all"
			      }],
				pageLength: 100,
				bPaginate: true,	
				processing: true,
				serverSide: false,
				responsive: true,
				scrollX: true,
				scrollY: 550,
				ordering: true,				
				searching: true,
				footerCallback:function(){
					
					var api = this.api(), data;
					var result = 0;
					
					api.column(4, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(4).footer()).html(result.toLocaleString()+'원'); 
					
					result=0;
					api.column(10, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(10).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(11, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(11).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(12, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(12).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(14, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(14).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(15, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(15).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(16, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(16).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(20, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(20).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(21, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(21).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(22, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(22).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(23, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(23).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(24, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(24).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(25, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(25).footer()).html(result.toLocaleString()+'원');
					
					result=0;
					api.column(26, {search:'applied'}).data().each(function(data,index){
					    result += parseFloat(data);
					});
					$(api.column(26).footer()).html(result.toLocaleString()+'원');				
				
				},

				columnDefs: [
					{ targets: 0,  width: 80 },
					{ targets: 1,  width: 250 },
					{ targets: 2,  width: 250 },
					{ targets: 3,  width: 250 },
					{ targets: 4,  width: 100 },
					{ targets: 5,  width: 200 },
					{ targets: 6,  width: 80 },
					{ targets: 7,  width: 300 },
					{ targets: 8,  width: 80 },
					{ targets: 9,  width: 100 },
					{ targets: 10, width: 100 },
					{ targets: 11, width: 100 },
					{ targets: 12, width: 100 },
					{ targets: 13, width: 80 },
					{ targets: 14, width: 120 },
					{ targets: 15, width: 120 },
					{ targets: 16, width: 120 },
					{ targets: 17, width: 200 },
					{ targets: 18, width: 80 },
					{ targets: 19, width: 300 },
					{ targets: 20, width: 100 },
					{ targets: 21, width: 100 },
					{ targets: 22, width: 100 },
					{ targets: 23, width: 100 },
					{ targets: 24, width: 120 },
					{ targets: 25, width: 120 },
					{ targets: 26, width: 120 }
				],
				ajax : {
				    url :"/payment/rest/listPayment",
				    type :"POST",
				    dataSrc :''	    
				},
				columns : [
				    {targets: 0, data: "paymentNo"},
				    {targets: 1, data: "paymentProduct"},
				    {targets: 2, data: "paymentSender"},
				    {targets: 3, data: "paymentReceiver"},
				    {targets: 4, data: "paymentProductPriceTotal"},
				    {targets: 5, data: "paymentRegTime"},
				    {targets: 6, data: "paymentCode"},
				    {targets: 7, data: "paymentReferenceNum"},
				    {targets: 8, data: "paymentReferenceFee"},
				    {targets: 9, data: "paymentMethod"},
				    {targets: 10, data: "paymentPriceTotal"},
				    {targets: 11, data: "paymentPricePay"},
				    {targets: 12, data: "paymentPriceFee"},
				    {targets: 13, data: "paymentMethodSecond"},
				    {targets: 14, data: "paymentPriceTotalSecond"},
				    {targets: 15, data: "paymentPricePaySecond"},
				    {targets: 16, data: "paymentPriceFeeSecond"},
				    {targets: 17, data: "paymentRefundRegTime"},
				    {targets: 18, data: "paymentRefundCode"},
				    {targets: 19, data: "paymentRefundReferenceNum"},
				    {targets: 20, data: "paymentRefundReferenceFee"},
				    {targets: 21, data: "paymentRefundPriceTotal"},
				    {targets: 22, data: "paymentRefundPricePay"},
				    {targets: 23, data: "paymentRefundPriceFee"},
				    {targets: 24, data: "paymentRefundPriceTotalSecond"},
				    {targets: 25, data: "paymentRefundPricePaySecond"},
				    {targets: 26, data: "paymentRefundPriceFeeSecond"}
				]
			
			});
			
			/* Column별 검색기능 추가 */
			$('#myTable_filter').prepend(
					'<input type="text" id="fromDate" placeholder="등록일 YYYY-MM-DD">~'
					+'<input type="text" id="toDate" placeholder="등록일 YYYY-MM-DD"> '
					+'<select id="select"></select>');
			
			$('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
				$('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
			});
				
			$('.dataTables_filter input').unbind().bind('keyup', function () {
		        var colIndex = document.querySelector('#select').selectedIndex;
		        table.column(colIndex).search(this.value).draw();
		    });
			
			$.fn.dataTable.ext.search.push(
	    	    
		    	function(settings, data, dataIndex){
	    	    
		    		var min = Date.parse($('#fromDate').val());
	    	        var max = Date.parse($('#toDate').val());
	    	        
	    	        var targetDate = Date.parse(data[6]);
	    	 
	    	        if( (isNaN(min) && isNaN(max) ) || 
	    	            (isNaN(min) && targetDate <= max )|| 
	    	            ( min <= targetDate && isNaN(max) ) ||
	    	            ( targetDate >= min && targetDate <= max) ){ 
	    	                return true;
	    	        }
	    	        return false;
	    		}
		    )
		    
		    $('#toDate, #fromDate').unbind().bind('keyup',function(){
		        table.draw();
		    })

	        
		});
		

	</script>
  	<!-- ### listPayment resources End ### -->
  	
  	
  	<!-- 버튼 Start -->
  	<script type="text/javascript">  	

		
	</script>
	<!-- 버튼 End --> 	 	

	<style>
	    body > div.container-fluid{
	        margin-top: 20px;
	    }
	    
	    .form-horizontal .control-label{
	        text-align: left;
	    }
	
	</style>	


</head>

<body>

<div class="container-fluid">	
	<div class="col-xs-1">
	</div>
	<div class="col-xs-10">
		<form role="form">
			
			<!-- 상단 Start -->
			<div class="row">  
				<h3 class="col-sm-2 mb-0">&nbsp;&nbsp;&nbsp;&nbsp;결제내역</h3>	  		
			</div>
			<!-- 상단 End -->
				
			<hr class="divider-w mt-10 mb-20">
			
			<!-- 목록 Start -->			   
			<div class="row">
		
			<table id="myTable" class="ui celled table">
				
				<thead>
					<tr>		  	  
						<th>결제번호</th>
						<th>상품</th>
						<th>주는사람</th>
						<th>받는사람</th>
						<th>총 금액</th>
						<th>등록일자</th>
						<th>결제유형</th>
						<th>참조번호</th>
						<th>수수료율</th>
						<th>일반결제유형</th>
						<th>일반결제총금액</th>
						<th>일반결제실금액</th>
						<th>일반결제수수료</th>
						<th>포인트결제</th>
						<th>포인트결제총금액</th>
						<th>포인트결제실금액</th>
						<th>포인트결제수수료</th>
						<th>환불일자</th>
						<th>환불유형</th>
						<th>환불참조번호</th>
						<th>환불수수료율</th>
						<th>환불일반총금액</th>
						<th>환불일반실금액</th>
						<th>환불결제수수료</th>
						<th>환불포인트총금액</th>
						<th>환불포인트실금액</th>
						<th>환불포인트수수료</th>	  
					</tr>
				</thead>
				
				<tfoot>
					<tr>
						<!-- 하단 합계 -->
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</tfoot>
				
			</table>		
		       	  
			</div>
			<!-- 목록 End -->		
	
		</form>
		</div>
	<div class="col-xs-1">
	</div>			
</div>

</body>
</html>