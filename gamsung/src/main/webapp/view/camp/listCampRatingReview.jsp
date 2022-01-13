<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Document Title -->
    <title>listCampRatingReview</title>
      
      
      <!-- ### headerCampBusiness resources Start ### -->
      <script src="/resources/lib/jquery/jquery.js"></script>
      
      <!-- Favicons -->
      <meta name="msapplication-TileImage" content="/resources/images/favicons/ms-icon-144x144.png">    
      <meta name="msapplication-TileColor" content="#ffffff">  
      <meta name="theme-color" content="#ffffff">
     
      <!-- Stylesheets -->
      
      <!-- Default stylesheets-->
      <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      
      <!-- Template specific stylesheets-->
      <link href="/resources/lib/animate.css/animate.css" rel="stylesheet">
      <link href="/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
      <link href="/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
      <link href="/resources/lib/flexslider/flexslider.css" rel="stylesheet">
      <link href="/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
      <link href="/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
      <link href="/resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
      <link href="/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">       
      
      <!-- Main stylesheet and color file-->
      <link href="/resources/css/style.css" rel="stylesheet">
      <link id="color-scheme" href="/resources/css/colors/default.css" rel="stylesheet">  
      <!-- ### headerCampBusiness resources End ### -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
      <style>
      body {
              padding-top : 50px;
          }
      </style>

    <script type="text/javascript">

      let campNo = $("body").data("campno");
      let currentPage = 1;
    
      function fncGetList(currentPage) {
    
          $("#currentPage").val(currentPage)
          $("#pagenavi").attr("method","POST").attr("action","/campGeneral/listBusinessCampRatingReview").submit();
        }
        
        $( function() {
  
          $("#statusRatings").on("click" , function() {
              $("#rating_order").attr("method","POST").attr("action","/campGeneral/listBusinessCampRatingReview").submit();
          });
          
          $("#reviewRegDate").on("click" , function() {
              $("#regdate_order").attr("method","POST").attr("action","/campGeneral/listBusinessCampRatingReview").submit();
          });
  
        });
      </script>

</head>

<body id = "camp_review_list" data-campno="${campNo}" data-campname="${campSession.user.campName}">

    <!-- ToolBar -->
    <jsp:include page="/view/common/headerCampBusiness.jsp" />
       
       <!-- Page Start -->
    <div class="container">
      <div class="page-header text-info" style="padding-bottom: 30px;">
        <h3>평점 & 리뷰 내역</span>(전체 <span style="color: rgb(230, 173, 17);">${resultPage.totalCount}건</span>)</h3>
        <div calss="row" >
              <div calss="col-xs-12" style="text-align: start; font-size: medium;">
                <div class="col-xs-6" style="text-align: start;">
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
                    <a class="open-tab section-scroll" id="camp_avg_rating_substring" value="${campRating}"></a>
                  </div>
                  <div class="col-xs-6" style="text-align: end;">
                    <span>
                    평점
                    <i class="fa fa-arrow-down"  style="cursor: pointer;" id="statusRatings" data-camp_no="${camp.campNo}" data-sort_condition="평점 높은순" ></i>
                    등록일
                    <i class="fa fa-arrow-down"  style="cursor: pointer;" id="reviewRegDate" data-camp_no="${camp.campNo}" data-sort_condition="최근 등록일순"></i>
                    </span>
                  </div>
                </div>
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

                        <c:if test="${empty review.commentRegDate}">
                          <div><button type='button' class='btn btn-primary reply' value="${review.ratingReviewNo}">답글</button></div>
                        </c:if>

                        <c:if test="${! empty review.commentRegDate}">
                          <div class="row">
                              <div class="col-sm-1"></div>
                              <div class="comment-author font-alt">re : <span style="font-size: large;">${review.camp.user.campName}</span>
                                <span style="font-size: x-small;">&nbsp;${review.commentRegDate}&nbsp;&nbsp;</span>
                                <span class="camp_review_btn_span">
                                  <button type="button" id="correction_btn" class="btn btn-default" value="${review.ratingReviewNo}">수정</button>
                                  <button type="button" id="delete_btn" class="btn btn-danger" value="${review.ratingReviewNo}" >삭제</button>
                                </span>
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
        <input type="hidden" id="camp_ratingreview_comment" name="comment" value="">
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
    </div>

        <script type="text/javascript">
          
          window.onload = function() {
  
            let substring = " ("+$("#camp_avg_rating_substring").attr("value").substring(0, 3)+"점)";
            $("#camp_avg_rating_substring").html(substring);

          };
          
          $( function() {

            $('body').on("keyup",".form-control",  function() {

                var content = $(this).val();
                console.log("입력 값"+content);
                $("#camp_ratingreview_comment").val(content)

            });

            $('body').on('click','#correction_btn',function(){  
                    let reviewNo = $(this).val();
                    
                    console.log(reviewNo);

                    $("#camp_ratingreview_no").val(reviewNo);

                    let btn = "<button type='button' class='btn btn-default confirm'>확인</button>"
                  
                    let content = "<div class='col-sm-1'></div>"
                        content += "<div class='row'>"
                        content +="<div class='comment-body col-xs-7'>"
                        content +="<textarea class='form-control' name='reservationRequest' rows='5' id='request'></textarea>"
                        content +="</div>"
                        content +="</div>"
          
                    $(this).parent().parent().parent().next().empty();
                    $(this).parent().parent().parent().next().html(content);  

                    $(this).parent().append(btn);
                    $(this).next().remove();
                    $(this).remove();

                  });
                  
       
              $('body').on("click",".reply",  function() {

                    let reviewNo = $(this).val();
                    
                    console.log(reviewNo);

                    $("#camp_ratingreview_no").val(reviewNo);

                    
                    let btn = "<div class='col-xs-7 col-xs-offset-4' style='padding-left: 70px;'>"
                        btn += "<button type='button' class='btn btn-success addreview' style='margin-top: 15px; text-aligen: end;'>등록</button>"
                        btn += "</div>"
                    
                    let content = "<div class='row'>"
                        content +="<div class='comment-body col-xs-7'>"
                        content +="<textarea class='form-control' name='reservationRequest' rows='5' id='request'></textarea>"
                        content +="</div>"
                        content +="</div>"
                                  
                    $(this).parent().parent().append(content);
                    $(this).parent().parent().append(btn);
                   
                    $(this).remove();

              });

              $('body').on("click",".addreview",  function() {

                  let ratingReviewNo = $('#camp_ratingreview_no').val();
                  let comment = $('#camp_ratingreview_comment').val();
                  let campName = $('#camp_review_list').data('campname');
                  let append_node ="";
                  let btn = "";

                    console.log(ratingReviewNo);
                    console.log(comment);
                    console.log(campName);
                
                    $.ajax( 
                          {
                            url : "/campGeneral/json/updateReview/",
                            method : "POST" ,
                            dataType : "json" , 
                            context: this,
                            data : JSON.stringify({
                              "ratingReviewNo" : ratingReviewNo,
                              "comment" : comment
                            }),
                            headers : {
                              "Accept" : "application/json",
                              "Content-Type" : "application/json"
                            },
                            success : function(JSONData , status) {

                              let date = moment(JSONData.commentRegDate).format("YYYY-MM-DD");

                              append_node + "<div class='col-sm-1'></div>"
                              append_node += "<div class='comment-body'>"
                              append_node += "<p style='padding-left: 80px;''>&nbsp;&nbsp;"+JSONData.comment+"</p>"
                              append_node += "</div>"
                              
                              btn += " <div class='col-sm-1'></div>"
                              btn += "<div class='comment-author font-alt'>re : <span style='font-size: large;'>"+campName+"</span>"
                              btn += "<span style='font-size: x-small;'>&nbsp;"+date+"&nbsp;&nbsp;</span>"
                              btn += "<span class='camp_review_btn_span'>"
                              btn += "<button type='button' id='correction_btn' class='btn btn-default' style='margin-right: 5px;' value="+JSONData.ratingReviewNo+">수정</button>"
                              btn += "<button type='button' id='delete_btn' class='btn btn-danger' value="+JSONData.ratingReviewNo+" >삭제</button>"  
                              btn += "</span>"  
                              btn += "</div>"  
                        
                              $(this).parent().prev().empty();
                              $(this).parent().prev().html(btn);
                              
                              $(this).parent().parent().append(append_node);
                              $(this).parent().remove();

                              }

                          });

                        });
                             

                $('body').on('click','.confirm',function(){
  
                    let ratingReviewNo = $('#camp_ratingreview_no').val();
                    let comment = $('#camp_ratingreview_comment').val();
                    let append_node ="";
                    let btn = "";
  
                    console.log(ratingReviewNo);
                    console.log(comment);
                
                    $.ajax( 
                          {
                            url : "/campGeneral/json/updateReview/",
                            method : "POST" ,
                            dataType : "json" , 
                            context: this,
                            data : JSON.stringify({
                              "ratingReviewNo" : ratingReviewNo,
                              "comment" : comment
                            }),
                            headers : {
                              "Accept" : "application/json",
                              "Content-Type" : "application/json"
                            },
                            success : function(JSONData , status) {
  
                                    append_node + "<div class='col-sm-1'></div>"
                                    append_node += "<div class='comment-body'>"
                                    append_node += "<p style='padding-left: 80px;''>&nbsp;&nbsp;"+JSONData.comment+"</p>"
                                    append_node += "</div>"
                                    
                                    btn += "<button type='button' id='correction_btn' class='btn btn-default' style='margin-right: 5px;' value="+JSONData.ratingReviewNo+">수정</button>"
                                    btn += "<button type='button' id='delete_btn' class='btn btn-danger' value="+JSONData.ratingReviewNo+" >삭제</button>"  
                              
                                    $(this).parent().parent().parent().next().empty();
                                    $(this).parent().parent().parent().next().html(append_node);
                                    
                                    $(this).parent().append(btn);
                                    $(this).remove();
  
                                   }
  
                             });
                          
                    });
                              
                    $('body').on('click','#delete_btn',function(){
                      
                      let ratingReviewNo = $(this).val();
                      let btn = "";
                    
                      console.log(ratingReviewNo);

                      $.ajax( 
                            {
                              url : "/campGeneral/json/deletecomment/",
                              method : "POST" ,
                              dataType : "json" , 
                              context: this,
                              data : JSON.stringify({
                                "ratingReviewNo" : ratingReviewNo                               
                              }),
                              headers : {
                                "Accept" : "application/json",
                                "Content-Type" : "application/json"
                              },
                              success : function(JSONData , status) {
                                                                           
                                      btn += "<div><button type='button' class='btn btn-primary reply' value="+JSONData.ratingReviewNo+">답글</button></div>"
                                                                      
                                      $(this).parent().parent().parent().parent().append(btn);
                                      $(this).parent().parent().parent().next().remove();
                                      $(this).parent().parent().remove();

                                    }

                              });
                            
                      });
                  
                });
        </script>
  </body>
</html>  
