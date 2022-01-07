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
    
    <link rel="apple-touch-icon" sizes="57x57" href="../../resources/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="../../resources/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="../../resources/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="../../resources/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="../../resources/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="../../resources/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="../../resources/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="../../resources/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="../../resources/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="../../resources/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../../resources/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../../resources/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../../resources/images/favicons/favicon-16x16.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    
    <link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="../../resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="../../resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../../resources/css/colors/default.css" rel="stylesheet">
  
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
                  <span>${product.hashtag1} ${product.hashtag2} ${product.hashtag2}</span>			
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
                  <span>${product.hashtag1} ${product.hashtag2} ${product.hashtag2}</span>			
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
	   			$("#allhashtag").val(allhashtag);
	   			$('form').attr('method','post').attr('action','/auction/getAuctionProduct').submit();
	   		});
  	});
   	
   	$(document).ready
  		  	
  	</script>    
  </body>
</html>