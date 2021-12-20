<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<title>중고 경매</title>
	
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
 
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	
	<style>
		.productThumbnails{
			height : 490px;
		}
	</style>
	
</head>
<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div id="b-deals" class="services-box main-timeline-box">
		<div class="container col-lg-10">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-box">
						<h2>Auction</h2>
					</div>
				</div>
			</div>
			<div>
				<button id="crawling" class="btn btn-common">상품 크롤링하기!</button>			
			</div>
			<div class="row">
			
			<c:forEach var="product" items="${list}">
				<div class="col-lg-3 col-sm-6 productThumbnails">
					<figure class="effect-service">
						<div>
							<img src="${product.productImg1}" width="100%" height="100%"/>
						</div>
						<span hidden="">${product.auctionProductNo }</span>
						<h4>${product.auctionProductName}</h4>
						<div>조회수 : ${product.productViewCount }</div>
						<div>경매 시작가 : ${product.startBidPrice }</div>
						<div>희망 낙찰가 : ${product.hopefulBidPrice }</div>
						<div>경매 잔여 시간 : ${product.remainAuctionTime}</div>
						<span>${product.hashtag1}&nbsp;${product.hashtag2}&nbsp;${product.hashtag2}</span>
						<p></p>
					</figure>
				</div>
			</c:forEach>
			</div>
			
		</div>
		<div class="col-lg-3"></div>
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
	
	<script type="text/javascript">
		
	$(function(){
		
		
		
		$('.effect-service').on('click',function(){
			const productNo = $(this).children('span').text();
			window.location.href = '/auction/getAuctionProduct?auctionProductNo='+productNo;
		});
	
		//크롤링 버튼
		$('#crawling').on("click", function(){
			alert("크롤링이 시작되었습니다.");
			$(this).attr('disabled', true);
			$.ajax( 
					{
						url : "/auction/rest/crawling",
						method : "GET" ,
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							alert(JSONData.isSuccess);
							$(this).attr('disabled', false);
						}
				});
		});	
		
	});
	
	let page = 0;
	
	$(window).scroll(function() {
		//console.log($(window).scrollTop());
		//console.log(e);
	    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	page += 1;
	    	console.log(page);
	    	$.ajax(
					{
						url : "/auction/rest/InfiniteScroll",
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						dataType : "json",
						async : false,
						data : JSON.stringify({
							currentPage : page
						}),
						success : function(JSONData,status){
								console.log(JSONData);
								
						}
					});
	    		}
		});
		
		
	
	</script>
</body>
</html>