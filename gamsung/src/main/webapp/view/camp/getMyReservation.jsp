<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Document Title -->
    <title>예약내역</title>
     
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

  </head>

  <style>

    
  </style>

<body id="getReservation" data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
 
  <main>

    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="inner-wrapper">
      
        <jsp:include page="../common/userSideBar.jsp"></jsp:include>

        <section class="body">
          <div class="row getReservation" >
              <div class="col-xs-12">
                
                  <div class="row" style="padding-top: 20px;">
                      <div cl`ass="col-sm-12" style="text-align: center; font-size: x-large; margin-bottom: 10px;">
                        <span class="icon-happy"></span>&nbsp;예약 상세보기&nbsp;<span class="icon-happy"></span>
                      </div>
                    
                   	<h4 class="col-sm-7 mb-0"></h4>
                    <div class="col-sm-5 mb-sm-0">
                      <div class="row" style="text-align: center;">
                        <button class="btn btn-d btn-round" type="button" onclick="history.back()">목록가기</button>
                      </div>
                    </div>
                  </div>
                  <hr class="divider-w mt-10 mb-20">

                  <div class="container panel-body" style="margin-bottom: 20px;">

                        <form class="form-horizontal form-center">
                          
                          <div class="form-group" style="padding-top: 50px;">
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>캠핑장 이름</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px; font-weight: 1500;">${campReservation.camp.user.campName}</div>	
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>캠핑장 번호</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;">${campReservation.camp.user.campCall}</div>	
                            <div class="col-xs-1 col-md-1 "></div>	
                          </div>
                          
                          <div class="form-group">
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>이용시설</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;">${campReservation.mainSite.mainSiteType}</div>	
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>이용날짜</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px; font-weight: bold;">${campReservation.reservationStartDate} ~ ${campReservation.reservationEndDate}</div>	
                            <div class="col-xs-1 col-md-1 "></div>	
                          </div>

                          <div class="form-group">
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>예약날짜</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px; font-weight: bold;">${campReservation.reservationRegDate}</div>	
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>예약인원</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;">${campReservation.useNum} 명</div>	
                            <div class="col-xs-1 col-md-1 "></div>			
                          </div>
                          
                          <div class="form-group">
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>차량번호</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;">${campReservation.reservationRegCarNum}</div>	
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>예약자이름</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;">${campReservation.reservationUserName}</div>	
                            <div class="col-xs-1 col-md-1 "></div>			
                          </div>

                          <div class="form-group">
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>휴대폰번호</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;">${campReservation.reservationUserPhone}</div>	
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>결제금액</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;"><span style="color: rgb(255, 166, 0);">${campReservation.totalPaymentPrice} 원</span></div>	
                            <div class="col-xs-1 col-md-1 "></div>			
                          </div>	
                          
                          <div class="form-group">
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>요청사항</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;">${campReservation.reservationRequest}</div>	
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-3 col-md-1 panel-body" style="height: 40px; text-align: center; padding: 10px;"><strong>예약상황</strong></div>
                            <div class="col-xs-1 col-md-1 "></div>
                            <div class="col-xs-7 col-md-2 panel-body" style="height: 40px; text-align: center; padding: 10px;">
                              <c:choose>
                                <c:when test="${campReservation.reservationStatus eq 0}"><span style="color: rgb(0, 0, 0);">결제대기</span></c:when>
                                <c:when test="${campReservation.reservationStatus eq 1}"><span style="color: rgb(16, 112, 236);">예약완료</span></c:when>
                                <c:when test="${campReservation.reservationStatus eq 2}"><span style="color: rgb(16, 112, 236);">예약변경</span></c:when>
                                <c:when test="${campReservation.reservationStatus eq 3}"><span style="color: rgb(255, 0, 191);">양도대기</span></c:when>
                                <c:when test="${campReservation.reservationStatus eq 4}"><span style="color: rgb(255, 0, 191);">취소대기</span></c:when>
                                <c:when test="${campReservation.reservationStatus eq 5}"><span style="color: rgb(230, 17, 17);">양도완료</span></c:when>
                                <c:when test="${campReservation.reservationStatus eq 6}"><span style="color: rgb(230, 17, 17);">취소완료</span></c:when>
                                <c:when test="${campReservation.reservationStatus eq 7}"><span style="color: rgb(230, 17, 17);">이용완료</span></c:when>
                                <c:when test="${campReservation.reservationStatus eq 8}"><span style="color: maroon;">리뷰등록완료</span></c:when>
                              </c:choose>
                            </div>	
                            <div class="col-xs-1 col-md-1 "></div>			
                          </div>	
                                                    
                          <div class="form-group" style="padding-top: 20px;">
                              
                              <c:choose>
                                <c:when test="${campReservation.reservationStatus == 0}">
                                  <div class="col-md-12 text-center">
                                    <button type="button" class="btn btn-primary" value="${campReservation.reservationNo}">결제하기</button>
                                  </div>
                                </c:when>
                                <c:when test="${campReservation.reservationStatus == 1}">
                                   <div class="col-md-12 text-center">
                                      <div class="row">
                                          <div class="col-md-2"></div>
                                          <div class="alert alert-danger col-md-8" role="alert" style="text-align: center;">
                                            <div><strong>예약취소 환불 정보 안내</strong></div>
                                            <div>예약일 7일전 100% 6일전 90% 5일전 80% 4일전 70% 3일전 60% 2일전 50%</div>
                                            <div>당일 취소는 불가능 합니다.</div>
                                          </div>
                                          <div class="col-md-2"></div>
                                      </div>
                                    <div class="row" style="padding-top: 15px; padding-bottom: 15px;">
                                      <div>
                                        <button type="button" class="btn btn-success" value="${campReservation.reservationNo}">예약변경</button>
                                        <button type="button" class="btn btn-danger" value="${campReservation.reservationNo}">예약취소</button>
                                      </div>
                                    </div>
                                  </div>
                                </c:when>
                                <c:when test="${campReservation.reservationStatus == 2}">
                                      <div class="col-md-12 text-center">
                                        <div class="row">
                                            <div class="col-md-2"></div>
                                            <div class="alert alert-danger col-md-8" role="alert" style="text-align: center;">
                                              <div><strong>예약취소 환불 정보 안내</strong></div>
                                              <div>예약일 7일전 100% 6일전 90% 5일전 80% 4일전 70% 3일전 60% 2일전 50%</div>
                                              <div>당일 취소는 불가능 합니다.</div>
                                            </div>
                                            <div class="col-md-2"></div>
                                        </div>
                                      <div class="row" style="padding-top: 15px; padding-bottom: 15px;">
                                        <div>
                                          <button type="button" class="btn btn-success" value="${campReservation.reservationNo}">예약변경</button>
                                          <button type="button" class="btn btn-danger">예약취소</button>
                                        </div>
                                      </div>
                                    </div>
                                </c:when>
                                <c:when test="${campReservation.reservationStatus eq 7}">
                                  <div class="col-md-12 text-center">
                                    <button type="button" class="btn btn-warning" value="${campReservation.reservationNo}">평점&리뷰</button>
                                  </div>
                                </c:when>
                              </c:choose>
                              </div>
                               
                               </form>
                          </div>
                          
                       
                </div>

              </div>
             </section>
          </div>


    <form id="hidden">
      <input type="hidden" name="mainSite.mainSiteNo" value="${campReservation.mainSite.mainSiteNo}" />
      <input type="hidden" name="camp.campNo" value="${campReservation.camp.campNo}" />
      <input type="hidden" name="reservationStartDate" value="${campReservation.reservationStartDate}" />
      <input type="hidden" name="reservationEndDate" value="${campReservation.reservationEndDate}" />
      <input type="hidden" id="reservationNo" name="reservationNo" value="${campReservation.reservationNo}" />
      <input type="hidden" id="paymentRefundCode" name="paymentRefundCode"  value="R3" />
    </form>
  
  </main>  

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
    
    <script type="text/javascript">

      $( function() {
    	  
    	  console.log( $("#reservationNo").val()+" = "+$("#paymentRefundCode").val() );

        //예약변경
        $(".btn-success").on("click" , function() {
            
            self.location ="/campGeneral/updateMyReservationView?reservationNo="+$(this).attr("value");
          
          });

        //예약취소  
        $(".btn-danger").on("click" , function() {
          	self.location ="/payment/readyRefund?reservationNo="+$("#reservationNo").val()+"&paymentRefundCode="+$("#paymentRefundCode").val();
        });

        //평점&리뷰
        $(".btn-warning").on("click" , function() {
          
          self.location ="/campGeneral/addCampRatingReviewView?reservationNo="+$(this).attr("value");
        
        });

        //결제하기
        $(".btn-primary").on("click", function () {
              $("#hidden").attr("method", "POST").attr("action", "/campGeneral/addPaymentByMyPage").submit();
            });

      });

    </script>

</body>

</html>
