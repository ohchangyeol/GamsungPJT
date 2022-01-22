<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<jsp:include page="/resources/commonLib.jsp"></jsp:include>
	
    <jsp:include page="/resources/commonCssMypage.jsp" />
    
    <title>myPage</title>

</head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <section class="body">
      <!-- <div class="page-loader">
        <div class="loader">Loading...</div>
      </div> -->
		
     	 <div class="inner-wrapper">
			<jsp:include page="../common/userSideBar.jsp"></jsp:include>
				<section role="main" class="content-body mypage-body">
					
					<!-- start: page -->
						<div class="row">
							<div class="col-md-12">
								<section class="panel">
									<div class="panel-body">
										<c:if test="${auctionInfo.info eq 'add'}">
											<div style="font-weight: 500; font-size:28px; margin-bottom: 30px;">내가 등록한 상품</div>
										</c:if>
										<c:if test="${auctionInfo.info eq 'history'}">
											<div style="font-weight: 500; font-size:28px; margin-bottom: 30px;">경매 내역</div>
										</c:if>
										<c:if test="${auctionInfo.info eq 'bid'}">
											<div style="font-weight: 500; font-size:28px; margin-bottom: 30px;">응찰 관심 내역</div>
										</c:if>
										<c:if test="${auctionInfo.info eq 'review'}">
											<div style="font-weight: 500; font-size:28px; margin-bottom: 30px;">리뷰</div>
										</c:if>
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
														<th>상품명</th>
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
															<td hidden="">${auctionHistory.auctionProductNo}</td>
															<td class="auctionProductName">${fn:substring(auctionHistory.info,'0','50')}</td>
															<td class="userId">${auctionHistory.user.id}</td>
															<td class=""><fmt:formatNumber type="number" maxFractionDigits="3" value="${auctionHistory.bidPrice}"/>원</td>
															<td class="">${auctionHistory.bidDateTime}</td>
															<c:if test="${auctionHistory.auctionStatus eq 'START'}">
																<td>진행중</td>														
															</c:if>
															<c:if test="${auctionHistory.auctionStatus eq 'WAIT'}">
																<c:if test="${auctionHistory.user.nickName eq sessionScope.user.id}">
																	<td>낙찰</td>		
																</c:if>
																<c:if test="${auctionHistory.user.nickName ne sessionScope.user.id}">
																	<td>유찰</td>		
																</c:if>
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
															<td hidden="">${bidConcern.auctionProductNo}</td>
															<td class="auctionProductName">${bidConcern.info}</td>
															<td class="">${bidConcern.concernRegDate}</td>
															<td class="actions-hover actions-fade">
																<a class="deleteConcern">
																	<i class="fa fa-trash"></i>
																</a>
															<input type="hidden" value="${bidConcern.auctionProductNo}">
															</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${auctionInfo.info eq 'review' && !empty list}">
													<c:forEach var="review" items="${list}">
														<tr>
															<td class="bidConcernNo">${review.ratingReviewNo}</td>
															<td class="userId">${review.auctionInfo.user.id}</td>
															<td hidden="">${review.auctionInfo.auctionProductNo}</td>
															<td class="auctionProductName">${review.auctionInfo.info}</td>
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
							        <jsp:include page="../common/pageNavigator.jsp"/>
							     </div>
							</div>
						</div>
					<!-- end: page -->
				</section>
			</div>
		
		</section>

	<jsp:include page="/resources/commonScriptMypage.jsp" />
    
	<script src="../../resources/js/dashboard/examples.dashboard.js"></script>
	
	<script>
		$(function(){
			$('#listMyProduct').on('click',function(){
				window.location = "/auction/listMyAuctionProduct?currentPage=1";
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
						Swal.fire({
					    	text: JSONData.info,
					    	icon: 'info'
					    })
					}
				});
			});
			
			$('.deleteConcern').on('click',function(){
				
				var auctionProductNo = $(this).next().val();
				var tmp = $(this);
				var parent = tmp.parent().parent();
				$.ajax({
					url : "/auction/rest/addBidConcern",
					method : "POST",
					async: false,
					data : JSON.stringify({
						auctionProductNo : auctionProductNo
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					dataType : "json",
					success : function(JSONData, status) {
						if(JSONData.info.indexOf('비활성화') != -1){
							tmp.empty();
							tmp.html('<i class="fa fa-trash-o"></i>');
							parent.empty();
						}else{
							tmp.empty();
							tmp.html('<i class="fa fa-trash"></i>');
						}						
					}
   			});
			});
		});
	</script>
  </body>
</html>