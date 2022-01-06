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
    <title>addReservationSecond</title>
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

    <style>
    input[type='number']{
      width: 80px;
    }
    
    #nextstepbtn{
      width: 500px;
    }
    </style>
    
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
                    <li class="active" id=steptwo>
                      <a href="#step_two" data-toggle="tab"><span>2</span>예약하기 Step2</a>
                    </li>
                    <li id="stepthree">
                      <a href="#" data-toggle="tab"><span>3</span>예약하기 Step3</a>
                    </li>
                  </ul>
                </div>
        
                <form class="form-horizontal" novalidate="novalidate" id="nextstep">
                  <div class="tab-content">

                    <div id="step_two" class="tab-pane active">
                      <div class="row">
                        <div class="col-sm-6 mb-sm-40">
                            <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/camp/${camp.campMapImg}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" >
                        </div>
                        <div class="col-sm-6">
                          <div class="row">
                            <div class="col-sm-12">
                              <h1 class="product-title font-alt" style="margin-bottom: 0px; text-align: center;">예약정보</h1>
                            </div>
                          </div>
                          <hr>
                          <div class="row mb-20">
                            <div class="col-sm-12"  style="text-align: center;">
                              <div class="price">
                                <span style="font-size: larger;" >${campReservation.reservationStartDate}</span>
                                <span style="font-size: larger;">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                                <span style="font-size: larger; " >${campReservation.reservationEndDate}</span>
                                <span style="font-weight: bold; font-size: larger;">&nbsp;(</span>
                                <span style="font-weight: bold; font-size: larger;" id="totaldate"></span>
                                <span style="font-weight: bold; font-size: larger;">박)</span>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-20">
                            <div class="col-sm-12" style="text-align: center;">
                              
                                예약 인원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" name="useNum" value="1" min="1" max="${mainSite.mainSiteMaxCapacity}">
                                <span style="font-weight: bold; font-size: larger;">&nbsp;명</span>
                              
                            </div>
                            <div class="col-sm-12" style="text-align: center; margin-top: 10px;">
                              기본 ${mainSite.mainSiteMinCapacity}인 초과 선택시 추가금이 있습니다.
                            </div>
                          </div>
                          
                          <div class="row mb-20">
                            <div class="col-sm-12" style="text-align: center;">
                              
                                주차 대수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" name="totalReservationRegCar" value="1" min="1" max="${mainSite.mainSiteParkingSize}">
                                <span style="font-weight: bold; font-size: larger;">&nbsp;대</span>
                              
                            </div>
                            <div class="col-sm-12" style="text-align: center; margin-top: 10px;">
                              최대 ${mainSite.mainSiteParkingSize}대 까지 주차 등록이 가능합니다.
                            </div>
                          </div>

                          <hr>

                          <div class="row mb-20">
                            <div class="row">
                            <div class="col-sm-12" style="text-align: center;">
                              <a class="btn btn-lg btn-primary" id="nextstepbtn" style="margin-top: 30px;">다음단계</a>
                            </div>
                          </div>
                           </div>

                      </div>
                  </div>
                  <hr>
                  <div class="form-group" id="possible_mainsite" style="padding-top: 30px;">
                       <div class="row">
                          <div class="col-sm-3 mb-sm-20">
                            <a class="image-popup-vertical-fit">
                              <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" >
                            </a>
                          </div>
                          <div class="col-lg-9">
                             <div class="row">
                                <div class="col-xs-12" style="font-size: large; font-weight: bold ">${mainSite.mainSiteType}&nbsp;(${mainSite.mainSiteName})</div>
                             </div>   
                             <div class="row">
                              <div class="col-xs-12" style="margin-top: 15px;">${mainSite.mainSiteInfo}</div>
                             </div>
                             <hr>
                             <div class="row">
                               <div class="col-xs-12" style="font-size: medium;"> 기본 사용인원 : ${mainSite.mainSiteMinCapacity}인 (최대 사용인원 : ${mainSite.mainSiteMaxCapacity}인)</div>
                             </div>
                             <div class="row">
                               <div class="col-xs-12" style="font-size: medium; margin-top: 15px;"> 이용가격(1박) : ${mainSite.mainSiteMinPrice}원 (인원 추가금 : ${mainSite.mainSiteAddPrice}원)</div>
                             </div>
                             <div class="row">
                              <div class="col-xs-12" style="font-size: medium; margin-top: 15px;" > 주차가능대수 : ${mainSite.mainSiteParkingSize} 대</div>
                            </div>
                           </div>       
                       </div>
                   </div>
                </div>
              </div>
              <input type="hidden" id="campno" name="camp.campNo" value="${campReservation.camp.campNo}">
              <input type="hidden" id="startdate"  name="reservationStartDate" value="${campReservation.reservationStartDate}">
              <input type="hidden" id="enddate" name="reservationEndDate" value="${campReservation.reservationEndDate}">
              <input type="hidden" name="user.campName" value="${camp.user.campName}">
              <input type="hidden" name="mainSite.mainSiteType" value="${mainSite.mainSiteType}">
              <input type="hidden" name="mainSite.mainSiteName" value="${mainSite.mainSiteName}">
            </form>
          </div>
              
            </section>
          </div>
        </div>
      </div>
    </form>

    

    </main>
    <script type="text/javascript">
        
        $( function() {
            
            var start = $("#startdate").val();
            var end = $("#enddate").val();
            var total = end.replace(/-/gi, "") - start.replace(/-/gi, "");
             
            $("#totaldate").text(total);

            $(  "#nextstepbtn"  ).on("click", function() {    
              var mainSiteNo = $("body").data("mainsiteno");

              $("#reservation").attr("method","POST").attr("action","/campGeneral/addReservation?mainSiteNo="+mainSiteNo).submit();
            }); 
            
        });
        
    </script>
  </body>
</html>
