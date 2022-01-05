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
    
      img { display : block;
            margin : auto;}

    </style>
    
  </head>
  <body>
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>

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


                    <div id="step_one" class="tab-pane active">

                      <div class="form-group">
												<label class="col-md-4 control-label" style="text-align: end;">예약 일자</label>
                        <div class="col-md-4">
													<div class="input-daterange input-group" >
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="date" class="form-control" id="start" name="reservationStartDate" >
														<span class="input-group-addon">to</span>
														<input type="date" class="form-control" id="end" name="reservationEndDate" >
													</div>
                          
												</div>
                    
                      </div>
                     
                      <div class="form-group" id="possible_mainsite" style="padding-top: 50px;">
                        <c:set var="i" value="0" />
                          <c:forEach var="mainSite" items="${mainSite}">
                            <c:set var="i" value="${ i+1 }" />
                            <c:set var="type" value="${mainSite.mainSiteType}" />
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
                           <hr>
                          </c:forEach>
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
        
      $( function() {
       
         $('#end').on('change',function(){
          start = $("#start").val();
          end = $("#end").val();
          temps = start.replace(/-/gi, "");
          tempe = end.replace(/-/gi, "");
          campno = $("#campno").val();
                    
            if(start === null && start === " "){
              alert("예약 시작일자를 선택해주세요.");
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
                      $.each(JSONData, function(i, mainSite) {
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-sm-3 mb-sm-20'>"
                        append_node += "<img class='mainsiteno' src='/uploadfiles/campimg/campbusiness/mainsite/"+mainSite.mainSiteImg1+"'" + "onerror=this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg' onclick='next("+mainSite.mainSiteNo+")' />"
                        append_node += "</div>"
                        append_node += "<div class='col-lg-9'>"
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-xs-12' style='font-size: large; font-weight: bold '>"+mainSite.mainSiteType+"&nbsp;("+mainSite.mainSiteName+")</div>"
                        append_node += "</div>"
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-xs-12'>"+mainSite.mainSiteInfo+"</div>"
                        append_node += "</div>"
                        append_node += "<hr>"
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-xs-12' style='font-size: medium;'> 기본 사용인원 : "+mainSite.mainSiteMinCapacity+"인 (최대 사용인원 : "+mainSite.mainSiteMaxCapacity+"인)</div>"
                        append_node += "</div>"
                        append_node += "<div class='row'>"
                        append_node += "<div class='col-xs-12'> 이용가격(1박) : "+mainSite.mainSiteMinPrice+"원 (인원 추가금 : "+mainSite.mainSiteAddPrice+"원)</div>"
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
