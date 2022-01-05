<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Document Title -->
    <title>listRatingReview</title>
    <script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    
      console.log("2222222"+list);
  </script>
  </head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

          
          <div>리뷷다다다다다다</div>
   
          <form id="get_review">
            <c:set var="i" value="0" />
              <c:forEach var="review" items="${list}">
                  <c:set var="i" value="${ i+1 }" />
                  <div class="comments reviews">
                      <div class="comment clearfix">
                        <div class="img-responsive col-sm-4"><img src="/uploadfiles/campimg/review/${review.img1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'"/></div>
                        <div class="comment-content clearfix col-sm-8" style="margin-left: 0px;">
                          <div class="comment-author font-alt">${review.user.nickName}&nbsp;&nbsp;&nbsp;${review.reviewRegDate}</div>
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
                         
                        </div>
                      </div>
                     </div>
                    <hr>
            </c:forEach>
            

        <form id="pagenavi">
          <input type="hidden" id="currentPage" name="currentPage" value="0"/>
          <input type="hidden" name="campNo" value="${campNo}"/>
        </form>

         <!-- PageNavigation -->
         <div class="row">
          <jsp:include page="../common/pageNavigator.jsp"/>
       </div>
       </form>
    
</body>
</html>