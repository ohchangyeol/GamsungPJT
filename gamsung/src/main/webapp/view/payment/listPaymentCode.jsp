<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

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

	<script type="text/javascript">		
	
		$(function() {		
			
			$(".btn-info").hide();
			
			$("body").on("click","#addType",function () {			
				var result = confirm("추가 하시겠습니까?"); 
				if(result) { 
					alert("추가 되었습니다.");
					$(this).parent().parent().parent().attr("method" , "POST").attr("action" , "/payment/addPaymentCode").submit();
				} else { 
					alert("취소 되었습니다.");					
				}
			});	
			
			$(".btn-warning").on("click" , function() {
								
				if($(this).val()==0){
					$(this).val(1); 
		        } else{
		        	$(this).val(0);
		        }

		        var isHide=$(this).val();

		        if(isHide==1){
		            // Button 숨기기
		           $(this).html('수정'); 
		           $(this).parent().next().children().hide();
		           $(this).parent().parent().find('input').attr('readonly', true);
		        } else{
		            // Button 보이기
		           $(this).html('취소'); 
		           $(this).parent().next().children().show();
		           $(this).parent().parent().find('input').attr('readonly', false);
		        }			

			});
			
			$(".btn-info").on("click" , function() {
				var result = confirm("변경 하시겠습니까?"); 
				if(result) { 
					alert("변경 되었습니다.");
					$(this).parent().parent().parent().attr("method" , "POST").attr("action" , "/payment/updatePaymentCode").submit();
				} else { 
					alert("취소 되었습니다.");					
				}
				
			});			
			
			var count = 0;
			$("#addform").on("click" , function() {	
				$("#ori").append(
						"<form id='addOne'>"
							+"<div class='row'>"
								+"<div class='col-xs-10 form-group'>"
									+"<hr class='divider-w mt-10 mb-20'>"
								+"</div>"
							+"</div>"
							+"<div class='row'>"
								+"<div class='col-xs-1 form-group'>"
								+"<input type='text' id='paymentCodeRegNum' name='paymentCodeRegNum' value='' class='form-control'>"
								+"</div>"
								+"<div class='col-xs-1 form-group'>"
								+"<input type='text' id='paymentCode' name='paymentCode' value='' class='form-control'>"
								+"</div>"
								+"<div class='col-xs-2 form-group'>"
								+"<input type='number' id='paymentCodeRangeStart' name='paymentCodeRangeStart' class='form-control' value='0'>"
								+"</div>"
								+"<div class='col-xs-2 form-group'>"
								+"<input type='number' id='paymentCodeRangeEnd' name='paymentCodeRangeEnd' class='form-control' value='0'>"
								+"</div>"
								+"<div class='col-xs-3 form-group'>"
								+"<input type='text' id='paymentCodeInfo' name='paymentCodeInfo' class='form-control' value=''>"
								+"</div>"
								+"<div class='col-xs-1 form-group'>"
								+"<input type='number' id='paymentCodeFee' name='paymentCodeFee' class='form-control' value='0' min='0' max='100'>"
								+"</div>"
								+"<div class='col-xs-1 form-group'>"
								+	"<button id='addType' type='button' class='btn btn-primary'>등록</button>"
								+"</div>"
							+"</div>"
						+"</form>"	);
				    
				count++; 
				if( count == 1){
					$("#addform").attr('disabled', true); 
				} 			
			});		
		});				
	
	</script>
	
</head>
<body>

	<!-- header -->
	<c:if test="${user.role != 'BUSINESS' }">
		<jsp:include page="/view/common/header.jsp"/>
	</c:if>

	<div class="container" style="padding-top: 50px; padding-bottom: 100px; padding-right: 15px; padding-left: 15px; margin-right: auto;margin-left: auto;">
	
		<div class="row">
			<div class="sub-title">
				<h3>결제코드 관리</h3>			
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-10">
				<hr class="divider-w mt-10 mb-20">
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-1">순번</div>
			<div class="col-xs-1">결제코드</div>
			<div class="col-xs-2">구간시작값</div>
			<div class="col-xs-2">구간종료값</div>
			<div class="col-xs-3">설명</div>
			<div class="col-xs-1">수수료(%)</div>
			<div class="col-xs-1"></div>
			<div class="col-xs-1"></div>
		</div>
		
		<br>
		
		<ori id="ori">
		<c:set var="i" value="0" />
			<c:forEach var="payment" items="${list}">
				<c:set var="i" value="${ i+1 }" />
					<form id="${i}">
					
						<div class="row">	
							<c:if test="${ payment.paymentCode == 'A0'|| payment.paymentCode == 'P0'|| payment.paymentCode == 'R0'|| payment.paymentCode == 'T0'}">
								<div class="col-xs-10 form-group">
									<hr class="divider-w mt-10 mb-20">
								</div>
							</c:if>
						</div>		
										
						<div class="row" >
							<div class="col-xs-1 form-group">
								<input type="text" id="paymentCodeRegNum" name="paymentCodeRegNum" value="${payment.paymentCodeRegNum}" class="form-control" readonly>
							</div>
											
							<div class="col-xs-1 form-group">
								<input type="text" id="paymentCode" name="paymentCode" value="${payment.paymentCode}" class="form-control" readonly>
							</div>
					
							<div class="col-xs-2 form-group">
								<input type="number" id="paymentCodeRangeStart" name="paymentCodeRangeStart" value="${payment.paymentCodeRangeStart}" class="form-control" value="" readonly>
							</div>
					
							<div class="col-xs-2 form-group">
								<input type="number" id="paymentCodeRangeEnd" name="paymentCodeRangeEnd" value="${payment.paymentCodeRangeEnd}" class="form-control" value="" readonly>
							</div>
							
							<div class="col-xs-3 form-group">
								<input type="text" id="paymentCodeInfo" name="paymentCodeInfo" value="${payment.paymentCodeInfo}" class="form-control" readonly>
							</div>
							
							<div class="col-xs-1 form-group">
								<input type="number" id="paymentCodeFee" name="paymentCodeFee" value="${payment.paymentCodeFee}" class="form-control" value="0" min="0" max="100" readonly>
							</div>

							<div class="col-xs-1 form-group">
								<button id="updateTry" type="button" class="btn btn-warning" value="1">수정</button>
							</div>
														
							<div class="col-xs-1 form-group">
								<button id="update" type="button" class="btn btn-info">변경</button>
							</div>

							<c:if test="${fn:length(list) == i }">
								<div class="col-xs-1 form-group">
									<button id="addform" type="button" class="btn btn-primary">추가</button>
								</div>
							</c:if>															
						</div>
	
					</form>
			</c:forEach>
		</ori>
	</div>
</body>
</html>