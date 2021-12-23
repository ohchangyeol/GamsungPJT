<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<title>상품 등록</title>
	
	<link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/custom.css">
    <link rel="stylesheet" href="/resources/css/flashy.min.css">
    <link rel="stylesheet" href="/resources/css/flaticon.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/pogo-slider.min.css">
    <link rel="stylesheet" href="/resources/css/responsive.css">
    <link rel="stylesheet" href="/resources/css/responsiveslides.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/timeline.css">   
    <link rel="stylesheet" href="/resources/css/dropzone.css">   
 
 	<style>
 		.filebox{
 			display: inline-block;
 			padding: 50px 50px;
 		}
		.filebox label { 
			display: inline-block; 
			padding: 50px 50px; 
			color: #999; 
			font-size: inherit; 
			line-height: normal; 
			vertical-align: middle; 
			background-color: #fdfdfd; 
			cursor: pointer; 
			border: 1px solid #ebebeb; 
			border-bottom-color: #e2e2e2; 
			border-radius: .25em; 
		} 
		
		.filebox input[type="file"] {
			 position: absolute; 
			 width: 1px; 
			 height: 1px; 
			 padding: 0; 
			 margin: -1px; 
			 overflow: hidden; 
			 clip:rect(0,0,0,0); 
			 border: 0; 
		 }
		 
		 #file{
		 	display: flex;
		 	flex-direction: row;
		 	justify-content: space-between;
		 }
		 .form-group{
		 	display: flex;
		 }
		 .time{
		 	display: flex;
		 }
	</style>
	
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

	
</head>
<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div id="b-deals" class="services-box main-timeline-box">
		<div class="container col-lg-12">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-box">
						<h2>add Product</h2>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<div class="container col-lg-3"></div>
	<div class="container col-lg-6">
		<form class="form-horizontal center">
		
		  <div class="form-group">
		    <label for=auctionProductName class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-8">
		    	<input type="hidden" name="auctionProductName" class="form-control" width="100%" value="${auctionProduct.auctionProductName}">
		      <span>${auctionProduct.auctionProductName}</span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="startBidPrice" class="col-sm-offset-1 col-sm-3 control-label">경매 시작가</label>
		    <div class="col-sm-4">
		    	<input type="hidden" name="startBidPrice" class="form-control" width="100%" value="${auctionProduct.startBidPrice}">
		    	<span>${auctionProduct.startBidPrice}</span>  
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="hopefulBidPrice" class="col-sm-offset-1 col-sm-3 control-label">희망 낙찰가</label>
		    <div class="col-sm-4">
		    	<input type="hidden" name="hopefulBidPrice" class="form-control" width="100%" value="${auctionProduct.hopefulBidPrice}">
		    	<span>${auctionProduct.hopefulBidPrice}</span>  	
		   	</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="bidUnit" class="col-sm-offset-1 col-sm-3 control-label">입찰 단위</label>
		    <div class="col-sm-4">
		    	<input type="hidden" name="bidUnit" class="form-control" width="100%" value="${auctionProduct.bidUnit}">
		    	<span>${auctionProduct.bidUnit}</span>   
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="auctionStartTime" class="col-sm-offset-1 col-sm-3 control-label">경매 시작 시간</label>
		    <div class="col-sm-8 time">
		    	<input type="hidden" name="auctionStartTime" class="form-control" width="100%" value="${auctionProduct.auctionStartTime}">
		    	<span>${auctionProduct.auctionStartTime}</span>	
		    </div>
		  </div>

		
		<div class="form-group">
		    <label for="auctionEndTime" class="col-sm-offset-1 col-sm-3 control-label">경매 종료 시간</label>
		    <div class="col-sm-8 time">
		    	<input type="hidden" name="auctionEndTime" class="form-control" width="100%" value="${auctionProduct.auctionEndTime}">
		    	<span>${auctionProduct.auctionEndTime}</span>
		    </div>	
		</div>
		
		<div class="form-group">
		    <label for="bidableGrade" class="col-sm-offset-1 col-sm-3 control-label">입찰 가능 등급</label>
		    <div class="col-sm-4">
		    	<input type="hidden" name="bidableGrade" class="form-control" width="100%" value="${auctionProduct.bidableGrade}">
		    	<span>${auctionProduct.bidableGrade}</span>
		    </div>
		  </div>
		  <div id="file">
			  <div class="filebox"> 
			  	<input type="hidden" name="productImg1" class="form-control" width="100%" value="${auctionProduct.productImg1}">
			  	<img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg1}" width="100%" height="100%"> 
			  </div>
			   <div class="filebox">
			   	<input type="hidden" name="productImg2" class="form-control" width="100%" value="${auctionProduct.productImg2}">
			  	<img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg2}" width="100%" height="100%">  
			  </div>
			   <div class="filebox"> 
			  	<input type="hidden" name="productImg3" class="form-control" width="100%" value="${auctionProduct.productImg3}">
			  	<img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg3}" width="100%" height="100%">  
			  </div>
			  	<div class="filebox">
			  	<input type="hidden" name="productImg4" class="form-control" width="100%" value="${auctionProduct.productImg4}">
			  	<img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg4}" width="100%" height="100%">  
			  </div>
			   <div class="filebox">
			   	<input type="hidden" name="productImg5" class="form-control" width="100%" value="${auctionProduct.productImg5}"> 
			  	<img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg5}" width="100%" height="100%">  
			  </div>
		</div>
		<div class="container col-lg-3"></div>  	  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-12 text-center">
		      <button id="tempSave" type="button" class="btn btn-primary">임시저장</button>
		      <button id="confirm" type="button" class="btn btn-primary">등록확정</button>
			</div>
		  </div>
		</form>
 	</div>
	
	
	
	<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p class="footer-company-name">All Rights Reserved. &copy; 2018 <a href="#">Evento Christmas</a> Design By : <a href="https://html.design/">html design</a></p>
				</div>
			</div>
		</div>
	</footer>
	
	<script src="/resources/javascript/bootstrap.min.js"></script>
	<script src="/resources/javascript/contact-form-script.js"></script>
	<script src="/resources/javascript/custom.js"></script>
	<script src="/resources/javascript/form-validator.min.js"></script>
	<script src="/resources/javascript/images-loded.min.js"></script>
	<script src="/resources/javascript/isotope.min.js"></script>
	<script src="/resources/javascript/jquery.magnific-popup.min.js"></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.pogo-slider.min.js"></script>
	<script src="/resources/javascript/popper.min.js"></script>
	<script src="/resources/javascript/responsiveslides.min.js"></script>
	<script src="/resources/javascript/slider-index.js"></script>
	<script src="/resources/javascript/smoothscroll.js"></script>
	
	<script>
		$(function(){
			$("#tempSave").on('click',function(){
				$('form').attr('method','post').attr('action','/auction/tempSaveAuctionProduct').submit();
			});
			$("#confirm").on('click',function(){
				$('form').attr('method','post').attr('action','/auction/addAuctionProduct').submit();
			});
		});
	</script>
</body>
</html>