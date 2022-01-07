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
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
    rel="stylesheet" type="text/css">
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
  <link href="../../resources/css/theme-custom.css" rel="stylesheet">
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
  <!-- Kakao Map-->
  <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f8199ad71211c3df709f290a0e83244&libraries=services"></script>
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
              
              <div class="panel-body" style="margin-top: 100px;">
                <div class="wizard-progress wizard-progress-lg">
                  <div class="steps-progress">
                    <div class="progress-indicator" style="width: 0%;"></div>
                  </div>
                  <ul class="wizard-steps">
                    <li class="active" id=stepone>
                      <a href="#step_one" data-toggle="tab"><span>1</span>예약하기 Step1</a>
                    </li>
                    <li id=steptwo>
                      <a href="#" data-toggle="tab"><span>2</span>예약하기 Step2</a>
                    </li>
                    <li id="stepthree">
                      <a href="#" data-toggle="tab"><span>3</span>예약하기 Step3</a>
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

    <script src="../../resources/lib/bootstrap/js/bootstrap.js"></script>
        <script src="../../resources/lib/nanoscroller/nanoscroller.css"></script>
        <script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
        <script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
        <!-- Specific Page Vendor -->
        <script src="../../resources/lib/pnotify/pnotify.custom.js"></script>
        <!-- Theme Base, Components and Settings -->
        <script src="../../resources/js/theme.js"></script>
        <!-- Theme Custom -->
        <script src="../../resources/js/theme.custom.js"></script>
        <!-- Theme Initialization Files -->
        <script src="../../resources/js/theme.init.js"></script>
        <!-- Examples -->
        <script src="../../resources/js/examples.lightbox.js"></script>

    <script type="text/javascript">
        
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
                      var append_node ="";      
                      $.each(JSONData, function(i, mainSite) {
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
                        append_node += "<div class='col-xs-12' style='font-size: medium; margin-top: 15px;'> 이용가격(1박) : "+mainSite.mainSiteMinPrice+"원 (인원 추가금 : "+mainSite.mainSiteAddPrice+"원)</div>"
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
