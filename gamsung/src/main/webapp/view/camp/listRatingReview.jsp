<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <jsp:include page="../../resources/commonLib.jsp" />

    <!-- Document Title -->
    <title>listRatingReview</title>

    <script type="text/javascript">

      var campNo = $("body").data("campno");
      var currentPage = 1;
    
      function fncGetList(currentPage) {
          $("#currentPage").val(currentPage)
          $("#pagenavi").attr("method","POST").attr("action","/campGeneral/listCampRatingReview").submit();
        }
        
        $( function() {
  
          $("#statusRatings").on("click" , function() {
              $("#rating_order").attr("method","POST").attr("action","/campGeneral/listCampRatingReview").submit();
          });
          
          $("#reviewRegDate").on("click" , function() {
              $("#regdate_order").attr("method","POST").attr("action","/campGeneral/listCampRatingReview").submit();
          });
  
        });
      </script>

  </head>
  
  <body id = "reviewschange" data-spy="scroll" data-target=".onpage-navigation" data-offset="60" style="overflow: hidden; width: 100%; height: 100%;" data-campno="${campNo}" >
    <div calss="row" >
      <div calss="col-sm-12" style="text-align: center; font-size: large;">
        <span class="icon-happy"></span>&nbsp;평점&리뷰 (전체 <span style="color: rgb(230, 173, 17);">${resultPage.totalCount}건</span>)&nbsp;<span class="icon-happy"></span>
      </div>
      
      <div calss="row" >
        <div calss="col-sm-12" style="text-align: center; font-size: medium;">
          &nbsp;평균평점&nbsp;
          <c:set var="rating" value="${campRating}" />
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
              <a class="open-tab section-scroll" id = "sub_camp_rating" value="${campRating}"></a>
        </div>
        <div class="row">
          <div class="fa-hover col-xs-12" style="text-align: end;">  
           
            평점
            <i class="fa fa-arrow-down"  style="cursor: pointer;" id="statusRatings" data-camp_no="${camp.campNo}" data-sort_condition="평점 높은순" ></i>
            
            등록일
            
            <i class="fa fa-arrow-down"  style="cursor: pointer;" id="reviewRegDate" data-camp_no="${camp.campNo}" data-sort_condition="최근 등록일순"></i>
            
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
                      <div class="comment-author font-alt">re : <span style="font-size: large;">${review.camp.user.campName}</span>
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
    
    <form id="rating_order">  
      <input type="hidden" name="sortCondition" value="평점 높은순">
      <input type="hidden" name="campNo" value="${campNo}"/>
    </form>
    <form id="regdate_order">  
      <input type="hidden" name="sortCondition" value="최근 등록일순">
      <input type="hidden" name="campNo" value="${campNo}"/>
    </form>

    <form id="pagenavi">
      <input type="hidden" id="currentPage" name="currentPage" value="0"/>
      <input type="hidden" name="sortCondition" value="${search.sortCondition}">
      <input type="hidden" name="campNo" value="${campNo}"/>
    </form>

    <script type="text/javascript">
      parent.reviewIframeHeight(document.getElementById("reviewschange").scrollHeight);

      window.onload = function() {
            
            let substring = " ("+$("#sub_camp_rating").attr("value").substring(0, 3)+")";
            
            $("#sub_camp_rating").html(substring);

          };

    </script>

</body>
</html>