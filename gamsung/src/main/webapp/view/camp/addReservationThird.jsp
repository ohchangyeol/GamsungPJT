<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta accept="application/json" content-type="application/json" charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Document Title -->
    <title>addReservationThird</title>
    <link rel="apple-touch-icon" sizes="57x57"	href="../../resources/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60"	href="../../resources/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72"	href="../../resources/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76"	href="../../resources/images/favicons/apple-icon-76x76.png">
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
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"	rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css"	rel="stylesheet">
    <link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="../../resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="../../resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../../resources/css/colors/default.css" rel="stylesheet">

    
  </head>
  <body data-mainsiteno ="${mainSite.mainSiteNo}">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>

      <!-- header -->      
      <jsp:include page="/view/common/header.jsp"/>
      <!-- header End -->
     <form id="reservation">
      <div class="main">
        
        <div class="row">
          <div class="col-xs-2"> </div>
          <div class="col-xs-8">
            <section class="panel form-wizard" id="w4">
              
              <div class="panel-body" style="margin-top: 100px;">
                <div class="wizard-progress wizard-progress-lg">
                  <div class="steps-progress">
                    <div class="progress-indicator" style="width: 0%;"></div>
                  </div>
                  <ul class="wizard-steps">
                    <li id=stepone>
                      <a href="#" data-toggle="tab"><span>1</span>예약하기 Step1</a>
                    </li>
                    <li id=steptwo>
                      <a href="#" data-toggle="tab"><span>2</span>예약하기 Step2</a>
                    </li>
                    <li class="active" id="stepthree">
                      <a href="#step_three" data-toggle="tab"><span>3</span>예약하기 Step3</a>
                    </li>
                  </ul>
                </div>
        
                <form class="form-horizontal" novalidate="novalidate" id="nextstep">
                  <div class="tab-content">

                    <div id="step_three" class="tab-pane active">
                      <div class="row">
                        <div class="col-sm-6">
                          <div class="row">
                            <div class="col-sm-12">
                              <h1 class="product-title font-alt" style="margin-bottom: 0px; text-align: center;">${campReservation.user.campName} 캠핑장</h1>
                            </div>
                          </div>
                          <hr>
                          <div class="row mb-20">
                            <div class="col-sm-4"  style="text-align: end; font-size: larger;">
                              이용시설  :  
                            </div>
                            
                            <div class="col-sm-8"  style="text-align: start; font-size: larger;">
                              ${mainSite.mainSiteType} - ${mainSite.mainSiteName} (site)
                            </div>
                          </div>
                          <div class="row mb-20">
                            <div class="col-sm-4"  style="text-align: end; font-size: larger;">
                              기간  :  
                            </div>
                            
                            <div class="col-sm-8"  style="text-align: start; font-size: medium;">
                              <div class="price">
                                <span style="font-size: medium;" >${campReservation.reservationStartDate}</span>
                                <span style="font-size: medium;">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                                <span style="font-size: medium; " >${campReservation.reservationEndDate}</span>
                                <span style="font-weight: bold; font-size: larger;">&nbsp;(</span>
                                <span style="font-weight: bold; font-size: larger;" id="totaldate"></span>
                                <span style="font-weight: bold; font-size: larger;">박)</span>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-20">
                            <div class="col-sm-4"  style="text-align: end; font-size: larger;">
                              예약인원  :  
                            </div>
                            
                            <div class="col-sm-8"  style="text-align: start; font-size: larger;">
                              ${campReservation.useNum} 명
                            </div>
                          </div>
                          <div class="row mb-20">
                            <div class="col-sm-4"  style="text-align: end; font-size: larger;">
                              주차 대수  :  
                            </div>
                            
                            <div class="col-sm-8"  style="text-align: start; font-size: larger;">
                              ${campReservation.totalReservationRegCar} 대
                            </div>
                          </div><div class="row mb-20">
                            <div class="col-sm-4"  style="text-align: end; font-size: larger;">
                              총 요금  :  
                            </div>
                            
                            <div class="col-sm-8"  style="text-align: start; color: rgb(230, 173, 17);">
                              <span style="font-weight: bold; font-size: xx-large;"  id="totalprice"></span>
                              <span style="font-size: larger; " >원</span>
                            </div>
                          </div>
                        </div>

                        <div class="col-sm-6">
                          <div class="row mb-20" style="margin-top: 100px;">
                            <div class="col-sm-3"  style="text-align: end; font-size: larger;">
                              예약자 이름  :  
                            </div>
                            
                            <div class="col-sm-7"  style="text-align: start; font-size: larger;">
                              <input type="text" name="reservationUserName">
                            </div>
                          </div>
                          <div class="row mb-20" style="margin-top: 25px;">
                            <div class="col-sm-3"  style="text-align: end; font-size: larger;">
                              휴대폰 번호  :  
                            </div>
                            
                            <div class="col-sm-7"  style="text-align: start; font-size: larger;">
                              <input type="text" name="reservationUserPhone" placeholder="'-' 없이 입력해주세요.">
                            </div>
                          </div>
                          <div class="row mb-20" style="margin-top: 25px;">
                            <div class="col-sm-3"  style="text-align: end; font-size: larger;">
                              차 량  번 호  :  
                            </div>
                            
                            <div class="col-sm-7"  style="text-align: start; font-size: larger;">
                              <input type="text" name="reservationRegCarNum">
                            </div>
                          </div>
                          <div class="row mb-20" style="margin-top: 25px;">
                            <div class="col-sm-3"  style="text-align: end; font-size: larger;">
                              요 청  사 항  :  
                            </div>
                            
                            <div class="col-sm-7"  style="text-align: start; font-size: larger;">
                              <textarea class="form-control" name="reservationRequest" rows="10" id="request"></textarea>
                              <div id="request_cnt">(0 / 1000)</div>
                            </div>
                          </div>
                    
                      </div>
                 
                  </div>
                  <hr>
                  <div class="row mb-20">
                    <div class="row">
                    <div class="col-sm-12" style="text-align: center;">
                      <a class="btn btn-lg btn-primary" id="nextstepbtn" style="margin-top: 30px;">결제하기</a>
                    </div>
                  </div>
                   </div>
                 
                </div>
              </div>
              <input type="hidden" id="campno" name="camp.campNo" value="${campReservation.camp.campNo}">
              <input type="hidden" id="startdate"  name="reservationStartDate" value="${campReservation.reservationStartDate}">
              <input type="hidden" id="enddate" name="reservationEndDate" value="${campReservation.reservationEndDate}">
              <input type="hidden" id="useNum"  name="useNum" value="${campReservation.useNum}">
              <input type="hidden" id="regCar"  name="totalReservationRegCar" value="${campReservation.totalReservationRegCar}">
              <input type="hidden" id="paymentPrice"  name="totalPaymentPrice" value="">


              <input type="hidden" id="minCapacity" value="${mainSite.mainSiteMinCapacity}">
              <input type="hidden" id="minprice"value="${mainSite.mainSiteMinPrice}">
              <input type="hidden" id="addPrice" value="${mainSite.mainSiteAddPrice}">
             
            </form>
              </div>
              
            </section>
          </div>
        </div>
      </div>
    </form>

    <input type="hidden" id="campno" value="${campReservation.camp.campNo}">
    </main>
    <script type="text/javascript">
        //기본금액*박수 +(if(이용인원 > 기본인원){(이용인원 - 기본인원)*추가금액*박수})
        $( function() {
            
            var start = $("#startdate").val();
            var end = $("#enddate").val();
            var minprice = $("#minprice").val();
            var useNum = $("#useNum").val();
            var minCapacity = $("#minCapacity").val();
            var addPrice = $("#addPrice").val();
            var total = end.replace(/-/gi, "") - start.replace(/-/gi, "");

            if(useNum <= minCapacity){
              var mintotalprice = minprice * total;
              $("#totalprice").text(mintotalprice);
              $("input#paymentPrice").val(mintotalprice);
            }

            if(useNum > minCapacity){
              var mintotalprice = minprice * total;
              var addtotalprice = (useNum - minCapacity) * addPrice * total;
              var totalprice = mintotalprice + addtotalprice;
              $("#totalprice").text(totalprice);
              $("input#paymentPrice").val(totalprice);
            }
            
            $('#request').on('keyup', function() {
                $('#request_cnt').html("("+$(this).val().length+" / 1000)");
        
                if($(this).val().length > 1000) {
                    $(this).val($(this).val().substring(0, 1000));
                    $('#request_cnt').html("(1000 / 1000)");
                }
            });
             
            $("#totaldate").text(total);

            $(  "#nextstepbtn"  ).on("click", function() {    
              var mainSiteNo = $("body").data("mainsiteno");
              $("#reservation").attr("method","POST").attr("action","/campGeneral/addPayment?mainSiteNo="+mainSiteNo).submit();
            }); 
            
        });

    </script>
  </body>
</html>