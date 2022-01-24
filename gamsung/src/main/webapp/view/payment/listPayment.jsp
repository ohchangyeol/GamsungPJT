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
 
    <!-- Favicons -->
    <meta name="msapplication-TileImage" content="/resources/images/favicons/ms-icon-144x144.png">    
    <meta name="msapplication-TileColor" content="#ffffff">  
    <meta name="theme-color" content="#ffffff">
   
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
 	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
  	
  	
  	<script type="text/javascript">
  				
		$(document).ready(function(){ 
			
			const userRole = $("#userRole").val();
			
			if(userRole == "ADMIN"){
				
				let table = $("#myTable").DataTable({
					"columnDefs": [{
				        "defaultContent": "-",
				        "targets": "_all"
				      }],
		    	    "language": {
		    	        "emptyTable": "데이터 없음",
		    	        "lengthMenu": "페이지당 _MENU_ 개 보기",
		    	        "info": "현재 _START_ - _END_ / _TOTAL_건",
		    	        "infoEmpty": "데이터 없음",
		    	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
		    	        "search": "에서 검색: ",
		    	        "zeroRecords": "일치하는 데이터 없음",
		    	        "loadingRecords": "로딩중...",
		    	        "processing":     "처리중...",
		    	        "paginate": {
		    	            "next": " 다음 ",
		    	            "previous": " 이전 "
		    	        }
		    	    },
					pageLength: 10,
					bPaginate: true,
					bLengthChange: true,
	                lengthMenu : [ [ 3, 5, 10, 25, 50, 100, -1 ], [ 3, 5, 10,  25, 50, 100, "All" ] ],
					processing: true,
					serverSide: false,
					responsive: true,
					scrollX: true,
					scrollY: 450,
					ordering: true,				
					searching: true,
					footerCallback:function(){
						
						var api = this.api(), data;
						var result = 0;
						
						api.column(5, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(5).footer()).html(result.toLocaleString()+'원'); 
						
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
						api.column(13, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(13).footer()).html(result.toLocaleString()+'원');
						
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
						api.column(17, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(17).footer()).html(result.toLocaleString()+'원');
						
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
						
						result=0;
						api.column(27, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(27).footer()).html(result.toLocaleString()+'원');				
					
					},

					columnDefs: [
						{ targets: 0,  width: 170 },
						{ targets: 1,  width: 120 },
						{ targets: 2,  width: 450 },
						{ targets: 3,  width: 270 },
						{ targets: 4,  width: 270 },
						{ targets: 5,  width: 120 },
						{ targets: 6,  width: 220 },
						{ targets: 7,  width: 220 },
						{ targets: 8,  width: 370 },
						{ targets: 9,  width: 100 },
						{ targets: 10, width: 140 },
						{ targets: 11, width: 120 },
						{ targets: 12, width: 120 },
						{ targets: 13, width: 120 },
						{ targets: 14, width: 100 },
						{ targets: 15, width: 140 },
						{ targets: 16, width: 140 },
						{ targets: 17, width: 140 },
						{ targets: 18, width: 220 },
						{ targets: 19, width: 100 },
						{ targets: 20, width: 320 },
						{ targets: 21, width: 120 },
						{ targets: 22, width: 120 },
						{ targets: 23, width: 120 },
						{ targets: 24, width: 120 },
						{ targets: 25, width: 140 },
						{ targets: 26, width: 140 },
						{ targets: 27, width: 140 }
					],
					ajax : {
					    url :"/payment/rest/listPayment",
					    type :"POST",
					    dataSrc :''	    
					},
					columns : [
					    {targets: 0, data: "paymentNo"},
					    {targets: 1, data: "paymentStatus",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        switch (data) {
				                        case 1: info = '포인트이동'; break;
				                        case 2: info = '결제완료'; break;
				                        case 3: info = '환불완료'; break;				 
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 2, data: "paymentProduct"},
					    {targets: 3, data: "paymentSender"},
					    {targets: 4, data: "paymentReceiver"},
					    {targets: 5, data: "paymentProductPriceTotal"},
					    {targets: 6, data: "paymentRegTime"},
					    {targets: 7, data: "paymentCode",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        switch (data) {
				                        case 'P0': info = '포인트 관리자'; break;
				                        case 'P1': info = '포인트 구매'; break;
				                        case 'P2': info = '포인트 출금'; break;
				                        case 'R0': info = '캠핑 관리자'; break;
				                        case 'R1': info = '캠핑 예약'; break;
				                        case 'R2': info = '캠핑 예약 변경'; break;
				                        case 'R3': info = '캠핑 예약환불 2일전'; break;
				                        case 'R4': info = '캠핑 예약환불 3일전'; break;
				                        case 'R5': info = '캠핑 예약환불 4일전'; break;
				                        case 'R6': info = '캠핑 예약환불 5일전'; break;
				                        case 'R7': info = '캠핑 예약환불 6일전'; break;
				                        case 'R8': info = '캠핑 예약환불 7일전'; break;
				                        case 'A0': info = '경매 관리자'; break;
				                        case 'A1': info = '경매 A등급 상품등록 수수료'; break;
				                        case 'A2': info = '경매 B등급 상품등록 수수료'; break;
				                        case 'A3': info = '경매 C등급 상품등록 수수료'; break;
				                        case 'A4': info = '경매 D등급 상품등록 수수료'; break;
				                        case 'A5': info = '경매 E등급 상품등록 수수료'; break;
				                        case 'A6': info = '경매 A등급 중도철회 수수료'; break;
				                        case 'A7': info = '경매 B등급 중도철회 수수료'; break;
				                        case 'A8': info = '경매 C등급 중도철회 수수료'; break;
				                        case 'A9': info = '경매 D등급 중도철회 수수료'; break;
				                        case 'A10': info = '경매 E등급 중도철회 수수료'; break;
				                        case 'A11': info = '경매 A등급 경매확정 수수료'; break;
				                        case 'A12': info = '경매 B등급 경매확정 수수료'; break;
				                        case 'A13': info = '경매 C등급 경매확정 수수료'; break;
				                        case 'A14': info = '경매 D등급 경매확정 수수료'; break;
				                        case 'A15': info = '경매 E등급 경매확정 수수료'; break;
				                        case 'A16': info = '경매 A등급 낙찰취소 수수료'; break;
				                        case 'A17': info = '경매 B등급 낙찰취소 수수료'; break;
				                        case 'A18': info = '경매 C등급 낙찰취소 수수료'; break;
				                        case 'A19': info = '경매 D등급 낙찰취소 수수료'; break;
				                        case 'A20': info = '경매 E등급 낙찰취소 수수료'; break;
				                        case 'T0': info = '양도양수 관리자'; break;
				                        case 'T1': info = '양도양수'; break;               
			                        }
			                        return info;
			                    }
			                    return data;
			                }   
					    },
					    {targets: 8, data: "paymentReferenceNum",
					    	render: function ( data, type, row, meta ) {
					    		
					    		var refNum = "";				    							    		
					    		console.log(data);
					    				    							    		
					    		if(data.charAt(1) == 'R'){
					    			
					    			refNum = data.substring(1,7);
					    			refNum = refNum.trim();
					    			
					    			console.log("R : "+data.charAt(1));
					    			console.log("R : "+refNum);
					    			
					    			return '<a href="/campGeneral/getMyReservation?reservationNo='+refNum+'">'+data+' 상세내역</a>';
					    			
					    		} else if(data.substring(1,5) == 'PROD'){
					    			
					    			refNum = data.substring(1,10);
					    			refNum = refNum.trim();
					    			
					    			console.log("P : "+data.substring(1,5));
					    			console.log("P : "+refNum);
					    			
					    			return '<a href="/auction/getAuctionProduct?auctionProductNo='+refNum+'">'+data+' 상세내역</a>';
					    			
					    		} else {
					    			return data;
					    		}   		
					        }	    
					    },
					    {targets: 9, data: "paymentReferenceFee"},
					    {targets: 10, data: "paymentMethod",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        switch (data) {
				                        case 'card': info = '신용카드/간편결제'; break;
				                        case 'samsung': info = '삼성페이'; break;
				                        case 'trans': info = '실시간 계좌이체'; break;
				                        case 'vbank': info = '가상 계좌'; break;
				                        case 'phone': info = '휴대폰 소액결제'; break;				 
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 11, data: "paymentPriceTotal",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 12, data: "paymentPricePay",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 13, data: "paymentPriceFee",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 14, data: "paymentMethodSecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == 'point') {
			                        	info = '포인트사용';
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 15, data: "paymentPriceTotalSecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 16, data: "paymentPricePaySecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 17, data: "paymentPriceFeeSecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 18, data: "paymentRefundRegTime"},
					    {targets: 19, data: "paymentRefundCode"},
					    {targets: 20, data: "paymentRefundReferenceNum"},
					    {targets: 21, data: "paymentRefundReferenceFee"},
					    {targets: 22, data: "paymentRefundPriceTotal",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 23, data: "paymentRefundPricePay",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 24, data: "paymentRefundPriceFee",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 25, data: "paymentRefundPriceTotalSecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 26, data: "paymentRefundPricePaySecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 27, data: "paymentRefundPriceFeeSecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    }
					]
				
				});
			
			/////////////////////////////////////////////////////////////////////////////////// 
			} else {
				
				let table = $("#myTable").DataTable({
					"columnDefs": [{
				        "defaultContent": "-",
				        "targets": "_all"
				      }],
		    	    "language": {
		    	        "emptyTable": "데이터 없음",
		    	        "lengthMenu": "페이지당 _MENU_ 개 보기",
		    	        "info": "현재 _START_ - _END_ / _TOTAL_건",
		    	        "infoEmpty": "데이터 없음",
		    	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
		    	        "search": "에서 검색: ",
		    	        "zeroRecords": "일치하는 데이터 없음",
		    	        "loadingRecords": "로딩중...",
		    	        "processing":     "처리중...",
		    	        "paginate": {
		    	            "next": " 다음 ",
		    	            "previous": " 이전 "
		    	        }
		    	    },
					pageLength: 10,
					bPaginate: true,
					bLengthChange: true,
	                lengthMenu : [ [ 3, 5, 10, 25, -1 ], [ 3, 5, 10, 25, "All" ] ],
					processing: true,
					serverSide: false,
					responsive: true,
					scrollX: true,
					scrollY: 450,
					ordering: true,				
					searching: true,
					footerCallback:function(){
						
						var api = this.api(), data;
						var result = 0;
						
						api.column(5, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(5).footer()).html(result.toLocaleString()+'원'); 
						
						result=0;
						api.column(10, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(10).footer()).html(result.toLocaleString()+'원');
												
						result=0;
						api.column(12, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(12).footer()).html(result.toLocaleString()+'원');
						
						result=0;
						api.column(16, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(16).footer()).html(result.toLocaleString()+'원');						
						
						result=0;
						api.column(17, {search:'applied'}).data().each(function(data,index){
						    result += parseFloat(data);
						});
						$(api.column(17).footer()).html(result.toLocaleString()+'원');
					
					},

					columnDefs: [
						{ targets: 0,  width: 120 },
						{ targets: 1,  width: 120 },
						{ targets: 2,  width: 450 },
						{ targets: 3,  width: 270 },
						{ targets: 4,  width: 270 },
						{ targets: 5,  width: 120 },
						{ targets: 6,  width: 220 },
						{ targets: 7,  width: 220 },
						{ targets: 8,  width: 370 },
						{ targets: 9,  width: 140 },
						{ targets: 10, width: 140 },
						{ targets: 11, width: 120 },
						{ targets: 12, width: 140 },
						{ targets: 13, width: 220 },
						{ targets: 14, width: 100 },
						{ targets: 15, width: 320 },
						{ targets: 16, width: 120 },
						{ targets: 17, width: 140 }
					],
					ajax : {
					    url :"/payment/rest/listPayment",
					    type :"POST",
					    dataSrc :''	    
					},
					columns : [
					    {targets: 0, data: "paymentNo"},
					    {targets: 1, data: "paymentStatus",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        switch (data) {
				                        case 1: info = '포인트이동'; break;
				                        case 2: info = '결제완료'; break;
				                        case 3: info = '환불완료'; break;					 
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 2, data: "paymentProduct"},
					    {targets: 3, data: "paymentSender"},
					    {targets: 4, data: "paymentReceiver"},
					    {targets: 5, data: "paymentProductPriceTotal"},
					    {targets: 6, data: "paymentRegTime"},
					    {targets: 7, data: "paymentCode",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        switch (data) {
				                        case 'P0': info = '포인트 관리자'; break;
				                        case 'P1': info = '포인트 구매'; break;
				                        case 'P2': info = '포인트 출금'; break;
				                        case 'R0': info = '캠핑 관리자'; break;
				                        case 'R1': info = '캠핑 예약'; break;
				                        case 'R2': info = '캠핑 예약 변경'; break;
				                        case 'R3': info = '캠핑 예약환불 2일전'; break;
				                        case 'R4': info = '캠핑 예약환불 3일전'; break;
				                        case 'R5': info = '캠핑 예약환불 4일전'; break;
				                        case 'R6': info = '캠핑 예약환불 5일전'; break;
				                        case 'R7': info = '캠핑 예약환불 6일전'; break;
				                        case 'R8': info = '캠핑 예약환불 7일전'; break;
				                        case 'A0': info = '경매 관리자'; break;
				                        case 'A1': info = '경매 A등급 상품등록 수수료'; break;
				                        case 'A2': info = '경매 B등급 상품등록 수수료'; break;
				                        case 'A3': info = '경매 C등급 상품등록 수수료'; break;
				                        case 'A4': info = '경매 D등급 상품등록 수수료'; break;
				                        case 'A5': info = '경매 E등급 상품등록 수수료'; break;
				                        case 'A6': info = '경매 A등급 중도철회 수수료'; break;
				                        case 'A7': info = '경매 B등급 중도철회 수수료'; break;
				                        case 'A8': info = '경매 C등급 중도철회 수수료'; break;
				                        case 'A9': info = '경매 D등급 중도철회 수수료'; break;
				                        case 'A10': info = '경매 E등급 중도철회 수수료'; break;
				                        case 'A11': info = '경매 A등급 경매확정 수수료'; break;
				                        case 'A12': info = '경매 B등급 경매확정 수수료'; break;
				                        case 'A13': info = '경매 C등급 경매확정 수수료'; break;
				                        case 'A14': info = '경매 D등급 경매확정 수수료'; break;
				                        case 'A15': info = '경매 E등급 경매확정 수수료'; break;
				                        case 'A16': info = '경매 A등급 낙찰취소 수수료'; break;
				                        case 'A17': info = '경매 B등급 낙찰취소 수수료'; break;
				                        case 'A18': info = '경매 C등급 낙찰취소 수수료'; break;
				                        case 'A19': info = '경매 D등급 낙찰취소 수수료'; break;
				                        case 'A20': info = '경매 E등급 낙찰취소 수수료'; break;
				                        case 'T0': info = '양도양수 관리자'; break;
				                        case 'T1': info = '양도양수'; break;               
			                        }
			                        return info;
			                    }
			                    return data;
			                }   
					    },
					    {targets: 8, data: "paymentReferenceNum",
					    	render: function ( data, type, row, meta ) {
					    		
					    		var refNum = "";				    							    		
					    		console.log(data);
					    				    							    		
					    		if(data.charAt(1) == 'R'){
					    			
					    			refNum = data.substring(1,7);
					    			refNum = refNum.trim();
					    			
					    			console.log("R : "+data.charAt(1));
					    			console.log("R : "+refNum);
					    			
					    			return '<a href="/campGeneral/getMyReservation?reservationNo='+refNum+'">'+data+' 상세내역</a>';
					    			
					    		} else if(data.substring(1,5) == 'PROD'){
					    			
					    			refNum = data.substring(1,10);
					    			refNum = refNum.trim();
					    			
					    			console.log("P : "+data.substring(1,5));
					    			console.log("P : "+refNum);
					    			
					    			return '<a href="/auction/getAuctionProduct?auctionProductNo='+refNum+'">'+data+' 상세내역</a>';
					    			
					    		} else {
					    			return data;
					    		}   		
					        }	    
					    },
					    {targets: 9, data: "paymentMethod",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        switch (data) {
				                        case 'card': info = '신용카드/간편결제'; break;
				                        case 'samsung': info = '삼성페이'; break;
				                        case 'trans': info = '실시간 계좌이체'; break;
				                        case 'vbank': info = '가상 계좌'; break;
				                        case 'phone': info = '휴대폰 소액결제'; break;				 
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 10, data: "paymentPriceTotal",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 11, data: "paymentMethodSecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == 'point') {
			                        	info = '포인트사용';
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 12, data: "paymentPriceTotalSecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 13, data: "paymentRefundRegTime"},
					    {targets: 14, data: "paymentRefundCode"},
					    {targets: 15, data: "paymentRefundReferenceNum"},
					    {targets: 16, data: "paymentRefundPriceTotal",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    },
					    {targets: 17, data: "paymentRefundPriceTotalSecond",
					    	render: function(data, type) {
			                    if (type === 'display') {
			                        let info = '';		 
			                        if (data == '0') {
			                        	info = '';
			                        } else {
			                        	info = data;
			                        }
			                        return info;
			                    }
			                    return data;
			                }  					    
					    }
				
					]
				
				});
				
			}			
			
			/* Column별 검색기능 추가 */
			$('#myTable_filter').prepend('<select id="select"></select>');
			
			$('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
				$('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
			});
				
			$('.dataTables_filter input').unbind().bind('keyup', function () {
		        var colIndex = document.querySelector('#select').selectedIndex;
		        table.column(colIndex).search(this.value).draw();
		    });
			
	        
		});
		

	</script>
  	<!-- ### listPayment resources End ### -->
  	
  	
  	<!-- 버튼 Start -->
  	<script type="text/javascript">  	

		
	</script>
	<!-- 버튼 End --> 	 	

	<style>
	    body > div.container-fluid{
	        margin-top: 60px;
	    }
	    
	    .form-horizontal .control-label{
	        text-align: left;
	    	
	</style>	


</head>

<body>

	<!-- header -->
	<c:if test="${user.role != 'BUSINESS' }">
		<jsp:include page="/view/common/header.jsp"/>
	</c:if>
	
	<c:if test="${user.role == 'BUSINESS' }">
		<jsp:include page="/view/common/headerCampBusiness.jsp" />
	</c:if>

<div class="container-fluid">	
	<div class="col-xs-1">
	</div>
	<div class="col-xs-10">
		<form role="form">
		
	  	<input type="hidden" id="userRole" name="userRole" value="${user.role}">
		<input type="hidden" id="userId" name="userId" value="${user.id}">
			
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
						<th>상태</th>
						<th>상품</th>
						<th>주는사람</th>
						<th>받는사람</th>
						<th>총 금액</th>
						<th>결제일자</th>
						<th>결제유형</th>
						<th>참조번호</th>
							<c:if test="${user.role == 'ADMIN' }">
								<th>수수료(%)</th>
							</c:if>						
						<th>일반결제유형</th>
						<th>일반결제총금액</th>
							<c:if test="${user.role == 'ADMIN' }">
								<th>일반결제실금액</th>
								<th>일반결제수수료</th>
							</c:if>						
						<th>포인트결제</th>
						<th>포인트결제총금액</th>
							<c:if test="${user.role == 'ADMIN' }">
								<th>포인트결제실금액</th>
								<th>포인트결제수수료</th>
							</c:if>						
						<th>환불일자</th>
						<th>환불유형</th>
						<th>환불참조번호</th>
							<c:if test="${user.role == 'ADMIN' }">
								<th>환불수수료(%)</th>
							</c:if>							
						<th>환불일반총금액</th>
							<c:if test="${user.role == 'ADMIN' }">
								<th>환불일반총금액</th>
								<th>환불일반수수료</th>
							</c:if>
						<th>환불포인트총금액</th>						
							<c:if test="${user.role == 'ADMIN' }">
								<th>환불포인트실금액</th>
								<th>환불포인트수수료</th>	  
							</c:if>							
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
							<c:if test="${user.role == 'ADMIN' }">
								<th></th>
							</c:if>
						<th></th>
						<th></th>
							<c:if test="${user.role == 'ADMIN' }">
								<th></th>
								<th></th>
							</c:if>
						<th></th>
						<th></th>
							<c:if test="${user.role == 'ADMIN' }">
								<th></th>
								<th></th>
							</c:if>
						<th></th>
						<th></th>
						<th></th>
							<c:if test="${user.role == 'ADMIN' }">
								<th></th>
							</c:if>
						<th></th>
							<c:if test="${user.role == 'ADMIN' }">
								<th></th>
								<th></th>
							</c:if>
						<th></th>
							<c:if test="${user.role == 'ADMIN' }">
								<th></th>
								<th></th>
							</c:if>
					</tr>
				</tfoot>
				
			</table>		
		       	  
			</div>
			<!-- 목록 End -->		
	
		</form>
		</div>
	</div>			
</div>

</body>
</html>