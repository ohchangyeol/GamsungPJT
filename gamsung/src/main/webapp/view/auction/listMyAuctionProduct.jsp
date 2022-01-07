<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>myPage</title>

<style type="text/css">

.sidebar-left{
	background-color: #171717 !important;
}

.page-header{
	background-color: #171717 !important;
}
</style>

</head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <section class="body">
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
		<jsp:include page="../common/header.jsp"></jsp:include>
     	 <div class="inner-wrapper">
			<jsp:include page="../common/userSideBar.jsp"></jsp:include>
				<section role="main" class="content-body">
					
					<!-- start: page -->
						<div class="row">
							<div class="col-md-12">
								<section class="panel">
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-hover mb-none">
												<thead>
													<tr>
													<c:if test="${auctionInfo.info eq 'add'}">
														<th>경매번호</th>
														<th>상품명</th>
														<th>상태</th>
														<th>조회수</th>
														<th>UP!</th>
													</c:if>
													<c:if test="${auctionInfo.info eq 'history'}">
														<th>입찰번호</th>
														<th>판매자ID</th>
														<th>입찰가</th>
														<th>입찰일자</th>
														<th>상태</th>
													</c:if>
													<c:if test="${auctionInfo.info eq 'bid'}">
														<th>번호</th>
														<th>판매자ID</th>
														<th>상품명</th>
														<th>등록일자</th>
														<th>삭제</th>
													</c:if>
													<c:if test="${auctionInfo.info eq 'review'}">
														<th>리뷰번호</th>
														<th>판매자ID</th>
														<th>상품명</th>
														<th>평점</th>
														<th>등록일자</th>
													</c:if>
													
													</tr>
												</thead>
												<tbody>
												<c:if test="${auctionInfo.info eq 'add' && !empty list}">
													<c:forEach var="auctionProduct" items="${list}">
														<tr>
															<td class="auctionProductNo">${auctionProduct.auctionProductNo}</td>
															<td class="auctionProductName">${auctionProduct.auctionProductName}</td>
															<c:if test="${auctionProduct.auctionStatus eq 'START'}">
																<td>진행중</td>														
															</c:if>
															<c:if test="${auctionProduct.auctionStatus eq 'WAIT'}">
																<td>낙찰</td>		
															</c:if>
															<c:if test="${auctionProduct.auctionStatus eq 'FAIL'}">
																<td>유찰</td>	
															</c:if>
															<c:if test="${auctionProduct.auctionStatus eq 'CONFIRM'}">
																<td>거래완료</td>	
															</c:if>
															<c:if test="${auctionProduct.auctionStatus eq 'WITHDRAWAL'}">
																<td>중도철회</td>	
															</c:if>
															<c:if test="${auctionProduct.auctionStatus eq 'CANCEL'}">
																<td>낙찰취소</td>	
															</c:if>
															<td class="text-center"><i class="fa fa-eye"></i><span>${auctionProduct.productViewCount}</span></td>
															<td class="actions-hover actions-fade">
																<a class="addMain"><i class="fa fa-arrow-up"></i></a>
															</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${auctionInfo.info eq 'history' && !empty list}">
													<c:forEach var="auctionHistory" items="${list}">
														<tr>
															<td class="bidNo">${auctionHistory.bidNo}</td>
															<td class="userId">${auctionHistory.user.id}</td>
															<td class=""><fmt:formatNumber type="number" maxFractionDigits="3" value="${auctionHistory.bidPrice}"/>원</td>
															<td class="">${auctionHistory.bidDateTime}</td>
															<c:if test="${auctionHistory.auctionStatus eq 'START'}">
																<td>진행중</td>														
															</c:if>
															<c:if test="${auctionHistory.auctionStatus eq 'WAIT'}">
																<td>낙찰</td>		
															</c:if>
															<c:if test="${auctionHistory.auctionStatus eq 'FAIL'}">
																<td>유찰</td>	
															</c:if>
															<c:if test="${auctionHistory.auctionStatus eq 'CONFIRM'}">
																<td>거래완료</td>	
															</c:if>
															<c:if test="${auctionHistory.auctionStatus eq 'WITHDRAWAL'}">
																<td>중도철회</td>	
															</c:if>
															<c:if test="${auctionHistory.auctionStatus eq 'CANCEL'}">
																<td>낙찰취소</td>	
															</c:if>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${auctionInfo.info eq 'bid' && !empty list}">
													<c:forEach var="bidConcern" items="${list}">
														<tr>
															<td class="bidConcernNo">${bidConcern.bidNo}</td>
															<td class="userId">${bidConcern.user.id}</td>
															<td class="">${bidConcern.info}</td>
															<td class="">${bidConcern.concernRegDate}</td>
															<td></td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${auctionInfo.info eq 'review' && !empty list}">
													<c:forEach var="review" items="${list}">
														<tr>
															<td class="bidConcernNo">${review.ratingReviewNo}</td>
															<td class="userId">${review.auctionInfo.user.id}</td>
															<td class="">${review.auctionInfo.info}</td>
															<td>${review.avgRating}</td>
															<td class="">${review.reviewRegDate}</td>
														</tr>
													</c:forEach>	
												</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</section>
								<div class="row">
									<div class="col-sm-12">
										<div class="pagination font-alt">
											<a><i class="fa fa-angle-left"></i></a>
												<a class="active nav">1</a>
											<a><i class="fa fa-angle-right"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					<!-- end: page -->
				</section>
			</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		</section>
    <!--  
    JavaScripts
    =============================================
    -->
	<script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resources/lib/wow/wow.js"></script>
	<script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
	<script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../../resources/lib/smoothscroll.js"></script>
	<script src="../../resources/lib/magnific-popup/jquery.magnific-popup.js"></script>
	<script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../../resources/js/plugins.js"></script>
	<script src="../../resources/js/main.js"></script>
	
	<script src="../../resources/lib/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="../../resources/lib/nanoscroller/nanoscroller.js"></script>
	<script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
	<script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
	
	<script src="../../resources/lib/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
	<script src="../../resources/lib/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
	<script src="../../resources/lib/jquery-appear/jquery.appear.js"></script>
	<script src="../../resources/lib/bootstrap-multiselect/bootstrap-multiselect.js"></script>
	<script src="../../resources/lib/jquery-easypiechart/jquery.easypiechart.js"></script>
	<script src="../../resources/lib/flot/jquery.flot.js"></script>
	<script src="../../resources/lib/flot-tooltip/jquery.flot.tooltip.js"></script>
	<script src="../../resources/lib/flot/jquery.flot.pie.js"></script>
	<script src="../../resources/lib/flot/jquery.flot.categories.js"></script>
	<script src="../../resources/lib/flot/jquery.flot.resize.js"></script>
	<script src="../../resources/lib/jquery-sparkline/jquery.sparkline.js"></script>
	<script src="../../resources/lib/raphael/raphael.js"></script>
	<script src="../../resources/lib/morris/morris.js"></script>
	<script src="../../resources/lib/gauge/gauge.js"></script>
	<script src="../../resources/lib/snap-svg/snap.svg.js"></script>
	<script src="../../resources/lib/liquid-meter/liquid.meter.js"></script>
	<script src="../../resources/lib/jqvmap/jquery.vmap.js"></script>
	<script src="../../resources/lib/jqvmap/data/jquery.vmap.sampledata.js"></script>
	<script src="../../resources/lib/jqvmap/maps/jquery.vmap.world.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.africa.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.australia.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>
	<script src="../../resources/lib/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>
		
	
	<script src="../../resources/js/theme.js"></script>
	<script src="../../resources/js/theme.custom.js"></script>
	<script src="../../resources/js/theme.init.js"></script>
	<script src="../../resources/js/dashboard/examples.dashboard.js"></script>
	
	<script>
		$(function(){
			$('#listMyProduct').on('click',function(){
				window.location = "/auction/listMyAuctionProduct?currentPage=1-*";
			});
			
			$('.auctionProductName').on('click',function(){
				window.location = '/auction/getAuctionProduct?auctionProductNo='+$(this).prev().text();
			});
			
			$('.addMain').on('click',function(){
				var auctionProductNo = $(this).parent().prev().prev().prev().prev().text();
				$.ajax({
					url : "/auction/rest/addMainAuctionProduct/"+auctionProductNo,
					method : "GET",
					headers : {
						"Accept" : "application/json",
						"Content-type" : "application/json"
					},
					dataType : "json",
					success : function(JSONData, status){
						alert(JSONData.info);
						location.reload();
					}
				});
			});
		});
	</script>
  </body>
</html>