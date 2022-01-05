<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>GamsungCamp</title>
    
	<jsp:include page="resources/commonLib.jsp"></jsp:include>
	
    <style>

      .campImg { display : block;
            margin : auto;
            width: 100%;
            height: 250px;}
            
   
		#findIdModal {
			z-index: 1041;
			position: fixed;
        	width: 100%;
        	height: 100vh;
		    /* top: 50% */
		    /* left: 0; */
		    /* right: 0; */
		    /* bottom: 0; */
		    /*background: #0b0b0b6b;*/
		    /*display: inline-block;*/
    		/*vertical-align: middle;*/
    		/* transform: translateY(-50%); */
    	}
      .find {
			/* z-index: 1041; */
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    /* right: 0; */
		    /* bottom: 0; */
		    /*background: #0b0b0b6b;*/
		    /*display: inline-block;*/
    		/*vertical-align: middle;*/
    		transform: translateY(-50%) translateX(-50%);
    	}
    	

      .shop-item-title { 
		    text-decoration: none;
		    color: #333;
		    text-overflow: ellipsis;
		}

    </style>

  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
     
    <main>
      	
	<!-- findIdModal -->
	<jsp:include page="/view/user/findIdModal.jsp"/>
	
	<!-- page-loader -->
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      
      <!-- header -->
      <jsp:include page="/view/common/header.jsp"/>
      <!-- header End -->
      
      <!-- Search -->
      <jsp:include page="/view/camp/campSearch.jsp"/> 
      <!-- Search End -->
      
      <!-- page-start -->
      </section>
      <div class="main showcase-page">
        <section class="module-extra-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-md-8 col-lg-9">
                <div class="callout-text font-alt">
                  <h4 style="margin-top: 0px;">Start Creating Beautiful Websites</h4>
                  <p style="margin-bottom: 0px;">Download Titan Free today!</p>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="callout-btn-box"><a class="btn btn-border-w btn-circle" href="https://themewagon.com/themes/titan/">Downlaod Free</a></div>
              </div>
            </div>
          </div>
        </section>


        <section class="module-medium" id="demos">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">추천 캠핑장</h2>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-4">
              <div class="post">
                <div class="post-thumbnail"><img class="campImg" campNo="${topView.campNo}" src="/uploadfiles/campimg/campbusiness/camp/${topView.campImg1}" alt="Blog-post Thumbnail"></div>
                <div class="post-header font-alt">
                  <h2 class="post-title">조회수 TOP</a></h2>
                </div>
                <div class="post-more">${topView.user.campName} 캠핑장 <span style="color: rgb(230, 173, 17);">(${topView.campViewCountCurrentMonth}건)</span></div>
                <div class="post-entry">
                  <p>${topView.user.addr}</p>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-4">
              <div class="post">
                <div class="post-thumbnail"><img class="campImg" campNo="${topRating.campNo}" src="/uploadfiles/campimg/campbusiness/camp/${topRating.campImg1}" alt="Blog-post Thumbnail"></div>
                <div class="post-header font-alt">
                  <h2 class="post-title">평점 TOP</a></h2>
                </div>
                <div class="post-more">${topRating.user.campName} 캠핑장 <span style="color: rgb(230, 173, 17);">(${topRating.campRate}점)</span></div>
                <div class="post-entry">
                  <p>${topRating.user.addr}</p>
                </div>
              </div>
            </div><div class="col-sm-6 col-md-4 col-lg-4">
              <div class="post">
                <div class="post-thumbnail"><img class="campImg" campNo="${topReservation.campNo}" src="/uploadfiles/campimg/campbusiness/camp/${topReservation.campImg1}" alt="Blog-post Thumbnail"></div>
                <div class="post-header font-alt">
                  <h2 class="post-title">예약자수 TOP</a></h2>
                </div>
                <div class="post-more">${topReservation.user.campName} 캠핑장 <span style="color: rgb(230, 173, 17);">(${topReservation.campReservationCount}건)</span></div>
                <div class="post-entry">
                  <p>${topReservation.user.addr}</p>
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
                <h2 class="module-title font-alt">추천 경매 상품</h2>
                <div class="module-subtitle font-serif">선착순 12개의 상품이 올라옵니다.</div>
              </div>
            </div>
            <div class="row">
              <div class="owl-carousel text-center" data-items="4" data-pagination="false" data-navigation="false">
                <c:forEach var="auctionProduct" items="${productList}">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product">
                      <a><img src="${auctionProduct.productImg1}"/></a>
                      <input type="hidden" value="${auctionProduct.auctionProductNo}">
                      <h4 class="shop-item-title"><a>${auctionProduct.auctionProductName}</a></h4>
                      <h5><fmt:formatNumber type="number" maxFractionDigits="3" value="${auctionProduct.hopefulBidPrice}"/>원</h5>
                      <h5>${auctionProduct.auctionEndTime}</h5>
                    </div>
                  </div>
                </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </section>
        <hr class="divider-w">
        <section class="module-extra-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-md-8 col-lg-9">
                <div class="callout-text font-alt">
                  <h4 style="margin-top: 0px;">Start Creating Beautiful Websites</h4>
                  <p style="margin-bottom: 0px;">Download Titan Free today!</p>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="callout-btn-box"><a class="btn btn-border-w btn-circle" href="https://themewagon.com/themes/titan/">Downlaod Free</a></div>
              </div>
            </div>
          </div>
        </section>
        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
    <!-- chatting -->
    <div id="messenger-btn" class="chatting-btn"><i class="fa fa-fw"></i></div>
    <div id="messenger-iframe" class="ch-messenger-hidden">
      <iframe src="/chat/chatlist" frameborder="1" style="position:relative!important;height:100%;width:100%!important;border:none!important;"></iframe>
    </div>
    
    <script src="resources/js/campSearch.js"></script>
    <script type="text/javascript">
    	$('.shop-item-title').on('click',function(){
    		window.location = '/auction/getAuctionProduct?auctionProductNo='+$(this).prev().val();
    	});
      $('.campImg').on('click',function(){
    		window.location = '/campGeneral/getCamp?campNo='+$(this).attr('campNo');
    	});
    </script>



  </body>

</html>


