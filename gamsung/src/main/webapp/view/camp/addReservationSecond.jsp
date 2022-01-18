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

    <jsp:include page="../../resources/commonLib.jsp" />
    
    <link href="../../resources/css/theme.css" rel="stylesheet" />
    <link href="../../resources/css/skins/default.css" rel="stylesheet" />

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
      <!-- <div class="page-loader">
        <div class="loader">Loading...</div>
      </div> -->

      <!-- header -->      
      <jsp:include page="/view/common/header.jsp"/>
      <!-- header End -->
     <form id="reservation">
      <div class="main">
        
        <div class="row">
          <div class="col-xs-2"> </div>
          <div class="col-xs-8">
            <section class="panel form-wizard" id="w4">
              
              <div class="panel-body" style="margin-top: 50px;">
                <div class="wizard-progress wizard-progress-lg">
                  <div class="steps-progress">
                    <div class="progress-indicator" style="width: 0%;"></div>
                  </div>
                  <ul class="wizard-steps">
                    <li id=stepone>
                      <a data-toggle="tab"><span>1</span>예약하기 Step1</a>
                    </li>
                    <li class="active" id=steptwo>
                      <a data-toggle="tab"><span>2</span>예약하기 Step2</a>
                    </li>
                    <li id="stepthree">
                      <a data-toggle="tab"><span>3</span>예약하기 Step3</a>
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
                                <input type="number" name="useNum" id ="camp_use_num" value="1" min="1" max="${mainSite.mainSiteMaxCapacity}">
                                <span style="font-weight: bold; font-size: larger;">&nbsp;명</span>
                              
                            </div>
                            <div class="col-sm-12" style="text-align: center; margin-top: 10px;">
                              기본 ${mainSite.mainSiteMinCapacity}인 초과 선택시 추가금이 있습니다.
                            </div>
                          </div>
                          
                          <div class="row mb-20">
                            <div class="col-sm-12" style="text-align: center;">
                              
                                주차 대수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" name="totalReservationRegCar" id = "camp_use_car_num" value="0" min="0" max="${mainSite.mainSiteParkingSize}">
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
                              <div class="col-xs-12" style="margin-top: 15px;" id = "camp_use_info" camp_use_num="${mainSite.mainSiteMaxCapacity}" camp_use_car="${mainSite.mainSiteParkingSize}">${mainSite.mainSiteInfo}</div>
                             </div>
                             <hr>
                             <div class="row">
                               <div class="col-xs-12" style="font-size: medium;"> 기본 사용인원 : ${mainSite.mainSiteMinCapacity}인 (최대 사용인원 : ${mainSite.mainSiteMaxCapacity}인)</div>
                             </div>
                             <div class="row">
                               <div class="col-xs-12" style="font-size: medium; margin-top: 15px;" id="main_site_price" minprice="${mainSite.mainSiteMinPrice}" addprice="${mainSite.mainSiteAddPrice}"></div>
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

          window.onload = function() {
                let minprice = $('#main_site_price').attr("minprice");
                let addprice = $('#main_site_price').attr("addprice");
                let mincomma = minprice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
                let addcomma = addprice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
                
                return $('#main_site_price').html("이용가격(1박) : "+mincomma+"원 (인원 추가금 : "+addcomma+"원)");
          }

        $( function() {

            let start = new Date($("#startdate").val());
            let end = new Date($("#enddate").val());
            let total = Math.ceil((end.getTime()-start.getTime())/(1000*3600*24));
             
            $("#totaldate").text(total);

            $(  "#nextstepbtn"  ).on("click", function() {    
              var mainSiteNo = $("body").data("mainsiteno");

              $("#reservation").attr("method","POST").attr("action","/campGeneral/addReservation?mainSiteNo="+mainSiteNo).submit();
            }); 

            $("#camp_use_num").on("propertychange change keyup paste input", function() {				
                 let useNum = $("#camp_use_num").val();
                 let maxUse = $("#camp_use_info").attr("camp_use_num");
          
                 if(useNum > maxUse){
                    $("#camp_use_num").val(parseInt(maxUse));
                    return;
                 }
            });

            $("#camp_use_car_num").on("propertychange change keyup paste input", function() {	
                let carNum = $("#camp_use_car_num").val();
                let maxCar = $("#camp_use_info").attr("camp_use_car");
             
                if(carNum > maxCar){
                  $("#camp_use_car_num").val(parseInt(maxCar));
                  return;
                }
      
            });

        });
        
    </script>
  </body>
</html>
