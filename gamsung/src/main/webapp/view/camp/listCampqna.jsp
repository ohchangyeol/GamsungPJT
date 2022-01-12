<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
		<!-- Vendor CSS -->
		<link href="../../resources/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
		<link href="../../resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet" />
		<link href="../../resources/lib/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
		<!-- Theme CSS -->
		<link href="../../resources/css/theme.css" rel="stylesheet" />
		<!-- Skin CSS -->
		<link href="../../resources/css/skins/default.css" rel="stylesheet" />
		<!-- Theme Custom CSS -->
		<link href="../../resources/css/theme-custom.css" rel="stylesheet" >
		<!-- Head Libs -->
		<script src="../../resources/lib/modernizr/modernizr.js"></script>
    <!-- JavaScripts -->
    <script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../resources/lib/wow/wow.js"></script>
    <script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
    <script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="../../resources/lib/smoothscroll.js"></script>
    <script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
    <script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../../resources/js/plugins.js"></script>
    <script src="../../resources/js/main.js"></script>
    
    <!-- Default stylesheets-->
    <link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Document Title -->
    <title>listRatingReview</title>

    
  </head>
  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" style="overflow: hidden; width: 100%; height: 100%;" >
    <div calss="row" >
      <div calss="col-sm-12" style="text-align: center; font-size: large;">
        <span class="icon-happy"></span>&nbsp;평점&리뷰 (전체 <span style="color: rgb(230, 173, 17);">${resultPage.totalCount}건</span>)&nbsp;<span class="icon-happy"></span>
      </div>
      <div calss="row" >
        
        <div class="row">
          <div class="fa-hover col-xs-12" style="text-align: end;">  
           
            평점
            <i class="fa fa-arrow-down" id="statusRatings" data-camp_no="${camp.campNo}" data-sort_condition="평점 높은순" ></i>
            
            등록일
            
            <i class="fa fa-arrow-down" id="reviewRegDate" data-camp_no="${camp.campNo}" data-sort_condition="최근 등록일순"></i>
            
            &nbsp;&nbsp;&nbsp;
          </div>
        </div>
        <hr>
      </div>
    </div>

    <form id="get_review">
      <c:set var="i" value="0" />
         <c:forEach var="review" items="${list}">
            <c:set var="i" value="${ i+1 }" />
            <div class="comments reviews">
                <div class="comment clearfix">
                  <div class="row">
                  <div class="img-responsive col-sm-3">
                     <img class="img-responsive" src="/uploadfiles/campimg/review/${review.img1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'"/>
                  </div>

                  <div class="comment-content clearfix col-sm-8" style="margin-left: 0px; margin-bottom: 0px;">
                    
                    <div class="comment-author">
                      <span style="font-size: large;">${review.user.nickName}</span>&nbsp;
                      <c:if test="${review.ratingReviewStatus == 1}">
                        (예약후기)
                      </c:if>
                      <c:if test="${review.ratingReviewStatus == 2}">
                        (커뮤니티글)
                      </c:if>
                      <span style="font-size: x-small;">&nbsp;&nbsp;&nbsp;${review.reviewRegDate}</span>
                    </div>
                                                            
                    <div class="comment-author">
                      <c:set var="rating" value="${review.statusRating}" />
                        <c:if test="${rating < 1.0}">
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                        </c:if>
                        <c:if test="${rating >= 1.0 && rating < 2.0}">
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                        </c:if>
                        <c:if test="${rating >= 2.0 && rating < 3.0}">
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                        </c:if>
                        <c:if test="${rating >= 3.0 && rating < 4.0}">
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                        </c:if>
                        <c:if test="${rating >= 4.0 && rating < 5.0}">
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star-off"></i></span>
                        </c:if>
                        <c:if test="${rating == 5.0}">
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                          <span><i class="fa fa-star star"></i></span>
                        </c:if>
                      <a class="open-tab section-scroll">&nbsp;(${review.statusRating})</a>
                    </div>
                    <div class="comment-body">
                      <p>${review.ratingReviewContent}</p>
                    </div>

                    <c:if test="${review.comment != null && review.comment != ''}">
                      <div class="row">
                      <div class="col-sm-1"></div>
                      <div class="comment-author font-alt">re : <span style="font-size: large;">${camp.user.campName}</span>
                        <span style="font-size: x-small;">&nbsp;${review.commentRegDate}</span></div>
                      </div>
                      <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="comment-body">
                          <p>&nbsp;&nbsp;${review.comment}</p>
                        </div>
                      </div>
                    </c:if>
                   
                  </div>
                </div>
              </div>
               </div>
              <hr>
      </c:forEach>

      <div class="row">
        <jsp:include page="../common/pageNavigator.jsp"/>
      </div>

  </form>
    
    <script type="text/javascript">
      document.body.style.overflow = "hidden";
    </script>


    <script src="../../resources/lib/bootstrap/js/bootstrap.js"></script>
		<script src="../../resources/lib/nanoscroller/nanoscroller.css"></script>
		<script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
		<script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
		<!-- Specific Page Vendor -->
		<script src="../../resources/lib/pnotify/pnotify.custom.js"></script>
		<!-- Theme Base, Components and Settings -->
		<script src="../../resources/js/theme.js"></script>
		<!-- Theme Custom -->
		<script src="../../resources/js/theme.custom.js"></script>
		<!-- Theme Initialization Files -->
		<script src="../../resources/js/theme.init.js"></script>
    <!-- Examples -->
		<script src="../../resources/js/examples.lightbox.js"></script>

</body>
</html>