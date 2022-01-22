<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${auctionProduct.auctionProductName}</title>

<jsp:include page="/resources/commonLib.jsp"></jsp:include>

<style type="text/css">
	.product-title {
	  overflow: hidden;
	  text-overflow: ellipsis;
	  white-space: nowrap;
	}
</style>

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="main">
			<div class="alert alert-success" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-cog fa-spin"></i><strong></strong></div>
			<div class="alert alert-info" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-cutlery"></i><strong></strong></div>
			<div class="alert alert-warning" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-diamond"></i><strong></strong></div>
			<div class="alert alert-danger" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-coffee"></i><strong></strong></div>
			<section class="module">
				<div class="container">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<h2 class="product-title">${auctionProduct.auctionProductName}</h2>
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-4 mb-sm-40">	
						<c:if test="${!empty auctionProduct.auctionProductSubDetail}">
							<a><img class="firstImg" src="${fn:replace(auctionProduct.productImg1,'230x230ex','665x750ex')}" alt="Single Product Image" /></a>
							 <ul class="product-gallery">
								<c:if test="${!empty auctionProduct.productImg2}">
									<li><img class="secondImg" src="${auctionProduct.productImg2}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg3}">
									<li><img class="thirdImg" src="${auctionProduct.productImg3}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg4}">
									<li><img class="fourthImg" src="${auctionProduct.productImg4}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg5}">
									<li><img class="fifthImg" src="${auctionProduct.productImg5}" alt="Single Product" /></li>
								</c:if>
							</ul>
						</c:if>
						<c:if test="${empty auctionProduct.auctionProductSubDetail}">
							<a><img class="firstImg" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg1}" alt="Single Product Image" /></a>
							 <ul class="product-gallery">
								<c:if test="${!empty auctionProduct.productImg2}">
									<li><img class="secondImg" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg2}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg3}">
									<li><img class="thirdImg" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg3}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg4}">
									<li><img class="fourthImg" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg4}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg5}">
									<li><img class="fifthImg" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg5}" alt="Single Product" /></li>
								</c:if>
							</ul>
						</c:if>
						</div>
						<div class="col-sm-6">
						<div class="row mb-20">
							<div class="col-sm-12">
								<span class="badge badge-info userNick">${registrantInfo.user.auctionGrade}LV</span>
								<span>${auctionProduct.registrantNickName}</span>
								<span id="avgRating"></span>
								<a class="open-tab section-scroll" href="#reviews">${ratingReview.avgRating}</a>
								<button type="button" id="report-btn" data-userid = "${user.id}" class="badge badge-danger" data-reporttype = "2" data-receivername = "${auctionProduct.registrantNickName}" >신고</button>
							</div>
						</div>
						<div class="row mb-20">
							<div class="col-sm-12">
								<div class="price font-alt">
									<h5 class="font-alt">시작가 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${auctionProduct.startBidPrice}" />원</h5>
									<input type="hidden" id="startBidPrice" value="${auctionProduct.startBidPrice}">
									<h5 class="font-alt">희망 낙찰가 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${auctionProduct.hopefulBidPrice}" />원</h5>
									<h5>입찰 단위 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${auctionProduct.bidUnit}" />원</h5>
									<input type="hidden" id="bidUnit" value="${auctionProduct.bidUnit}">
									<h5>입찰 가능 등급 : ${auctionProduct.bidableGrade}LV 이상</h5>
									<input type="hidden" id="bidableGrade" value="${auctionProduct.bidableGrade}">
								</div>
							</div>
						</div>
						<div class="row mb-20">
							<div class="col-sm-12">
								<div class="description">
									<h3 class="font-alt bidPricing">현재입찰가</h3>
									<h4 id="currentPrice" class="font-alt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${auctionProduct.currentBidPrice}" />원</h4>										
								</div>
							</div>
						</div>
						<input type="hidden" id="auctionProductNo" value="${auctionProduct.auctionProductNo}">
						<div class="row mb-20">
							<c:if test="${!empty sessionScope.user && registrantInfo.user.id ne sessionScope.user.id}">
								<div id="bid" class="col-sm-5">
									<a id="bidBtn" class="btn btn-lg btn-block btn-round btn-b">입찰</a>
								</div>
							</c:if>
							<span></span>
							<c:if test="${auctionProduct.successfulBidderId eq sessionScope.user.id}">
								<div id="cancel" class="col-sm-5">
									<c:if test="${auctionProduct.auctionStatus eq 'WAIT'}">
										<a id="cancelBtn" class="btn btn-sm btn-block btn-round btn-b">낙찰취소</a>
										<a id="confirmBtn" class="btn btn-sm btn-block btn-round btn-b">경매확정</a>			
									</c:if>
									<c:if test="${empty auctionProduct.productRegDate && auctionProduct.auctionStatus eq 'CONFIRM' }">
										<a class="btn btn-sm btn-block btn-round btn-b video-pop-up" href="/auction/addReview/${auctionProduct.auctionProductNo}">리뷰쓰기</a>
									</c:if>
								</div>
							</c:if>
							<c:if test="${registrantInfo.user.id eq sessionScope.user.id && auctionProduct.auctionStatus eq 'START'}">
								<div class="row">
									<div class="col-sm-6">
										<a id="updateBtn" class="btn btn-lg btn-block btn-round btn-b">수정</a>
									</div>
									<div class="col-sm-6">
										<a id="deleteBtn" class="btn btn-lg btn-block btn-round btn-b">중도철회</a>
									</div>								
								</div>
							</c:if>
						</div>
						<div class="font15 time-title"></div>
						<div class="time font40">
							<span id="auctionStartTime" hidden="hidden">${auctionProduct.auctionStartTime}</span>
							<span id="auctionEndTime" hidden="hidden">${auctionProduct.auctionEndTime}</span>
							<c:if test="${!empty sessionScope.user}">
								<c:if test="${fn:indexOf(auctionProduct.remainAuctionTime,'-') == -1}">
								  <span class="hours"></span>
								  <span class="col">:</span>
								  <span class="minutes"></span>
								  <span class="col">:</span>
								  <span class="seconds"></span>
								</c:if>
							</c:if>
							<c:if test="${empty sessionScope.user}">
								<span style="color: red">로그인 시 확인 가능합니다.</span>
							</c:if>
						</div>
						<div class="row mb-20">
							<div class="col-sm-12">
								<div class="product_meta">
									<span id = "userInfo">
										<c:if test="${!empty sessionScope.user && !empty auctionInfo && auctionInfo.bidderCount != 0}">
											${user.nickName}님은 ${auctionInfo.bidderCount}명 중 ${auctionInfo.bidderRank}등 입니다.
										</c:if>
									</span>
									<input type="hidden" id="userId" value="${user.id}"/>
									<input type="hidden" id="nickName" value="${user.nickName}"/>
								</div>
							</div>
						</div>							
					</div>
					</div>
					<div class="row mt-70">
						<div class="col-sm-12">
						<div class="well well-lg"><strong id="realTimeViewCount"></strong></div>
							<ul class="nav nav-tabs font-alt" role="tablist">
								<li class="active">
									<a href="#description" data-toggle="tab">
										<span class="icon-tools-2"></span>Description
									</a>
								</li>
								<li>
									<a id="reviewBtn" href="#reviews" data-toggle="tab">
										<span class="icon-tools-2"></span>Reviews 
									</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="description">
								<c:if test="${empty auctionProduct.auctionProductDetail}">
									<p>관리자가 등록한 상품입니다.</p>
									<p><a href="https://www.coupang.com${auctionProduct.auctionProductSubDetail}">상품 정보</a></p>								
								</c:if>
								<c:if test="${!empty auctionProduct.auctionProductDetail}">
									<p>${auctionProduct.auctionProductDetail}</p>							
								</c:if>
								</div>
								<div class="tab-pane" id="reviews">
									<div id="ratingReview" class="comments reviews">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>			
			<hr class="divider-w">
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">경매 추천 상품</h2>
							<div class="module-subtitle font-serif">12개의 상품이 추천 되며 한 사람이 여러개의 상품을 등록할 수 없습니다.</div>
						</div>
					</div>
					<div class="row">
                  <div class="owl-carousel text-center" data-items="4" data-pagination="false" data-navigation="false">
                    <c:forEach var="auctionProduct" items="${productList}">
                      <div class="owl-item">
                        <div class="col-sm-12">
                          <div class="ex-product">
                            <c:if test="${!empty auctionProduct.auctionProductSubDetail}">
                              <a><img class="shop-item-img" src="${auctionProduct.productImg1}" /></a>
                            </c:if>
                            <c:if test="${empty auctionProduct.auctionProductSubDetail}">
                              <a><img class="shop-item-img"
                                  src="/uploadfiles/auctionimg/product/${auctionProduct.productImg1}" /></a>
                            </c:if>
                            <input type="hidden" value="${auctionProduct.auctionProductNo}">
                            <h4 class="shop-item-title"><a>${auctionProduct.auctionProductName}</a></h4>
                            <h5>
                              <fmt:formatNumber type="number" maxFractionDigits="3"
                                value="${auctionProduct.hopefulBidPrice}" />원
                            </h5>
                            <h5>${auctionProduct.auctionEndTime}</h5>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                </div>
				</div>
			</section>
			<jsp:include page="../common/footer.jsp"></jsp:include>
		<form>
			<input type="hidden" name="auctionProductNo" value="${auctionProduct.auctionProductNo}">
		</form>
	</main>
	
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="../../resources/js/stomp.min.js"></script>
	<script>

	document.addEventListener("DOMContentLoaded",function(){
		connect();
	});
	
	$(document).ready(function(){
		$('#avgRating').append(ratingMake(${ratingReview.avgRating}))
	});
	
	var stompClient = null;
	var auctionProductNo = document.getElementById('auctionProductNo').value;
	var userId = document.getElementById('userId').value;
	var nickName = document.getElementById('nickName').value;
	
	$(function(){

		auctionProductNo = $('#auctionProductNo').val();
		userId = $('#userId').val(); 
		nickName = $('#nickName').val();

		$('.secondImg').on('click',function(){
			var firstImg = $('.firstImg').attr('src');
			var secondImg = $('.secondImg').attr('src');
			$('.firstImg').attr('src',secondImg.replace('48x48ex','665x750ex'));
			$('.secondImg').attr('src',firstImg.replace('665x750ex','48x48ex'));
		});
		
		$('.thirdImg').on('click',function(){
			var firstImg = $('.firstImg').attr('src');
			var thirdImg = $('.thirdImg').attr('src');
			$('.firstImg').attr('src',thirdImg.replace('48x48ex','665x750ex'));
			$('.thirdImg').attr('src',firstImg.replace('665x750ex','48x48ex'));		
		});	
		
		$('.fourthImg').on('click',function(){
			var firstImg = $('.firstImg').attr('src');
			var fourthImg = $('.fourthImg').attr('src');
			$('.firstImg').attr('src',fourthImg.replace('48x48ex','665x750ex'));
			$('.fourthImg').attr('src',firstImg.replace('665x750ex','48x48ex'));		
		});	
		
		$('.fifthImg').on('click',function(){
			var firstImg = $('.firstImg').attr('src');
			var fifthImg = $('.fifthImg').attr('src');
			$('.firstImg').attr('src',fifthImg.replace('48x48ex','665x750ex'));
			$('.fifthImg').attr('src',firstImg.replace('665x750ex','48x48ex'));
		});	
		//수정 버튼 클릭시 발생 이벤트
		$('#updateBtn').on('click',function(){
			
			if(Number($('#currentPrice').text().replace('원','')) != 0){
				Swal.fire({
			    	text: '입찰자가 있어 수정 불가능 합니다.',
			    	icon: 'warning'
			    })
				return;
			}
			
			if(${!empty auctionProduct.auctionProductSubDetail}){
				Swal.fire({
			    	text: '수정 불가능한 상품입니다.',
			    	icon: 'warning'
			    })
				return;
			}
			
			$('form').attr('method','GET').attr('action','/auction/updateAuctionProduct').submit();
		});
		
		//낙찰 취소 클릭시 발생 이벤트
		$('#cancelBtn').on('click',function(){
			
			if(Number($('#havingPoint').text())< Number( ${auctionProduct.hopefulBidPrice} )*Number( ${cancelFee} )/100 ){
				const price = Number( ${auctionProduct.hopefulBidPrice} )*Number( ${cancelFee} )/100-( Number( $('#havingPoint').text() ) );
				Swal.fire({
					  text: price+'포인트가 부족하여 낙찰취소 할 수 없습니다. 충전페이지로 이동하시겠습니까?',
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '확인',
					  cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
						    Swal.fire({
						    	text: '충전페이지로 이동합니다.',
						    	icon: 'success'
							})
							window.location = "/payment/managePoint"
							return;
						}else{
							Swal.fire({
						    	text: '충전 후 낙찰 취소 가능합니다.',
						    	icon: 'info'
							})
							return;
						}
					})
			}else{
				const priceA = Number( ${auctionProduct.hopefulBidPrice} )*Number( ${cancelFee} )/100
				Swal.fire({
					  text: priceA+'포인트가 차감됩니다. 낙찰취소 하시겠습니까?',
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '확인',
					  cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url : "/auction/rest/updateAuctionStatus/"+auctionProductNo+"/CANCEL",
								method : "GET",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								dataType : "json",
								success : function(JSONData, status) {
									Swal.fire({
								    	text: JSONData.info,
								    	icon: 'info'
									})
									window.location = "/auction/listAuctionProduct";
								}
							});
							return;
						}else{
							Swal.fire({
						    	text: '포인트 사용이 취소 되셨습니다.',
						    	icon: 'info'
							})
							return;
						}
					})
			}
			
		});
		
		//경매 확정 클릭시 발생 이벤트
		$('#confirmBtn').on('click',function(){
			if(Number($('#havingPoint').text())< Number( ${auctionProduct.currentBidPrice} )){
				const price = Number( ${auctionProduct.hopefulBidPrice} )-Number( $('#havingPoint').text() );
				Swal.fire({
					  text: price+'포인트가 부족하여 경매를 확정 지을 수 없습니다. 충전페이지로 이동하시겠습니까?',
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '확인',
					  cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
						    Swal.fire({
						    	text: '충전페이지로 이동합니다.',
						    	icon: 'success'
							})
							window.location = "/payment/managePoint"
							return;
						}else{
							Swal.fire({
						    	text: '충전 후 경매 확정 가능합니다.',
						    	icon: 'info'
							})
							return;
						}
					})
			}else{
				const priceA = Number( ${auctionProduct.currentBidPrice} );
				Swal.fire({
					  text: priceA+'포인트가 차감됩니다. 경매를 확정하시겠습니까?',
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '확인',
					  cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url : "/auction/rest/updateAuctionStatus/"+auctionProductNo+"/CONFIRM",
								method : "GET",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								dataType : "json",
								success : function(JSONData, status) {
									Swal.fire({
								    	text: JSONData.info,
								    	icon: 'info'
									})
									window.location = "/auction/getAuctionProduct?auctionProductNo="+auctionProductNo;
								}
							});
							return;
						}else{
							Swal.fire({
						    	text: '포인트 사용이 취소 되셨습니다.',
						    	icon: 'info'
							})
							return;
						}
					})
			}
		});
		
		//입찰 버튼 클릭시 발생 이벤트
		$('#bidBtn').on('click',function(event){
			
			if($('#bidBtn').attr('disabled') == 'disabled'){
				return;
			}
			
			if(${sessionScope.user.role eq 'BUSINESS'}){
				Swal.fire({
			    	text: '사업자는 이용 불가합니다.',
			    	icon: 'warning'
			    })
  				return;
  			}
			
			var currentPrice = $('#currentPrice').text();
			var startBidPrice = $('#startBidPrice').val();
			var bidUnit = $('#bidUnit').val();
			var bidPrice = $('#bidPrice').val();
			var bidableGrade = ${auctionProduct.bidableGrade};
			var userGrade = ${!empty sessionScope.user.auctionGrade ? sessionScope.user.auctionGrade : 0};
			
			if(bidableGrade > userGrade){
				Swal.fire({
			    	text: '입찰 가능 등급을 확인하세요.',
			    	icon: 'warning'
			    })
				return;
			}
			
			var remainHours = $('.hours').text();
			var remainMinuts = $('.minutes').text();
			var remainSeconds = $('.seconds').text();
			
			if(currentPrice != 0){
				stompClient.send('/app/bid/${auctionProduct.auctionProductNo}',{},JSON.stringify({
					auctionProductNo : auctionProductNo,
					bidPrice : 1*unComma(currentPrice) + 1*unComma(bidUnit)
				}));				
			}else{
				stompClient.send('/app/bid/${auctionProduct.auctionProductNo}',{},JSON.stringify({
					auctionProductNo : auctionProductNo,
					bidPrice : 1*unComma(startBidPrice)
				}));			
			}
		});
		
		//중도 철회 버튼 클릭시 발생 이벤트
		$('#deleteBtn').on('click',function(){
		
			if(Number($('#havingPoint').text())< Number( ${auctionProduct.hopefulBidPrice} )*Number( ${withdrawalFee} )/100 ){
				const price = Number( ${auctionProduct.hopefulBidPrice} )*Number( ${withdrawalFee} )/100-( Number( $('#havingPoint').text() ) );
				Swal.fire({
					  text: price+'포인트가 부족하여 중도철회 할 수 없습니다. 충전페이지로 이동하시겠습니까?',
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '확인',
					  cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
						    Swal.fire({
						    	text: '충전페이지로 이동합니다.',
						    	icon: 'success'
							})
							window.location = "/payment/managePoint"
							return;
						}else{
							Swal.fire({
						    	text: '충전 후 경매 확정 가능합니다.',
						    	icon: 'info'
							})
							return;
						}
					})
			}else{
				const priceA = Number( ${auctionProduct.hopefulBidPrice} )*Number( ${withdrawalFee} )/100;
				Swal.fire({
					  text: priceA+'포인트가 차감됩니다. 중도철회 하시겠습니까?',
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '확인',
					  cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url : "/auction/rest/updateAuctionStatus/"+auctionProductNo+"/WITHDRAWAL",
								method : "GET",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								dataType : "json",
								success : function(JSONData, status) {
									const info = JSONData.info;
									
									if(info.indexOf('성공') != -1){
										stompClient.send('/app/delete/${auctionProduct.auctionProductNo}',{},JSON.stringify({
								        	auctionProductNo : auctionProductNo
								    	}));
									}else{
										Swal.fire({
									    	text: info,
									    	icon: 'info'
										})
									}				
								}
							});
							return;
						}else{
							Swal.fire({
						    	text: '포인트 사용이 취소 되셨습니다.',
						    	icon: 'info'
							})
							return;
						}
					})
			}
		});
		
		
		$('#reviewBtn').on('click',function(){
			$('#ratingReview').empty();
			$.ajax({
					url : "/auction/rest/listAuctionRatingReview/1",
					method : "POST",
					data : JSON.stringify({
						auctionProductNo : auctionProductNo
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					dataType : "json",
					success : function(JSONData, status) {
						console.log(JSONData);
						var stringHtml = '';
						var addReviewCount = 0;
						for (var i = 0; i < JSONData.length; i++) {
							if(JSONData[i].reviewDeleteFlag === "N"){
								var str	='<div class="comment clearfix">'
										+'<div class="comment-content clearfix">'
		                       			+'<div class="comment-author font-alt"><a>'
		                       			+JSONData[i].auctionInfo.user.nickName
		                       			+'</a></div><div>'
		                       			+ratingMake(JSONData[i].avgRating)
		                       			+JSONData[i].avgRating+'점</div>'
		                       			+'<span class="prodName">상품명 : '+JSONData[i].auctionInfo.info.substring(0,30)+'...'+'</span>'
		                       			+'<input type="hidden" value="'+JSONData[i].auctionInfo.auctionProductNo+'"/>'
		                       			+'<div class="comment-body"><p>'
		                       			+JSONData[i].ratingReviewContent
		                       			+'</p></div><div class="comment-meta font-alt">'
		                       			+getDate(JSONData[i].reviewRegDate)
		                       			+nameCheck(JSONData[i].user.id,'${sessionScope.user.id}',JSONData[i].ratingReviewNo)
		                       			if(JSONData[i].commentRegDate == null){
		                       				str += '<c:if test="${registrantInfo.user.id eq sessionScope.user.id}">'
			                       				+'<input type="hidden" value="'+JSONData[i].ratingReviewNo+'"/>'
				                       			+'<button class="btn btn-d btn-circle btn-xs replyBtn" type="button">답글</button>'
				                       			+'</c:if>'
		                       			}
		                       			str += '<div></div><hr>'
		                       			if(JSONData[i].commentRegDate != null){
			                       			str +='<div class="comment-author font-alt"><span class="icon-edit" aria-hidden="true">&nbsp;'+JSONData[i].user.nickName+'</span></div>'
			                       				+'<div>'+JSONData[i].comment+'</div>'
			                       				+'<div>'+getDate(JSONData[i].commentRegDate)
			                       				+'<c:if test="${registrantInfo.user.id eq sessionScope.user.id}">'
			                       				+'<button class="btn btn-d btn-circle btn-xs deleteCommentBtn" type="button">삭제</button>'
			                       	   			+'<input type="hidden" value="'+JSONData[i].ratingReviewNo+'">'
				                       			+'</c:if></div>'
		                       			}
		                       			str += '</div></div></div>'
		                       	stringHtml += str
		                       	addReviewCount=JSONData[i].auctionInfo.addReviewCount
							}		                       			
						}
						stringHtml +='<div class="row"><div class="col-sm-12"><div class="pagination font-alt"><a><i class="fa fa-angle-left"></i></a>'
									+navigationMake(addReviewCount)
									+'<a><i class="fa fa-angle-right"></i></a></div></div></div>'
						$('#ratingReview').append(stringHtml);
					}
			});
		});
		
		$(document).on('click','.prodName',function(){
			window.location = "/auction/getAuctionProduct?auctionProductNo="+$(this).next().val();
		});
	
		$(document).on('click','.pagenav',function(){
			var currentPage = $(this).text()
			$('#ratingReview').empty();
			$.ajax({
				url : "/auction/rest/listAuctionRatingReview/"+currentPage,
				method : "POST",
				data : JSON.stringify({
					auctionProductNo : auctionProductNo
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				success : function(JSONData, status) {
					
					var stringHtml = '';
					var addReviewCount = 0;
					for (var i = 0; i < JSONData.length; i++) {
						if(JSONData[i].reviewDeleteFlag === "N"){	
							var str	='<div class="comment clearfix">'
									+'<div class="comment-content clearfix">'
	                       			+'<div class="comment-author font-alt"><a>'
	                       			+JSONData[i].auctionInfo.user.nickName
	                       			+'</a></div><div>'
	                       			+ratingMake(JSONData[i].avgRating)
	                       			+JSONData[i].avgRating+'점</div>'
	                       			+'<span class="prodName">상품명 : '+JSONData[i].auctionInfo.info.substring(0,30)+'...'+'</span>'
	                       			+'<input type="hidden" value="'+JSONData[i].auctionInfo.auctionProductNo+'"/>'
	                       			+'<div class="comment-body"><p>'
	                       			+JSONData[i].ratingReviewContent
	                       			+'</p></div><div class="comment-meta font-alt">'
	                       			+getDate(JSONData[i].reviewRegDate)
	                       			+nameCheck(JSONData[i].user.id,'${sessionScope.user.id}',JSONData[i].ratingReviewNo)
	                       			if(JSONData[i].commentRegDate == null){
	                       				str += '<c:if test="${registrantInfo.user.id eq sessionScope.user.id}">'
		                       				+'<input type="hidden" value="'+JSONData[i].ratingReviewNo+'"/>'
			                       			+'<button class="btn btn-d btn-circle btn-xs replyBtn" type="button">답글</button>'
			                       			+'</c:if>'
	                       			}
	                       			str += '<div></div><hr>'
	                       			if(JSONData[i].commentRegDate != null){
		                       			str +='<div class="comment-author font-alt"><span class="icon-edit" aria-hidden="true">&nbsp;'+JSONData[i].user.nickName+'</span></div>'
		                       			+'<div>'+getDate(JSONData[i].commentRegDate)
	                       				+'<c:if test="${registrantInfo.user.id eq sessionScope.user.id}">'
	                       				+'<button class="btn btn-d btn-circle btn-xs deleteCommentBtn" type="button">삭제</button>'
	                       	   			+'<input type="hidden" value="'+JSONData[i].ratingReviewNo+'">'
		                       			+'</c:if></div>'
	                       			}
	                       			str += '</div></div></div>'
						
	                    	stringHtml += str
	                    	addReviewCount=JSONData[i].auctionInfo.addReviewCount
						}
					}
					stringHtml +='<div class="row"><div class="col-sm-12"><div class="pagination font-alt"><a><i class="fa fa-angle-left"></i></a>'
								+navigationMake(addReviewCount)
								+'<a><i class="fa fa-angle-right"></i></a></div></div></div>'
					$('#ratingReview').append(stringHtml);
				}
			});
		});
		
		/* 답글 버튼 생성 */
		$(document).on('click','.replyBtn',function(){
			$(this).next().html('<textarea name="comment" cols="100" rows="3"></textarea><div><button class="btn btn-d btn-circle btn-xs commentBtn" type="button">작성완료</button></div>');
			$(this).remove();
		});
		
		/* 답글 전송 버튼 이벤트 */
		$(document).on('click','.commentBtn',function(){
			var ratingReviewNo = $(this).parent().parent().prev().val()
			var comment = $(this).parent().prev().val()
			var auctionProductNo = $(this).parent().parent().parent().prev().prev().val()
			var reviewRegDate = $(this).parent().parent().parent().text().replace('작성완료','')
			$.ajax({
				url : "/auction/rest/addReviewComment/"+auctionProductNo,
				method : "POST",
				data : JSON.stringify({
					ratingReviewNo : ratingReviewNo,
					comment : comment,
					reviewRegDate : reviewRegDate
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				success : function(JSONData, status) {
					location.reload();
				}
			});
			
		});
		
		//리뷰 삭제 버튼 이벤트
		$(document).on('click','.deleteReviewBtn', function(){
			var ratingReviewNo = $(this).next().val();
			var location = $(this).parent().parent().parent();
			$.ajax({
				url : "/auction/rest/deleteAuctionRatingReview",
				method : "POST",
				data : JSON.stringify({
					ratingReviewNo : ratingReviewNo,
					ratingReviewStatus : 0
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				success : function(JSONData, status) {
					Swal.fire({
				    	text: JSONData.info,
				    	icon: 'info'
					})
					if(JSONData.info.indexOf('판매자') == -1){
						location.empty();						
					}
				}
			});
		});
		
		//답글 삭제 버튼
		$(document).on('click','.deleteCommentBtn', function(){
			var ratingReviewNo = $(this).next().val();
			$(this).parent().prev().remove();
			$(this).parent().prev().remove();
			$(this).parent().remove();
			$.ajax({
				url : "/auction/rest/deleteAuctionRatingReview",
				method : "POST",
				data : JSON.stringify({
					ratingReviewNo : ratingReviewNo,
					ratingReviewStatus : 1
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				success : function(JSONData, status) {
				}
			}); 
		});
		
		
	});
	
	function nameCheck(jsonId, sessionId, reviewNo){
		var str = ""
		if(jsonId == sessionId){
   			str = '<button class="btn btn-d btn-circle btn-xs deleteReviewBtn" type="button">삭제</button>'
   			+'<input type="hidden" value="'+reviewNo+'">'
   		}
		return str;
	}
	
	
	function ratingMake(avgRating){
		var rating = ""
		for(var j=0; j<Math.floor(avgRating); j++){
			rating += '<i class="fa fa-star star"></i>'
		}
			
		if(Math.floor(avgRating) < avgRating){
			rating += '<i class="fa fa-star-half star"></i>'
   			for(var j=Math.ceil(avgRating); j<5; j++){
   				rating+= '<i class="fa fa-star star-off"></i>'   					
   			}
		}else{
			for(var j=Math.ceil(avgRating); j<5; j++){
				rating+= '<i class="fa fa-star star-off"></i>'					
			}
		}
		
		return rating;
	}
	
	function navigationMake(addReviewCount){
		var navigation = ""
		for(var j=0; j<Math.ceil(addReviewCount/5); j++){
			navigation += '<a class="active nav pagenav" >'+(j+1)+'</a>'
		}
		return navigation;
	}
	
	function getDate(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + "-" + month + "-" + day;
	}
	//화면 로드시 sockJS를 이용하여 STOMP로 연결하여 Publisher, Subscriber관계 형성
	function connect(){
		
		var sock = new SockJS("/realtime");
		stompClient = Stomp.over(sock);
		
		stompClient.connect({},function(frame){	
			
			stompClient.subscribe('/topic/join/${auctionProduct.auctionProductNo}',function(response){
				var joinInfo = JSON.parse(response.body);
				$("#realTimeViewCount").text('해당 상품을 '+joinInfo.realTimeViewCount+'명이 조회하고 있습니다.');					
			});
			
			//입찰 subcribe
			stompClient.subscribe('/topic/bid/${auctionProduct.auctionProductNo}',function(response){
				var bidInfo = JSON.parse(response.body)
				$('#currentPrice').text(addComma(bidInfo.bidPrice)+'원');
				
				if(userId == bidInfo.user.id){
					var info = nickName+'님은 '+bidInfo.bidderCount+'명 중 '+bidInfo.bidderRank+'등 입니다.';
					$('#userInfo').text(info);
				}else{
					
					$.ajax({
  						url : "/auction/rest/getBidderRanking",
  						method : "POST",
  						data : JSON.stringify({
  							auctionProductNo : auctionProductNo
  						}),
  						headers : {
  							"Accept" : "application/json",
  							"Content-Type" : "application/json"
  						},
  						dataType : "json",
  						success : function(JSONData, status) {
  							if(JSONData.bidderRank != 0){
	  							var info = nickName+'님은 '+JSONData.bidderCount+'명 중 '+JSONData.bidderRank+'등 입니다.';
	  							if(${!empty sessionScope.user}){
	  								$('#userInfo').text(info);  									  								
	  							}
  							}
  						}
					});
					
				}
				document.getElementById('auctionEndTime').innerText= bidInfo.bidDateTime;
			});
						
			//중도 철회 subscribe
			stompClient.subscribe('/topic/delete/${auctionProduct.auctionProductNo}',function(response){
				var deleteInfo = JSON.parse(response.body)
				Swal.fire({
				   	text: deleteInfo.info,
				   	icon: 'info'
				})
				window.location = "/auction/listAuctionProduct";
			});
			
			//화면 이탈 subscribe
			stompClient.subscribe('/topic/exit/${auctionProduct.auctionProductNo}',function(response){
				var exitInfo = JSON.parse(response.body)
				$("#realTimeViewCount").text('해당 상품을 '+exitInfo.realTimeViewCount+'명이 조회하고 있습니다.');
			});
						
			stompClient.send('/app/join/${auctionProduct.auctionProductNo}',{},JSON.stringify({
				auctionProductNo : auctionProductNo
			}));
		});
	
	}
	
	function addComma(value){
        value = value.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        return value; 
    }
	
	function unComma(value){
        value = value.toString().replace(/[^\d]+/g, "");
        return value; 
    }
	
	window.onbeforeunload = function(e){
		stompClient.send('/app/exit/${auctionProduct.auctionProductNo}',{},JSON.stringify({
			auctionProductNo : auctionProductNo
		}));
	}
	
	function remaindTime() {
		var startTime = $('#auctionStartTime').text();
		var endTime = $('#auctionEndTime').text();
	    var now = new Date();
	    var open = new Date(startTime);
	    var end = new Date(endTime);

	    var nt = now.getTime();
	    var ot = open.getTime();
	    var et = end.getTime();
	    
	  
	   if(nt<ot){
		   
			 $('#bidBtn').attr('disabled',true);
		     $(".time").fadeIn();
		     $('.bidPricing').text('경매 시작전 입니다.');
		     $('#currentPrice').empty();
		     $("div.time-title").html("경매 시작까지 남은 시간");
		     sec =parseInt(ot - nt) / 1000;
		     hour = parseInt(sec/60/60);
		     sec = (sec - (hour*60*60));
		     min = parseInt(sec/60);
		     sec = parseInt(sec-(min*60));
		     if(hour<10){hour="0"+hour;}
		     if(min<10){min="0"+min;}
		     if(sec<10){sec="0"+sec;}
		     $(".hours").html(hour);
		     $(".minutes").html(min);
		     $(".seconds").html(sec);
		    
	   }else if(nt>et){
		   	$('#bidBtn').attr('disabled',true);
	   		$("#bidBtn").html("경매 마감");
	   		$('.bidPricing').text('경매 마감가');
	    	$(".time").fadeOut();
	    	
	   }else {
		   	
		     $(".time").fadeIn();
		     $("div.time-title").html("경매 마감까지 남은 시간");
		     $('#bidBtn').attr('disabled',false);
		     sec = parseInt(et - nt) / 1000;
		     hour = parseInt(sec/60/60);
		     sec = (sec - (hour*60*60));
		     min = parseInt(sec/60);
		     sec = parseInt(sec-(min*60));
		     if(hour<10){hour="0"+hour;}
		     if(min<10){min="0"+min;}
		     if(sec<10){sec="0"+sec;}
		     $(".hours").html(hour);
		     $(".minutes").html(min);
		     $(".seconds").html(sec);
	   }
	 }
	 setInterval(remaindTime,1000);

	 
	
	</script>
</body>
</html>