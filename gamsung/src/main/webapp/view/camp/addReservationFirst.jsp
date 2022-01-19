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
    <title>addReservationFirst</title>
    
    <jsp:include page="../../resources/commonLib.jsp" />

    <link href="../../resources/css/theme.css" rel="stylesheet" />
    <link href="../../resources/css/skins/default.css" rel="stylesheet" />

    <style>
    
      .img-responsive { display : block;
                         margin : auto;}

    </style>
    
  </head>
  <body>
    <main>
      <!-- <div class="page-loader">
        <div class="loader">Loading...</div>
      </div> -->

      <!-- header -->      
      <jsp:include page="/view/common/header.jsp"/>
      <!-- header End -->
     
      <div class="main">
        
        <div class="row">
          <div class="col-xs-2"> </div>
          <div class="col-xs-8">
            <section class="panel form-wizard" id="w4">
              
              <div class="panel-body" style="margin-top: 50px;">
                <div class="wizard-progress wizard-progress-lg" style="color: blue;">
                  <div class="steps-progress">
                    <div class="progress-indicator" style="width: 0%;"></div>
                  </div>
                  <ul class="wizard-steps">
                    <li class="active" id=stepone>
                      <a data-toggle="tab"><span>1</span>예약하기 Step1</a>
                    </li>
                    <li id=steptwo>
                      <a data-toggle="tab"><span>2</span>예약하기 Step2</a>
                    </li>
                    <li id="stepthree">
                      <a data-toggle="tab"><span>3</span>예약하기 Step3</a>
                    </li>
                  </ul>
                </div>
        
                <form id ="nextstep" class="form-horizontal" novalidate="novalidate">
                  <div class="tab-content">


                    <div id="step_one">

                      <div class="form-group">
												<label class="col-md-4 control-label" style="text-align: end;">예약 일자</label>
                        <div class="col-md-4">
													<div class="input-daterange input-group" >
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="date" class="form-control" min="new Date().toISOString().substring(0, 10)"id="start" name="reservationStartDate" >
														<span class="input-group-addon">to</span>
														<input type="date" class="form-control" id="end" name="reservationEndDate" >
													</div>
                          
												</div>
                    
                      </div>
                     
                      <div class="row" id="info" style="text-align: center;">
                          <span>예약일을 선택 하면 예약 가능한 주요시설이 나옵니다.</span>
                      </div>

                      <div class="form-group" id="possible_mainsite" style="padding-top: 50px;">
                        <div class="row" style="text-align: center;">
                          <div class="col-sm-12 mb-sm-20" style="height: 700px;">
                            <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/camp/reservation.jpg">
                           </div>
                        </div>
                        
                      </div>
                    </div>

                  </div>
            
                  <input type="hidden" id="campno" name="camp.campNo" value="${campReservation.camp.campNo}">
                  
                </form>
              </div>
              
            </section>
          </div>
        </div>
      </div>
   
    </main>

    <script type="text/javascript">

      function main_site_comma(str){
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
      }
        
      $( function() {
       
         $('#end').on('change',function(){
          start = $("#start").val();
          end = $("#end").val();
          temps = start.replace(/-/gi, "");
          tempe = end.replace(/-/gi, "");
          campno = $("#campno").val();
                    
            if(start <= new Date().toISOString().substring(0, 10)){
              alert("현재일자 다음날부터 예약 가능합니다.");
            }else if(tempe - temps <= 0){
              alert("예약 시작일자와 종료일자를 확인해 주세요.");
            }else{
              $('#info').empty();
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
                      let append_node ="";
                      let minprice ="";
                      let addprice ="";

                      $.each(JSONData, function(i, mainSite) {
                        minprice = mainSite.mainSiteMinPrice;
                        addprice = mainSite.mainSiteAddPrice;

                        append_node += "<div class='row'>"
                        append_node += "<div class='col-sm-3 mb-sm-20'>"
                        append_node += "<img class='mainsiteno' style='cursor: pointer;' src='/uploadfiles/campimg/campbusiness/mainsite/"+mainSite.mainSiteImg1+"'" + "onerror=this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg' onclick='next("+mainSite.mainSiteNo+")' />"
                        append_node += "</div>"
                        append_node += "<div class='col-lg-9'>"
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-xs-12' style='font-size: large; font-weight: bold '>"+mainSite.mainSiteType+"&nbsp;("+mainSite.mainSiteName+")</div>"
                        append_node += "</div>"
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-xs-12' style='margin-top: 15px;'>"+mainSite.mainSiteInfo+"</div>"
                        append_node += "</div>"
                        append_node += "<hr>"
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-xs-12' style='font-size: medium;'> 기본 사용인원 : "+mainSite.mainSiteMinCapacity+"인 (최대 사용인원 : "+mainSite.mainSiteMaxCapacity+"인)</div>"
                        append_node += "</div>"
                        append_node += "<div class='row'>"    
                        append_node += "<div class='col-xs-12' style='font-size: medium; margin-top: 15px;'> 이용가격(1박) : "+main_site_comma(minprice)+"원 (인원 추가금 : "+main_site_comma(addprice)+"원)</div>"
                        append_node += "</div>"
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-xs-12' style='font-size: medium; margin-top: 15px;' > 주차가능대수 : "+mainSite.mainSiteParkingSize+ "대</div>"
                        append_node += "</div>"  
                        append_node += "</div>"
                        append_node += "</div>"
                        append_node += "<hr>"
                        });
                        $('#possible_mainsite').append(append_node);
                      }

                  });
                }
              
        });
    
      });

        function next(no) {
          var mainSiteNo = no;

          $("#nextstep").attr("method","POST").attr("action","/campGeneral/addReservation?mainSiteNo="+mainSiteNo).submit()
        }

    
    </script>
  </body>
</html>
