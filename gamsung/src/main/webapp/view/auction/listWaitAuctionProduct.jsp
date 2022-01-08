<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>중고 경매</title>
    
	<jsp:include page="/resources/commonLib.jsp"></jsp:include>
  
  <style>
  	.prodName{
  		 text-decoration: none;
		 text-overflow: ellipsis;
  	}
  </style>
  
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
  	<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="main">
      <section class="module bg-dark-60 shop-page-header" data-background="../../resources/images/6041bd81f941c55ff784f622_8-Tips-when-buying-at-auction.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Auction Products</h2>
                <div class="module-subtitle font-serif">관리자가 등록한 경매 상품입니다. 10분 동안만 진행됩니다.</div>
              </div>
            </div>
          </div>
        </section>
        <hr class="divider-w">
        <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">관리자 경매 상품</h2>
              </div>
            </div>
            <div class="row multi-columns-row">
          </div>
          <div id="latest" class="container">
            <c:forEach var="product" items="${list}" begin="0" step="1" end="3">
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="shop-item">
                  <div class="shop-item-image">
                  	<img src="${product.productImg1}" alt="Accessories Pack"/>
                    <div class="shop-item-detail">
	                  	<span hidden="hidden">${product.auctionProductSubDetail}</span>
                    	<a class="btn btn-round btn-b">경매 시작하기!</a>
                    </div>
                  </div>
                  <h4 class="shop-item-title font-alt prodNmae"><a href="#">${product.auctionProductName}</a></h4>
                  <span>${product.hashtag1} ${product.hashtag2} ${product.hashtag3}</span>			
                </div>
              </div>
            </c:forEach>
          </div>
           <div id="latest" class="container">
            <c:forEach var="product" items="${list}" begin="4" step="1" end="7">
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="shop-item">
                  <div class="shop-item-image"><img src="${product.productImg1}" alt="Accessories Pack"/>
                  	<div class="shop-item-detail">
	                  	<span hidden="hidden">${product.auctionProductSubDetail}</span>
                    	<a class="btn btn-round btn-b">경매 시작하기!</a>
                    </div>
                  </div>
                  <h4 class="shop-item-title font-alt prodNmae"><a href="#">${product.auctionProductName}</a></h4>
                  <span>${product.hashtag1} ${product.hashtag2} ${product.hashtag3}</span>			
                </div>
              </div>
            </c:forEach>
          </div>
          <span id="append"></span>
         </div>
        </section>
        
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
      <form>
      	<input type="hidden" id="auctionProductSubDetail" name="auctionProductSubDetail"/>
      	<input type="hidden" id="auctionProductName" name="auctionProductName"/>
      	<input type="hidden" id="allhashtag"name="allhashtag"/>
      </form>
    </main>

   	<script type="text/javascript">
   	$(function(){
   		
   		   		   		
  		var page = 2;
  		$(window).scroll(function() {
  			var sortCondition = $('#sortCondition').val();
  			var searchKeyword = $('#searchKeyword').val();
  			if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight/3) {
  				 console.log("실행");
  				$.ajax({
  						url : "/auction/rest/infiniteScroll",
  						method : "POST",
  						async: false,
  						data : JSON.stringify({
  							currentPage : page,
  							sortCondition : sortCondition,
  							searchKeyword : searchKeyword
  						}),
  						headers : {
  							"Accept" : "application/json",
  							"Content-Type" : "application/json"
  						},
  						dataType : "json",
  						success : function(JSONData, status) {
	  						var str = '<div class="container">';
	  						for (var i = 0; i < JSONData.length-4; i++) {
								var stringHtml = '<div class="col-sm-6 col-md-3 col-lg-3">'
					              				+ '<div class="shop-item"> <div class="shop-item-image">'
					              				+ '<img src="'
					              				+ JSONData[i].productImg1
				              					+ '" alt="Accessories Pack"/>'
				                  				+ '<div class="shop-item-detail"><span hidden="hidden">'
				                  				+ JSONData[i].auctionProductSubDetail
				                  				+ '</span><a class="btn btn-round btn-b">경매 시작하기!</a></div></div>'
				                  				+ '</span><h4 class="shop-item-title font-alt prodNmae"><a href="#">'
				                   				+ JSONData[i].auctionProductName
				                   				+ '</a></h4> <span>'
				                   				+ JSONData[i].hashtag1
	  											+ ' '
	  											+ JSONData[i].hashtag2
	  											+ ' '
	  											+ JSONData[i].hashtag3
	  											+ '</span>'
	  											+ '</div></div>'
				                  
				                 			str += stringHtml;
	  						}
							str += '</div><div class="container">'
	  						
	  						for (var i = 4; i < JSONData.length; i++) {
								var stringHtml = '<div class="col-sm-6 col-md-3 col-lg-3">'
					              				+ '<div class="shop-item"> <div class="shop-item-image">'
					              				+ '<img src="'
					              				+ JSONData[i].productImg1
				              					+ '" alt="Accessories Pack"/>'
				              					+ '<div class="shop-item-detail"><span hidden="hidden">'
				                  				+ JSONData[i].auctionProductSubDetail
				                  				+ '</span><a class="btn btn-round btn-b">경매 시작하기!</a></div></div>'
				                  				+ '<h4 class="shop-item-title font-alt prodNmae"><a href="#">'
				                   				+ JSONData[i].auctionProductName
				                   				+ '</a></h4> <span>'
				                   				+ JSONData[i].hashtag1
	  											+ ' '
	  											+ JSONData[i].hashtag2
	  											+ ' '
	  											+ JSONData[i].hashtag3
	  											+ '</span>'
	  											+ '</div></div>'
				                  
	  					                 		str += stringHtml;
	  		  									
	  						}
							str += '</div>'
	  						$("#append").append(str);
	  						page += 1;
  						}
  					});
  				}
  			});
  		
	  		$('body').on('click','.btn-b',function(){
	  			
	  			if(${empty sessionScope.user}){
	  				alert("로그인해 주세요.");
	  				return;
	  			}
	  			
	   			var auctionProductSubDetail = $(this).prev().text();
	   			var auctionProductName = $(this).parent().parent().next().text();
	   			var allhashtag = $(this).parent().parent().next().next().text();
	   			$("#auctionProductSubDetail").val(auctionProductSubDetail);
	   			$("#auctionProductName").val(auctionProductName);
	   			alert(allhashtag);
	   			$("#allhashtag").val(allhashtag);
	   			$('form').attr('method','post').attr('action','/auction/getAuctionProduct').submit();
	   		});
  	});
   	
   	$(document).ready
  		  	
  	</script>    
  </body>
</html>