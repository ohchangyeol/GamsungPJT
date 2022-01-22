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

    <jsp:include page="../../resources/commonLib.jsp" />
    
    <link href="../../resources/css/theme.css" rel="stylesheet" />
    <link href="../../resources/css/skins/default.css" rel="stylesheet" />

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
                    <li id=steptwo>
                      <a data-toggle="tab"><span>2</span>예약하기 Step2</a>
                    </li>
                    <li class="active" id="stepthree">
                      <a data-toggle="tab"><span>3</span>예약하기 Step3</a>
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
                              <h1 class="product-title font-alt" style="margin-bottom: 0px; text-align: center;">${campReservation.user.campName}</h1>
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
                          </div>
                          <div class="row mb-20">
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
                              예약자이름:  
                            </div>
                            
                            <div class="col-sm-7"  style="text-align: start; font-size: larger;">
                              <input type="text" name="reservationUserName">
                            </div>
                          </div>
                          <div class="row mb-20" style="margin-top: 25px;">
                            <div class="col-sm-3"  style="text-align: end; font-size: larger;">
                              휴대폰번호:  
                            </div>
                            
                            <div class="col-sm-7"  style="text-align: start; font-size: larger;">
                              <input type="text" name="reservationUserPhone" placeholder="'-' 없이 입력해주세요.">
                            </div>
                          </div>
                          <div class="row mb-20" style="margin-top: 25px;">
                            <div class="col-sm-3"  style="text-align: end; font-size: larger;">
                              차 량  번 호 :  
                            </div>
                            
                            <div class="col-sm-7"  style="text-align: start; font-size: larger;">
                              <input type="text" name="reservationRegCarNum">
                            </div>
                          </div>
                          <div class="row mb-20" style="margin-top: 25px;">
                            <div class="col-sm-3"  style="text-align: end; font-size: larger;">
                              요 청  사 항 :  
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
                      <a class="modal-basic btn btn-lg btn-danger" style="margin-top: 30px;" href="#modalWarning">결제하기</a>
                      <div id="modalWarning" class="modal-block modal-block-warning mfp-hide">
                        <section class="panel">
                          <header class="panel-heading">
                            <h2 class="panel-title">안내</h2>
                          </header>
                          <div class="panel-body">
                            <div class="modal-wrapper">
                              <div class="modal-icon">
                                <i class="fa fa-warning"></i>
                              </div>
                              <div class="modal-text">
                                <p style="margin-bottom: 5px;">예약 임시 등록 후 결제 페이지로 넘어갑니다.</p>
                                <p style="margin-bottom: 5px;">당일 결제 진행 안할 시에는 자동 취소 됩니다.</p>
                                <p>예약 결제는 마이페이지에서 할 수 있습니다.</p>
                              </div>
                            </div>
                          </div>
                          <footer class="panel-footer">
                            <div class="row">
                              <div class="col-md-12 text-right">
                                <button class="btn btn-warning modal-dismiss" id="nextstepbtn">확인</button>
                              </div>
                            </div>
                          </footer>
                        </section>
                      </div>
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

    </main>

  
    
    
    
   
    <!-- Specific Page Vendor -->
    
    <!-- Theme Base, Components and Settings -->
    <script src="../../resources/js/theme.js"></script>
      
      <!-- Theme Initialization Files -->
    <script src="../../resources/js/theme.init.js"></script>

    <!-- Examples -->
    <script src="../../resources/js/ui-elements/examples.modals.js"></script>

    <script type="text/javascript">
        //기본금액*박수 +(if(이용인원 > 기본인원){(이용인원 - 기본인원)*추가금액*박수})
        $( function() {
            
            let start = new Date($("#startdate").val());
            let end = new Date($("#enddate").val());
            let minprice = $("#minprice").val();
            let useNum = $("#useNum").val();
            let minCapacity = $("#minCapacity").val();
            let addPrice = $("#addPrice").val();
            let total = Math.ceil((end.getTime()-start.getTime())/(1000*3600*24));

            if(useNum <= minCapacity){
              var mintotalprice = minprice * total;
              $("#totalprice").text(comma(mintotalprice));
              $("input#paymentPrice").val(mintotalprice);
            }

            if(useNum > minCapacity){
              var mintotalprice = minprice * total;
              var addtotalprice = (useNum - minCapacity) * addPrice * total;
              var totalprice = mintotalprice + addtotalprice;
              $("#totalprice").text(comma(totalprice));
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

        function comma(str) {
                str = String(str);
                return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
            }

    </script>
  </body>
</html>
