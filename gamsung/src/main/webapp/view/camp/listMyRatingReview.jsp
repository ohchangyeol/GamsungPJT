<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Document Title -->
    <title>listMyRatingReview</title>

    <jsp:include page="../../resources/commonLib.jsp" />
    <jsp:include page="/resources/commonCssMypage.jsp" />

    <style>
      .starR{
          background: url('http://127.0.0.1:8080/uploadfiles/ico_review.png') no-repeat right 0;
          background-size: auto 100%;
          width: 15px;
          height: 15px;
          display: inline-block;
          text-indent: -9999px;
          cursor: pointer;
        }
      .starR.on{background-position:0 0;}
      
    </style>

  </head>

<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  
  
   <main>

   <div class="inner-wrapper">
      <jsp:include page="../common/userSideBar.jsp"></jsp:include>
      
      <section class="body mypage-body">
        <div class="row getReservation" >
            <div class="col-xs-12">
              
              <div class="row" style="padding-top: 100px;">
                <div calss="col-sm-12" style="text-align: center; font-size: x-large; margin-bottom: 10px;">
                  <span class="icon-happy"></span>&nbsp;리뷰 내역&nbsp;<span class="icon-happy"></span>
                </div>
              </div>

              <div>
                <div class="fa-hover col-xs-12" style="text-align: center;">  
                    <span style="color :deeppink">답글이 있는 경우 리뷰 수정, 삭제가 불가능 합니다.</span>
                </div>  
              </div>

              <div class="row">
                <div class="fa-hover col-xs-10" style="text-align: end;">  
                 
                  평점
                  <i class="fa fa-arrow-down"  style="cursor: pointer;" id="statusRatings" data-sort_condition="평점 높은순" ></i>
                  
                  등록일
                  
                  <i class="fa fa-arrow-down"  style="cursor: pointer;" id="reviewRegDate" data-sort_condition="최근 등록일순"></i>
                  
                  &nbsp;&nbsp;&nbsp;
                </div>
              </div>

                <div class="container panel-body" style="margin-bottom: 20px; padding: 70px;">

                  <form id="get_review">
                      <c:set var="i" value="0" />
                        <c:forEach var="review" items="${list}">
                            <c:set var="i" value="${ i+1 }" />
                            <div class="comments reviews">
                                <div class="comment clearfix">
                                  <div class="row">
                                  <div class="img-responsive col-sm-3 galleryCont">
                                    <img class="img-responsive photo" src="/uploadfiles/campimg/review/${review.img1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'"/>
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
                                      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                      <span class="review_btn_span">
                                         <c:if test="${review.commentRegDate == null}">
                                            <button type="button" class="btn btn-primary" value="${review.ratingReviewNo}" data-nick="${review.user.nickName}">수정</button>
                                            <button type="button" class="btn btn-danger" value="${review.ratingReviewNo}" >삭제</button>
                                         </c:if>
                                      </span>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="comment-author" style="margin-left: 15px; margin-bottom: 15px;">
                                          
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
                                          <span>&nbsp;(${review.statusRating})</span>
                                        </div>
                                    </div>

                                    <div class="row">
                                      <p style="padding-left: 20px;">${review.ratingReviewContent}</p>
                                    </div>
                                    
                                    <c:if test="${review.commentRegDate != null}">
                                      <div class="row">
                                          <div class="col-sm-1"></div>
                                          <div class="comment-author font-alt">
                                            re : <span style="font-size: large;">${review.camp.user.campName}</span>
                                                 <span style="font-size: x-small;">&nbsp;${review.commentRegDate}</span>
                                          </div>
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
                  
                  <form id="update_review">
                  <input type="hidden" id="camp_ratingreview_no" name="ratingReviewNo" value=>
                  <input type="hidden" id="camp_ratingreview_content" name="ratingReviewContent" value="">
                  <input type="hidden" id="camp_status_rating" name="statusRating" value=1.0>
                  </form>

                  <form id="rating_order">  
                    <input type="hidden" name="sortCondition" value="평점 높은순">
                  </form>
                  
                  <form id="regdate_order">  
                    <input type="hidden" name="sortCondition" value="최근 등록일순">
                  </form>
              
                  <form id="pagenavi">
                    <input type="hidden" id="currentPage" name="currentPage" value="0"/>
                    <input type="hidden" name="sortCondition" value="${search.sortCondition}">
                  </form>

              </div>

            </div>
        </div>
      </section>
    
      </div>
      
   </main>    
   <jsp:include page="/resources/commonScriptMypage.jsp" />
     <script type="text/javascript">

          var currentPage = 1;
        
          function fncGetList(currentPage) {
              $("#currentPage").val(currentPage)
              $("#pagenavi").attr("method","POST").attr("action","/campGeneral/listMyCampRatingReview").submit();
            }

        $( function() {

            $('body').on("click", ".starRev span", function(){
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                var append = "&nbsp;&nbsp;&nbsp;("+$(this).data('star')+ "점)";
                
                console.log("선택 평점"+$(this).data("star"));

                $("#camp_status_rating").val($(this).data("star"));
                $("#result_star").empty();
                $("#result_star").append(append);
                
                return false;
            });

            $('body').on("keyup",".form-control",  function() {

              var content = $(this).val();
              
              $("#camp_ratingreview_content").val(content)

            });

            $('body').on('click','.btn-primary',function(){  
                var reviewNo = $(this).val();
                      
                      

                      $("#camp_ratingreview_no").val(reviewNo);

                  var btn = "<button type='button' class='btn btn-default confirm'>확인</button>"

                  var star = "<div class='starRev col-xs-4' style='text-align: start; top: 3px; padding-left: 20px; padding-bottom: 20px;'>"
                      star +="<span class='starR on' data-star=1.0>별1</span>"
                      star +="<span class='starR'    data-star=2.0>별2</span>"
                      star +="<span class='starR'    data-star=3.0>별3</span>"
                      star +="<span class='starR'    data-star=4.0>별4</span>"
                      star +="<span class='starR'    data-star=5.0>별5</span>"
                      star +="<span id='result_star' style=''text-align: center;'></span>"
                      star +="</div>"                                          
                
                  var content = "<div class='row'>"
                      content +="<div class='comment-body col-xs-7'>"
                      content +="<textarea class='form-control' name='reservationRequest' rows='5' id='request'></textarea>"
                      content +="</div>"
                      content +="</div>"

                  $(this).parent().parent().next().empty();    
                  $(this).parent().parent().next().append(star);          
                  $(this).parent().parent().next().next().empty();
                  $(this).parent().parent().next().next().html(content);  

                  $(this).parent().append(btn);
                  $(this).next().remove();
                  $(this).remove();
            });

           $('body').on('click','.confirm',function(){

              let ratingReviewNo = $('#camp_ratingreview_no').val();
              let ratingReviewContent = $('#camp_ratingreview_content').val();
              let statusRating = $('#camp_status_rating').val();
              let append_node ="";
              let btn = "";
              let review_star ="";
            
              $.ajax( 
                    {
                      url : "/campGeneral/json/updateReview/",
                      method : "POST" ,
                      dataType : "json" , 
                      context: this,
                      data : JSON.stringify({
                        "ratingReviewNo" : ratingReviewNo,
                        "ratingReviewContent" : ratingReviewContent,
                        "statusRating" : statusRating
                      }),
                      headers : {
                        "Accept" : "application/json",
                        "Content-Type" : "application/json"
                      },
                      success : function(JSONData , status) {
             
                              append_node += "<p style='padding-left: 20px;'>"+JSONData.ratingReviewContent+"</p>"

                              review_star +="<div class='comment-author' style='margin-left: 15px; margin-bottom: 15px;'>"

                              if(JSONData.statusRating < 1.0){
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                              }else if(JSONData.statusRating >= 1.0 && JSONData.statusRating < 2.0){
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                              }else if(JSONData.statusRating >= 2.0 && JSONData.statusRating < 3.0){
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                              }else if(JSONData.statusRating >= 3.0 && JSONData.statusRating < 4.0){
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                              }else if(JSONData.statusRating >= 4.0 && JSONData.statusRating < 5.0){
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star-off'></i></span>"
                              }else{
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                                review_star +="<span><i class='fa fa-star star'></i></span>"
                              }

                              review_star +="<span> ("+JSONData.statusRating+")</span>"
                              review_star +="</div>"
                             
                              btn += "<button type='button' class='btn btn-primary' style='margin-right: 5px;' value="+JSONData.ratingReviewNo+">수정</button>"
                              btn += "<button type='button' class='btn btn-danger' value="+JSONData.ratingReviewNo+" >삭제</button>"  
                              
                              $(this).parent().parent().next().empty();
                              $(this).parent().parent().next().html(review_star);

                              $(this).parent().parent().next().next().empty();
                              $(this).parent().parent().next().next().html(append_node);

                              $(this).parent().append(btn);
                              $(this).remove();

                      }

                 });
                        
            })


          $('body').on('click','.btn-danger',function(){
              self.location ="/campGeneral/deleteMyCampRatingReview?ratingReviewNo="+$(this).attr("value");
          });
          
          $("#statusRatings").on("click" , function() {
              $("#rating_order").attr("method","POST").attr("action","/campGeneral/listMyCampRatingReview").submit();
          });
          
          $("#reviewRegDate").on("click" , function() {
              $("#regdate_order").attr("method","POST").attr("action","/campGeneral/listMyCampRatingReview").submit();
          });
  
        });
      </script>

  </body>

</html>