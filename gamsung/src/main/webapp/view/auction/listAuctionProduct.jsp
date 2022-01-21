<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>중고 경매</title>
    
 	<jsp:include page="/resources/commonLib.jsp"></jsp:include>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  	<style type="text/css">
  	
  		.target {
  		 display: inline-block; 
  		 width: 200px; 
  		 white-space: nowrap; 
  		 overflow: hidden; 
  		 text-overflow: ellipsis; 
		white-space: normal; 
		line-height: 1.2; 
		height: 3.6em; 
		text-align: left; 
		word-wrap: break-word; 
		display: -webkit-box; 
		-webkit-line-clamp: 3; 
		-webkit-box-orient: vertical;
		 }

  	</style>

  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <!-- <div class="page-loader">
        <div class="loader">Loading...</div>
      </div> -->
  	<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="main">
      <section class="module bg-dark-60 shop-page-header" data-background="../../resources/images/6041bd81f941c55ff784f622_8-Tips-when-buying-at-auction.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Auction Products</h2>
                <div class="module-subtitle font-serif">진행 중인 경매 상품입니다. 사기 행위에 유의하세요.</div>
              </div>
            </div>
          </div>
        </section>
        <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-2 mb-sm-20">
                <select class="form-control">
	            	<option value="최신순">최신순</option>
	            	<c:if test="${search.sortCondition eq '높은 가격 순'}">
	            		<option value="높은 가격 순" selected="selected">높은 가격 순</option>
	                </c:if>
	                <c:if test="${search.sortCondition ne '높은 가격 순'}">
	                  	<option value="높은 가격 순">높은 가격 순</option>
	                </c:if>
	                <c:if test="${search.sortCondition eq '낮은 가격 순'}">
	            		<option value="낮은 가격 순" selected="selected">낮은 가격 순</option>
	                </c:if>
	                <c:if test="${search.sortCondition ne '낮은 가격 순'}">
	                  	<option value="낮은 가격 순">낮은 가격 순</option>
	                </c:if>
	                <c:if test="${search.sortCondition eq '조회수 높은 순'}">
	            		<option value="조회수 높은 순" selected="selected">조회수 높은 순</option>
	                </c:if>
	                <c:if test="${search.sortCondition ne '조회수 높은 순'}">
	                  	<option value="조회수 높은 순">조회수 높은 순</option>
	                </c:if>
	                <c:if test="${search.sortCondition eq '조회수 낮은 순'}">
	            		<option value="조회수 낮은 순" selected="selected">조회수 낮은 순</option>
	                </c:if>
	                <c:if test="${search.sortCondition ne '조회수 낮은 순'}">
	                  	<option value="조회수 낮은 순">조회수 낮은 순</option>
	                </c:if>
	            </select>                
              </div>
              <div class="col-sm-2 mb-sm-20">
                <a class="btn btn-border-d btn-circle refresh"><i class="fa fa-refresh"></i>초기화</a>
              </div>
              <div class="col-sm-8 mb-sm-20">
                <input class="form-control" id="keyword" type="text" placeholder="상품명을 입력하세요..." value="${search.searchKeyword}">
              </div>
            </div>
          </div>
        </section>
        <hr class="divider-w">
        <section class="module-small">
          <div class="container">
            <div class="row" style="margin-bottom: 30px;">
              <div style="padding-left: 30px;">
                <h2 class="module-title font-jua main-color gamsung-mini-title ">경매 진행 중 상품</h2>
				<p class="">진행 중인 경매 상품입니다. 사기 행위에 유의하세요.</p>
              </div>
            </div>
            <div class="row multi-columns-row">
          </div>
          <div class="container products">
            <c:forEach var="product" items="${productList}" begin="0" step="1" end="3">
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="shop-item">
                  <c:if test="${!empty product.auctionProductSubDetail}">
	                  <div class="shop-item-image">
	                  	<img src="${product.productImg1}" alt="Accessories Pack"/>
	                    <div class="shop-item-detail">
		                  	<c:if test="${concernList.size() == 0}">
			                  	<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>
		                  	</c:if>
		                  	<c:set var="breakLoop" value="false"/>
		                  	<c:forEach var="concern" items="${concernList}">
		                  	 <c:if test="${not breakLoop}">
		                  		<c:if test="${product.auctionProductNo eq concern.auctionProductNo}">
			                  		<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa  fa-bell"></i>응찰관심</a>
			                  		<c:set var="breakLoop" value="true"/>
		                  		</c:if>
		                  	</c:if>
		                  	</c:forEach>
		                  	<c:if test="${concernList.size() != 0 && not breakLoop}">
		                  		<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>
		                  	</c:if>
		                  	<span hidden="hidden">${product.auctionProductNo}</span>
		                  	<span hidden="hidden">${product.auctionProductSubDetail}</span>
							<a class="btn btn-d btn-circle btn-xs crawl"><i class="fa fa-gavel"></i>입찰하기</a>
	                    </div>
	                  </div>
	                  <h4 class="shop-item-title font-alt target"><a href="#">${product.auctionProductName}</a></h4>
	                  <h5><i class="fa fa-won"></i>희망 낙찰가 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.hopefulBidPrice}"/></h5>
	                  <h5>
		                  <i class="fa fa-group"></i><span>입찰자 : ${product.bidderCount}명</span>/
		                  <i class="fa fa-eye"></i><span>조회수 : ${product.productViewCount}회</span>
	                  </h5>
	                  <span>${product.hashtag1} ${product.hashtag2} ${product.hashtag2}</span>		
                  </c:if>
                   <c:if test="${empty product.auctionProductSubDetail}">
	                  <div class="shop-item-image">
	                  	<img src="/uploadfiles/auctionimg/product/${product.productImg1}" alt="Accessories Pack"/>
	                    <div class="shop-item-detail">
		                  	<c:if test="${concernList.size() == 0}">
			                  	<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>
		                  	</c:if>
		                  	<c:set var="breakLoop" value="false"/>
		                  	<c:forEach var="concern" items="${concernList}">
		                  	 <c:if test="${not breakLoop}">
		                  		<c:if test="${product.auctionProductNo eq concern.auctionProductNo}">
			                  		<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa  fa-bell"></i>응찰관심</a>
			                  		<c:set var="breakLoop" value="true"/>
		                  		</c:if>
		                  	</c:if>
		                  	</c:forEach>
		                  	<c:if test="${concernList.size() != 0 && not breakLoop}">
		                  		<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>
		                  	</c:if>
		                  	<span hidden="hidden">${product.auctionProductNo}</span>
	                    	<a class="btn btn-d btn-circle btn-xs notCrawl"><i class="fa fa-gavel"></i>입찰하기</a>
	                    </div>
	                  </div>
	                  <h4 class="shop-item-title font-alt target"><a href="#">${product.auctionProductName}</a></h4>
	                  <h5><i class="fa fa-won"></i>희망 낙찰가 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.hopefulBidPrice}"/></h5>
	                  <h5>
		                  <i class="fa fa-group"></i><span>입찰자 : ${product.bidderCount}명</span>/
		                  <i class="fa fa-eye"></i><span>조회수 : ${product.productViewCount}회</span>
	                  </h5>
	                  <span>${product.hashtag1} ${product.hashtag2} ${product.hashtag2}</span>			
                  </c:if>
                </div>
              </div>
            </c:forEach>
          </div>
           <div class="container products">
            <c:forEach var="product" items="${productList}" begin="4" step="1" end="7">
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="shop-item">
                  <c:if test="${!empty product.auctionProductSubDetail}">
	                  <div class="shop-item-image">
	                  	<img src="${product.productImg1}" alt="Accessories Pack"/>
	                    <div class="shop-item-detail">
		                  	<c:if test="${concernList.size() == 0}">
			                  	<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>
		                  	</c:if>
		                  	<c:set var="breakLoop" value="false"/>
		                  	<c:forEach var="concern" items="${concernList}">
		                  	 <c:if test="${not breakLoop}">
		                  		<c:if test="${product.auctionProductNo eq concern.auctionProductNo}">
			                  		<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa  fa-bell"></i>응찰관심</a>
			                  		<c:set var="breakLoop" value="true"/>
		                  		</c:if>
		                  	</c:if>
		                  	</c:forEach>
		                  	<c:if test="${concernList.size() != 0 && not breakLoop}">
		                  		<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>
		                  	</c:if>
		                  	<span hidden="hidden">${product.auctionProductNo}</span>
		                  	<span hidden="hidden">${product.auctionProductSubDetail}</span>
							<a class="btn btn-d btn-circle btn-xs crawl"><i class="fa fa-gavel"></i>입찰하기</a>
	                    </div>
	                  </div>
	                  <h4 class="shop-item-title font-alt target"><a href="#">${product.auctionProductName}</a></h4>
	                  <h5><i class="fa fa-won"></i>희망 낙찰가 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.hopefulBidPrice}"/></h5>
	                  <h5>
		                  <i class="fa fa-group"></i><span>입찰자 : ${product.bidderCount}명</span>/
		                  <i class="fa fa-eye"></i><span>조회수 : ${product.productViewCount}회</span>
	                  </h5>
	                  <span>${product.hashtag1} ${product.hashtag2} ${product.hashtag2}</span>		
                  </c:if>
                   <c:if test="${empty product.auctionProductSubDetail}">
	                  <div class="shop-item-image">
	                  	<img src="/uploadfiles/auctionimg/product/${product.productImg1}" alt="Accessories Pack"/>
	                    <div class="shop-item-detail">
		                  	<c:if test="${concernList.size() == 0}">
			                  	<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>
		                  	</c:if>
		                  	<c:set var="breakLoop" value="false"/>
		                  	<c:forEach var="concern" items="${concernList}">
		                  	 <c:if test="${not breakLoop}">
		                  		<c:if test="${product.auctionProductNo eq concern.auctionProductNo}">
			                  		<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa  fa-bell"></i>응찰관심</a>
			                  		<c:set var="breakLoop" value="true"/>
		                  		</c:if>
		                  	</c:if>
		                  	</c:forEach>
		                  	<c:if test="${concernList.size() != 0 && not breakLoop}">
		                  		<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>
		                  	</c:if>
		                  	<span hidden="hidden">${product.auctionProductNo}</span>
	                    	<a class="btn btn-d btn-circle btn-xs notCrawl"><i class="fa fa-gavel"></i>입찰하기</a>
	                    </div>
	                  </div>
	                  <h4 class="shop-item-title font-alt target"><a href="#">${product.auctionProductName}</a></h4>
	                  <h5><i class="fa fa-won"></i>희망 낙찰가 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.hopefulBidPrice}"/></h5>
	                  <h5>
		                  <i class="fa fa-group"></i><span>입찰자 : ${product.bidderCount}명</span>/
		                  <i class="fa fa-eye"></i><span>조회수 : ${product.productViewCount}회</span>
	                  </h5>
	                  <span>${product.hashtag1} ${product.hashtag2} ${product.hashtag2}</span>			
                  </c:if>
                </div>
              </div>
            </c:forEach>
          </div>
          <span id="append"></span>
         </div>
        </section>
        
        <!-- <hr class="divider-d"> -->

        <jsp:include page="../common/footer.jsp"></jsp:include>
      <!-- </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div> -->
      <form>
      	<input type="hidden" id="auctionProductSubDetail" name="auctionProductSubDetail"/>
      	<input type="hidden" id="auctionProductName" name="auctionProductName"/>
      	<input type="hidden" id="allhashtag"name="allhashtag"/>
      	<input type="hidden" id="auctionProductNo" name="auctionProductNo"/>
      	<input type="hidden" id="searchKeyword" name="searchKeyword" value="${search.searchKeyword}">
      	<input type="hidden" id="sortCondition" name="sortCondition" value="${search.sortCondition}">
      </form>
    </main>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
   	<script type="text/javascript">
   	 $(function(){
   		 
   		 var searchKeyword = $('#searchKeyword').val();
   		 var sortCondition = $('#sortCondition').val();
   		
	   		$('body').on('click','.crawl',function(){
	   			var auctionProductSubDetail = $(this).prev().text();
	   			var auctionProductName = $(this).parent().parent().next().text();
	   			var allhashtag = $(this).parent().parent().next().next().text();
	   			$("#auctionProductSubDetail").val(auctionProductSubDetail);
	   			$("#auctionProductName").val(auctionProductName);
	   			$("#allhashtag").val(allhashtag);
	   			$('form').attr('method','post').attr('action','/auction/getAuctionProductB').submit();
	   		});
  			 
	   		$('body').on('click','.notCrawl',function(){
	   			var auctionProductNo = $(this).prev().text();
	   			$("#auctionProductNo").val(auctionProductNo);
	   			$("#auctionProductSubDetail").remove();
	   			$("#auctionProductName").remove();
	   			$("#allhashtag").remove();
	   			$('form').attr('method','GET').attr('action','/auction/getAuctionProduct').submit();
	   		});
	   		
	   		$('select').on('change',function(){
	   			$('#sortCondition').val($(this).val());
	   			$('form').attr('method','post').attr('action','/auction/listAuctionProduct').submit();
	   		});
	   		
	   		function subDetailValidation(subDetail, data){
	   			console.log(subDetail.length);
	   			if(subDetail.length > 0){
	   				return '<div class="shop-item-image"><img src="'+data+'" alt="Accessories Pack"/><div class="shop-item-detail">';
	   			}else{
	   				return '<div class="shop-item-image"><img src=/uploadfiles/auctionimg/product/"'+data+'" alt="Accessories Pack"/><div class="shop-item-detail">';
	   			}
	   		}
	   		
	   		function productNoValication(product, concern){
	   			if(product != concern){
	   				return '<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa fa-bell-o"></i>응찰관심</a>';
	   			}else{
	   				return '<a class="btn btn-d btn-circle btn-xs bidCocern"><i class="fa  fa-bell"></i>응찰관심</a>';
	   			}
	   		}
	   		
	   		$('.refresh').on('click',function(){
	   			$('#searchKeyword').val('');
	   			$('#sortCondition').val('');
	   			$('form').attr('method','post').attr('action','/auction/listAuctionProduct').submit();
	   		});
	   		
	   		$('#keyword').on('keyup',function(){
	   			var searchKeyword = $(this).val();
	   			$.ajax(
					{
						url : "/auction/rest/autoComplete",
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						dataType:"json",
						data : JSON.stringify({
							searchKeyword : searchKeyword
						}),
						success : function(JSONData,status){
							$(function(){
								$('#keyword').autocomplete({
									source: JSONData
								});			
							});
						}
				});
	   		});
	   		
	   		$('#keyword').on('keypress',function(key){
	   			if(key.keyCode == 13){
	   				$('#searchKeyword').val($(this).val());
	   				$('form').attr('method','post').attr('action','/auction/listAuctionProduct').submit();
	   			}
	   		});
	   		
	   		$(document).on('click','.bidCocern',function(){
	   			if(${empty sessionScope.user}){
	   				Swal.fire({
				    	text: '로그인 후 이용 가능합니다.',
				    	icon: 'warning'
				    })
	   				window.location = "/"
	   				return;
	   			}
	   			var auctionProductNo = $(this).next().text();
	   			var tmp = $(this)
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
								tmp.html('<i class="fa fa-bell-o"></i>응찰관심');
							}else{
								tmp.empty();
								tmp.html('<i class="fa  fa-bell"></i>응찰관심');
							}						
						}
	   			});
	   		});;
  	});
  		  	
  	</script>    
  </body>
</html>