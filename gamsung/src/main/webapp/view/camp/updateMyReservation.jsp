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

    <jsp:include page="../../resources/commonLib.jsp" />
    
    <script type="text/javascript">
      
    </script>
  </head>

<body id="getReservation" data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
 
  <main>

    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="inner-wrapper">
      
        <jsp:include page="../common/userSideBar.jsp"></jsp:include>

        <section class="body">
          
          <div class="row getReservation" >
             
            <div class="col-xs-12">
                
                  <div class="row" style="padding-top: 30px;">
                      <div calss="col-sm-12" style="text-align: center; font-size: x-large; margin-bottom: 10px;">
                        <span class="icon-happy"></span>&nbsp;예약 변경&nbsp;<span class="icon-happy"></span>
                      </div>
                  </div>
                 
                  <hr class="divider-w mt-10 mb-20">
                 
                      <div class="container panel-body" style="margin-bottom: 20px;">
                        <form id ="update_reservation" class="form-horizontal" novalidate="novalidate">
                          
                              <div class="form-group" style="padding-top: 20px;">
                                <label class="col-md-4 control-label" style="text-align: end;">예약 변경 일자</label>
                                <div class="col-md-4">
                                  <div class="input-daterange input-group" >
                                    <span class="input-group-addon">
                                      <i class="fa fa-calendar"></i>
                                    </span>
                                    <input type="date" class="form-control" min="new Date().toISOString().substring(0, 10)" id="startdate" name="reservationStartDate" >
                                    <span class="input-group-addon">to</span>
                                    <input type="date" class="form-control" id="enddate" name="reservationEndDate" >
                                  </div>
                                  
                                </div>
                              </div>

                              <div class="form-group" id="possible_mainsite" style="padding-top: 20px;">
                                <div style="text-align: center; color: rgb(0, 38, 255); padding-bottom: 20px;">예약 가능한 주요시설이 없습니다. 예약일을 설정 해 주세요.</div>
                              </div>
                                  
                              <div class="form-group">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                  <div class="col-xs-4" ><strong>예약 인원 :</strong></div>
                                  <div class="col-xs-8">
                                    <div>
                                      <input class="col-xs-4" type="number" name="useNum" id="useNum" onchange="totalupdateprice()" value="${campReservation.useNum}" min="1">
                                      <span style="font-weight: bold;">&nbsp;명</span>
                                    </div>
                                  </div>
                               </div>
                               
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                    <div class="col-xs-4"><strong>주차 대수 :</strong></div>
                                    <div class="col-xs-8">
                                      <input class="col-xs-4" type="number" name="totalReservationRegCar" id="regCar"value="${campReservation.totalReservationRegCar}" min="0">
                                      <span style="font-weight: bold; font-size: larger;">&nbsp;대</span>
                                    </div>
                                </div>
                                <div class="col-xs-2"></div>
                              </div>
                             
                              <div class="form-group">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                  <div class="col-xs-4" ><strong>예약자 이름 :</strong></div>
                                  <div class="col-xs-8">
                                    <div>
                                      <input class="col-xs-8" type="text" name="reservationUserName" value="${campReservation.reservationUserName}">
                                      <span style="font-weight: bold;">&nbsp;</span>
                                    </div>
                                  </div>
                               </div>
                               
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                    <div class="col-xs-4"><strong>휴대폰 번호 :</strong></div>
                                    <div class="col-xs-8">
                                      <input class="col-xs-8" type="text" name="reservationUserPhone"  value="${campReservation.reservationUserPhone}" placeholder="'-' 없이 입력해주세요.">
                                    </div>
                                </div>
                                <div class="col-xs-2"></div>
                              </div>

                              <div class="form-group">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                  <div class="col-xs-4" ><strong>차량 번호 :</strong></div>
                                  <div class="col-xs-8">
                                    <div>
                                      <input class="col-xs-8" type="text" name="reservationRegCarNum" value="${campReservation.reservationRegCarNum}">
                                    </div>
                                  </div>
                               </div>
                               
                                <div class="col-xs-4">
                                    <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;"><strong>요청 사항 :</strong></div>
                                    <div class="col-xs-8">
                                      <textarea class="form-control" name="reservationRequest" value="${campReservation.reservationRequest}" rows="2" id="request"></textarea>
                                      <div id="request_cnt">(0 / 1000)</div>
                                    </div>
                                </div>
                                <div class="col-xs-2"></div>
                              </div>

                              <div class="form-group" style="text-align: center;">
                                <div class="col-xs-4"></div>
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                  <div class="col-xs-5" ><strong>예약 변경 캠핑장 :</strong></div>
                                  <div class="col-xs-7">
                                    <div>
                                      <span style="font-weight: bold; font-size: large;">
                                        ${campReservation.camp.user.campName} 
                                      </span>
                                    </div>
                                  </div>
                              </div>
                              </div>

                              <div class="form-group" style="text-align: center;">
                                <div class="col-xs-4"></div>
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                  <div class="col-xs-5" ><strong>기존 결제 금액 :</strong></div>
                                  <div class="col-xs-7">
                                    <div>
                                      <span style="font-weight: bold; font-size: larger;" id="comma_price" value="${campReservation.totalPaymentPrice}">
                                        
                                      </span>
                                    </div>
                                  </div>
                               </div>
                              </div>

                              <div class="form-group" style="text-align: center;">
                                <div class="col-xs-4"></div>
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                  <div class="col-xs-5" ><strong>변경 결제 금액 :</strong></div>
                                  <div class="col-xs-7" style="text-align: start; color: rgb(0, 38, 255);">
                                    <span style="font-weight: bold; font-size: larger;" id="updatetotalprice"></span>
                                    <span style="font-size: larger;" id="updatewon"></span>
                                    <span style="font-weight: bold;" id="updateleft"></span>
                                    <span style="font-weight: bold;" class="totaldate"></span>
                                    <span style="font-weight: bold;" id="updateright"></span>
                                  </div>
                               </div>
                              </div>

                              <div class="form-group" style="text-align: center;">
                                <div class="col-xs-4"></div>
                                <div class="col-xs-4 panel-body" style="height: 40px; text-align: start; padding: 10px;">
                                  <div class="col-xs-5"><strong>추가 결제 금액 :</strong></div>
                                    <div class="col-xs-7" style="text-align: start; color: rgb(255, 7, 7);">
                                      <span style="font-weight: bold; font-size: large;" id="appendtotalprice"></span>
                                      <span style="font-size: larger;" id="appendwon"></span>
                                      <span style="font-weight: bold;" id="appendleft"></span>
                                      <span style="font-weight: bold;" class="totaldate"></span>
                                      <span style="font-weight: bold;" id="appendright"></span>
                                    </div>
                                </div>
                              </div>

                              <div class="form-group">
                                <div class="col-xs-2"></div>
                                <div class="row">
                                  <div class="col-sm-12"  style="text-align: center; color: rgb(255, 0, 0);">
                                    <span id="refundinfo">
                                    </span>
                                  </div>
                                </div>
                                <div class="col-xs-2"></div>
                              </div>

                              <div class="form-group">
                                <div class="col-xs-2"></div>
                                <div class="row">
                                  <div class="col-sm-12"  style="text-align: center;" id="appendbtn">
                                    
                                  </div>
                                </div>
                                <div class="col-xs-2"></div>
                              </div>

                              <input type="hidden" id="addpaymentPrice"  name="totalPaymentPrice" value="">
                              <input type="hidden" id="prepaymentPrice"  value="${campReservation.totalPaymentPrice}">
                              <input type="hidden" id="update_rev_mainste_no" name="mainSite.mainSiteNo" value="" />
                              <input type="hidden" id="campno" name="camp.campNo" value="${campReservation.camp.campNo}" />
                              <input type="hidden" id="camp_reservationNo" name="reservationNo" value="${campReservation.reservationNo}" />
                                 
                            </form>  
                          
                          </div>

              </div>

          </div>
          
        </section>
    </div>
     
  </main>  

    <script type="text/javascript">

          function main_site_comma(str){
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
          }

          window.onload = function() {

          let str = $("#comma_price").attr("value");
          let commaStr = comma(str);

              $("#comma_price").html(commaStr+" 원");
          };

          function comma(str) {
              str = String(str);
              return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
          }


        $( function() {

          $('#request').on('keyup', function() {
                $('#request_cnt').html("("+$(this).val().length+" / 1000)");
        
                if($(this).val().length > 1000) {
                    $(this).val($(this).val().substring(0, 1000));
                    $('#request_cnt').html("(1000 / 1000)");
                }
            });

          $('#enddate').on('change',function(){
                 let start = $("#startdate").val();
                 let end = $("#enddate").val();
                 let temps = start.replace(/-/gi, "");
                 let tempe = end.replace(/-/gi, "");
                 let campno = $("#campno").val();
                            
                    if(start <= new Date().toISOString().substring(0, 10)){
                      alert("현재일자 다음날부터 예약 가능합니다.");
                    }else if(tempe - temps <= 0){
                      alert("예약 시작일자와 종료일자를 확인해 주세요.");
                    }else{
                     
                      $('#possible_mainsite').empty();

                      $.ajax( 
                          {
                            url : "/campGeneral/json/possibleMainsite/"+start+"/"+end+"/"+campno,
                            method : "GET" ,
                            dataType : "json" ,
                            headers : {
                              "Accept" : "application/json",
                              "Content-Type" : "application/json"
                            },
                            success : function(JSONData , status) {
                              var append_node ="";   
                              let comma_minprice ="";
                              let comma_addprice ="";
                              if(JSONData == null){
                                 append_node += "<div style='text-align: center; color: rgb(0, 38, 255); padding-bottom: 20px;'>예약 가능한 주요시설이 없습니다. 예약일을 다시 설정 해 주세요.</div>"
                              }else{
                                      append_node += "<div class='row col-xs-2'>" 
                                      append_node += "</div>" 
                                      append_node += "<div class='row col-xs-8'>"   
                                      $.each(JSONData, function(i, mainSite) {
                                        comma_minprice = mainSite.mainSiteMinPrice;
                                        comma_addprice = mainSite.mainSiteAddPrice;

                                        append_node += "<div class='row'>"
                                        append_node += "<div class='col-sm-3 mb-sm-20'>"
                                        append_node += "<img class='mainsiteno' style='cursor: pointer;' src='/uploadfiles/campimg/campbusiness/mainsite/"+mainSite.mainSiteImg1+"'" + "onerror=this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg' onclick='nextupdate("+mainSite.mainSiteNo+','+mainSite.campNo+")' />"
                                        append_node += "</div>"
                                        append_node += "<div class='col-lg-9'>"
                                        append_node += "<div class='row'>"
                                        append_node += "<div class='col-xs-12' style='font-size: large; font-weight: bold '>"+mainSite.mainSiteType+"&nbsp;("+mainSite.mainSiteName+")</div>"
                                        append_node += "</div>"
                                        append_node += "<div class='row'>"
                                        append_node += "<div class='col-xs-12' style='margin-top: 15px;'>"+mainSite.mainSiteInfo+"</div>"
                                        append_node += "</div>"
                                        append_node += "<div class='row'>"
                                        append_node += "<div class='col-xs-12'> 기본 사용인원 : "+mainSite.mainSiteMinCapacity+"인 (최대 사용인원 : "+mainSite.mainSiteMaxCapacity+"인)</div>"
                                        append_node += "</div>"
                                        append_node += "<div class='row'>"    
                                        append_node += "<div class='col-xs-12'> 이용가격(1박) : "+main_site_comma(comma_minprice)+"원 (인원 추가금 : "+main_site_comma(comma_addprice)+"원)</div>"
                                        append_node += "</div>"
                                        append_node += "<div class='row'>"
                                        append_node += "<div class='col-xs-12'> 주차가능대수 : "+mainSite.mainSiteParkingSize+ "대</div>"
                                        append_node += "</div>"  
                                        append_node += "</div>"
                                        append_node += "</div>"
                                        append_node += "<hr>"
                                        });
                                        append_node += "</div>"
                                      }
                                 $('#possible_mainsite').append(append_node);
                            }

                          });
                        }
                      
                });
          });

      function reservationupdate(){
        $("#update_reservation").attr("method", "POST").attr("action", "/campGeneral/updateMyReservation").submit();
      }

      function getToday(){
            var date = new Date();
            var year = date.getFullYear();
            var month = ("0" + (1 + date.getMonth())).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);

            return year + "-" + month + "-" + day;
        }

      function nextupdate(mainsite_no, camp_no) {

          var mainSiteNo = mainsite_no;
          var campno = camp_no;

          $('#possible_mainsite').empty();
          $("#appendbtn").empty();
        
          $.ajax( 
                  {
                    url : "/campGeneral/json/selectMainSite/"+mainSiteNo+"/"+campno,
                    method : "GET" ,
                    dataType : "json" ,
                    headers : {
                      "Accept" : "application/json",
                      "Content-Type" : "application/json"
                    },
                    success : function(JSONData , status) {
                      var append_node ="";
                      let comma_minprice = JSONData.mainSiteMinPrice;
                      let comma_addprice = JSONData.mainSiteAddPrice;   

                      append_node += "<div class='row col-xs-2'>" 
                      append_node += "</div>" 
                      append_node += "<div class='row col-xs-8'>"   
                      append_node += "<div class='row'>"
                      append_node += "<div class='col-sm-3 mb-sm-20'>"
                      append_node += "<img class='mainsiteno' src='/uploadfiles/campimg/campbusiness/mainsite/"+JSONData.mainSiteImg1+"'" + "onerror=this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg' onclick='next("+JSONData.mainSiteNo+")' />"
                      append_node += "</div>"
                      append_node += "<div class='col-lg-9'>"
                      append_node += "<div class='row'>"
                      append_node += "<div class='col-xs-12' style='font-size: large; font-weight: bold '>"+JSONData.mainSiteType+"&nbsp;("+JSONData.mainSiteName+")</div>"
                      append_node += "</div>"
                      append_node += "<div class='row'>"
                      append_node += "<div class='col-xs-12' style='margin-top: 15px;'>"+JSONData.mainSiteInfo+"</div>"
                      append_node += "</div>"
                      append_node += "<div class='row'>"
                      append_node += "<div class='col-xs-12'> 기본 사용인원 : "+JSONData.mainSiteMinCapacity+"인 (최대 사용인원 : "+JSONData.mainSiteMaxCapacity+"인)</div>"
                      append_node += "</div>"
                      append_node += "<div class='row'>"    
                      append_node += "<div class='col-xs-12'> 이용가격(1박) : "+main_site_comma(comma_minprice)+"원 (인원 추가금 : "+main_site_comma(comma_addprice)+"원)</div>"
                      append_node += "</div>"
                      append_node += "<div class='row'>"
                      append_node += "<div class='col-xs-12'> 주차가능대수 : "+JSONData.mainSiteParkingSize+ "대</div>"
                      append_node += "</div>"  
                      append_node += "</div>"
                      append_node += "</div>"
                      append_node += "<hr>"
                      append_node += "</div>"
                      append_node += "<input type='hidden' class='resdata' data-parkingsize='"+JSONData.mainSiteParkingSize+"' data-maxcapacity='"+JSONData.mainSiteMaxCapacity+"' data-mincapacity='"+JSONData.mainSiteMinCapacity+"' data-minprice='"+JSONData.mainSiteMinPrice+"' data-addprice='"+JSONData.mainSiteAddPrice+"'/>"
                        $('#possible_mainsite').append(append_node);
                        
                        maxusecar(JSONData.mainSiteMaxCapacity, JSONData.mainSiteParkingSize)
                        $("#update_rev_mainste_no").val(JSONData.mainSiteNo);
                        
                        let start = new Date($("#startdate").val());
                        let end = new Date($("#enddate").val());
                        let minprice = JSONData.mainSiteMinPrice;
                        let useNum = $("#useNum").val();
                        let minCapacity = JSONData.mainSiteMinCapacity;
                        let addPrice = JSONData.mainSiteAddPrice;
                        let total = Math.ceil((end.getTime()-start.getTime())/(1000*3600*24));
                        let prepaymentPrice = $("#prepaymentPrice").val();

                        if(useNum <= minCapacity){
                          var mintotalprice = minprice * total;
                          //추가금액
                          var addpaymentPrice = mintotalprice - prepaymentPrice
                          
                            $("#updatetotalprice").text(comma(mintotalprice));
                            $("#updatewon").text('원');
                            $("#updateleft").text('  (');
                            $("#updateright").text('박)');
                                                      
                            $("#appendtotalprice").text(comma(addpaymentPrice));
                            $("#appendwon").text('원');
                            $("#appendleft").text('  (');
                            $("#appendright").text('박)');

                            $("input#addpaymentPrice").val(addpaymentPrice);

                            if(addpaymentPrice < 0){
                                $("#refundinfo").text("부분 환불은 불가능 합니다. 예약 취소 후 다시 예약 해주세요.")
                            }else if(addpaymentPrice == 0){
                               $("#refundinfo").text("예약 변경 추가 결제 금액이 없습니다. 확인을 누르면 예약 변경 됩니다.")
                            }else if(addpaymentPrice > 0){
                               $("#refundinfo").text("예약 변경 추가 결제 금액이 있습니다.")
                            }else{
                              $("#refundinfo").empty();
                            }
                                            
                        }

                        if(useNum > minCapacity){
                          var mintotalprice = minprice * total;
                          var addtotalprice = (useNum - minCapacity) * addPrice * total;
                          var totalprice = mintotalprice + addtotalprice;
                          //추가금액
                          var addpaymentPrice = totalprice - prepaymentPrice
                          
                            $("#updatetotalprice").text(comma(totalprice));
                            $("#updatewon").text('원');
                            $("#updateleft").text('  (');
                            $("#updateright").text('박)');
                          
                            $("#appendtotalprice").text(comma(addpaymentPrice));
                            $("#appendwon").text('원');
                            $("#appendleft").text('  (');
                            $("#appendright").text('박)');

                            $("input#addpaymentPrice").val(addpaymentPrice);

                            if(addpaymentPrice < 0){
                                $("#refundinfo").text("부분 환불은 불가능 합니다. 예약 취소 후 다시 예약 해주세요.")
                            }else if(addpaymentPrice == 0){
                               $("#refundinfo").text("예약 변경 추가 결제 금액이 없습니다. 확인을 누르면 예약 변경 됩니다.")
                            }else if(addpaymentPrice > 0){
                               $("#refundinfo").text("예약 변경 추가 결제 금액이 있습니다.")
                            }else{
                              $("#refundinfo").empty();
                            }
                          
                        }
                        $(".totaldate").text(total);

                        if(addpaymentPrice < 0){
                          var append_btn = "<button type='button' class='btn btn-danger' onclick='reservationcancle()'>예약취소</button>";
                            }else if(addpaymentPrice == 0){
                              var append_btn = "<button type='button' class='btn btn-primary' onclick='reservationupdate()'>확인</button>";
                            }else if(addpaymentPrice > 0){
                              var append_btn = "<button type='button' class='btn btn-success' onclick='reservationupdate()'>결제하기</button>";
                            }

                        $("#appendbtn").append(append_btn);
                        }
                      
                  });

        }

        //기본금액*박수 +(if(이용인원 > 기본인원){(이용인원 - 기본인원)*추가금액*박수})
        function totalupdateprice() { 

                  let start = new Date($("#startdate").val());
                  let end = new Date($("#enddate").val());
                  let minprice = $(".resdata").data("minprice");
                  let useNum = $("#useNum").val();
                  let minCapacity = $(".resdata").data("mincapacity");
                  let addPrice = $(".resdata").data("addprice");
                  let total = Math.ceil((end.getTime()-start.getTime())/(1000*3600*24));
                  let prepaymentPrice = $("#prepaymentPrice").val();

                  $("#appendbtn").empty();

                  if(useNum <= minCapacity){
                    var mintotalprice = minprice * total;
                    //추가금액
                    var addpaymentPrice = mintotalprice - prepaymentPrice
                    
                      $("#updatetotalprice").text(comma(mintotalprice));
                      $("#updatewon").text('원');
                      $("#updateleft").text('  (');
                      $("#updateright").text('박)');
                    
                      $("#appendtotalprice").text(comma(addpaymentPrice));
                      $("#appendwon").text('원');
                      $("#appendleft").text('  (');
                      $("#appendright").text('박)');

                      $("input#addpaymentPrice").val(addpaymentPrice);
                     
                      if(addpaymentPrice < 0){
                          $("#refundinfo").text("부분 환불은 불가능 합니다. 예약 취소 후 다시 예약 해주세요.")
                      }else if(addpaymentPrice == 0){
                          $("#refundinfo").text("예약 변경 추가 결제 금액이 없습니다. 확인을 누르면 예약 변경 됩니다.")
                      }else if(addpaymentPrice > 0){
                          $("#refundinfo").text("예약 변경 추가 결제 금액이 있습니다.")
                      }else{
                        $("#refundinfo").empty();
                      }

                  }

                  if(useNum > minCapacity){
                    var mintotalprice = minprice * total;
                    var addtotalprice = (useNum - minCapacity) * addPrice * total;
                    var totalprice = mintotalprice + addtotalprice;
                    //추가금액
                    var addpaymentPrice = totalprice - prepaymentPrice
                    
                      $("#updatetotalprice").text(comma(totalprice));
                      $("#updatewon").text('원');
                      $("#updateleft").text('  (');
                      $("#updateright").text('박)');
              
                      $("#appendtotalprice").text(comma(addpaymentPrice));
                      $("#appendwon").text('원');
                      $("#appendleft").text('  (');
                      $("#appendright").text('박)');
                      $("input#addpaymentPrice").val(addpaymentPrice);
                    
                      if(addpaymentPrice < 0){
                          $("#refundinfo").text("부분 환불은 불가능 합니다. 예약 취소 후 다시 예약 해주세요.")
                      }else if(addpaymentPrice == 0){
                          $("#refundinfo").text("예약 변경 추가 결제 금액이 없습니다. 확인을 누르면 예약 변경 됩니다.")
                      }else if(addpaymentPrice > 0){
                          $("#refundinfo").text("예약 변경 추가 결제 금액이 있습니다.")
                      }else{
                        $("#refundinfo").empty();
                      }

                  }
                  $(".totaldate").text(total);
                  
                  if(addpaymentPrice < 0){
                          var append_btn = "<button type='button' class='btn btn-danger' onclick='reservationcancle()'>예약취소</button>";
                    }else if(addpaymentPrice == 0){
                          var append_btn = "<button type='button' class='btn btn-primary' onclick='reservationupdate()'>확인</button>";
                    }else if(addpaymentPrice > 0){
                          var append_btn = "<button type='button' class='btn btn-success' onclick='reservationupdate()'>결제하기</button>";
                    }

                  $("#appendbtn").append(append_btn);
          }
           
          function maxusecar(maxuse, maxcar){
            
            let max_use = maxuse;
            let max_car = maxcar;

            $("#useNum").on("propertychange change keyup paste input", function() {				
                 let useNum = $("#useNum").val();

                 console.log("최대인원"+max_use);
                 console.log("현재인원"+useNum);
                
                 if(useNum > max_use){
                    $("#useNum").val(max_use);
                    return;
                 }
            });

            $("#regCar").on("propertychange change keyup paste input", function() {	
                let carNum = $("#regCar").val();
               
                if(carNum > max_car){
                  $("#regCar").val(max_car);
                  
                }
             });

             
            }
            
            //예약취소  
            function reservationcancle(){

                  let start = $("#startdate").val();
                  let reservationNo = $("camp_reservationNo").attr("value");
                  let today = getToday();   

                  let startDate = new Date('today');
                  let endDate = new Date('start');
                  let differenceDate = Math.ceil((endDate.getTime()-startDate.getTime())/(1000*3600*24));

                  console.log(differenceDate);

                  let refundCode ="";

                  if(differenceDate === 2){
                      refundCode = 'R3'
                  }else if(differenceDate === 3){
                      refundCode = 'R4'
                  }else if(differenceDate === 4){
                      refundCode = 'R5'
                  }else if(differenceDate === 5){
                      refundCode = 'R6'
                  }else if(differenceDate === 6){
                      refundCode = 'R7'
                  }else{
                      refundCode = 'R8'
                  }

                  console.log(refundCode);
                  self.location ="/payment/readyRefund?reservationNo="+reservationNo+"&paymentRefundCode="+refundCode;

              }
    </script>

</body>

</html>
