<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Document Title -->
    <title>GetCamp</title>
    
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
    <!-- Kakao Map-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f8199ad71211c3df709f290a0e83244&libraries=services"></script>
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

    <style>

      img { display : block;
            margin : auto;}

    </style>

    <script type="text/javascript">
          
      $( function() {

      });

    </script>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>

      <!-- header -->      
      <jsp:include page="/view/common/header.jsp"/>
      <!-- header End -->
     
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 mb-sm-40">
                <a class="image-popup-vertical-fit" href="/uploadfiles/campimg/campbusiness/camp/${camp.campImg1}" >
                  <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/camp/${camp.campImg1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" >
                </a>
              </div>
              <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12">
                    <h1 class="product-title font-alt" style="margin-bottom: 0px;">${camp.user.campName}&nbsp;캠핑장</h1>
                  </div>
                </div>
                <hr>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <span><i class="fa fa-star star"></i></span>
                    <span><i class="fa fa-star star"></i></span>
                    <span><i class="fa fa-star star"></i></span>
                    <span><i class="fa fa-star star"></i></span>
                    <span><i class="fa fa-star star-off"></i></span>
                    <a class="open-tab section-scroll">&nbsp;평점&nbsp;${camp.campRate}</a>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="price"><span style="font-size: medium;">${camp.user.addr}</span></div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-12">
                    <div><span style="font-size: small;">전화번호&nbsp;:&nbsp;${camp.user.campCall}</span></div>
                  </div>
                </div>
                <hr>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="description">
                      <p style="margin-bottom: 0px;">
                        주요시설&nbsp;:&nbsp;
                      <c:set var="i" value="0" />
                      <c:forEach var="mainSiteType" items="${mainSiteType}">
                         <c:set var="i" value="${ i+1 }" />
                          ${mainSiteType}&nbsp;
                      </c:forEach>
                      </p>
                    </div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="description">
                      <p style="margin-bottom: 0px;">운영형태&nbsp;:&nbsp;${camp.campOperation1},&nbsp;${camp.campOperation2}</p>
                    </div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="description">
                      <p style="margin-bottom: 0px;">주변환경&nbsp;:&nbsp;${camp.campNature1},&nbsp;${camp.campNature2}</p>
                    </div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="description">
                      <p style="margin-bottom: 0px;">테마&nbsp;:&nbsp;${camp.campTheme1},&nbsp;${camp.campTheme2}</p>
                    </div>
                  </div>
                </div>
                <hr>
                <div class="row mb-20">
                 <div class="col-sm-12"><a class="btn btn-lg btn-block btn-round btn-b" href="#">예약하기</a></div>
                </div>
              </div>
            </div>
            <hr>
              <div class="row mb-20">
                <div class="col-sm-12" style="text-align: center;">
                  이번달&nbsp;총&nbsp;조회수&nbsp;:&nbsp;<span style="color: rgb(230, 173, 17);">${camp.campViewCountCurrentMonth}건</span>&nbsp;&nbsp;&nbsp;
                  이번달&nbsp;총&nbsp;예약자수&nbsp;:&nbsp;<span style="color: rgb(230, 173, 17);">${camp.campReservationCount}명</span>&nbsp;입니다.
                </div>
              </div>
            <hr>
            <div class="row mt-70">
              <div class="col-sm-12">
                <ul class="nav nav-tabs font-alt" role="tablist" id="myTab">
                  <li class="active" ><a href="#introduce" data-toggle="tab"><span class="icon-magnifying-glass"></span>캠핑장소개</a></li>
                  <li><a href="#useinfo" data-toggle="tab"><span class="icon-magnifying-glass"></span>이용안내</a></li>
                  <li><a href="#mapview" data-toggle="tab"><span class="icon-magnifying-glass"></span>위치/주변정보</a></li>
                  <li><a href="#notice" data-toggle="tab"><span class="icon-magnifying-glass"></span>공지사항</a></li>
                  <li><a href="#qna" data-toggle="tab"><span class="icon-magnifying-glass"></span>Q&A</a></li>
                  <li><a href="#reviews" data-toggle="tab"><span class="icon-magnifying-glass"></span>평점&리뷰</a></li>
                </ul>


                <div class="tab-content">


                  <div class="tab-pane active" id="introduce">
                    <div calss="row">
                      <div class="col-sm-3 mb-sm-20">
                        <a class="image-popup-vertical-fit" href="/uploadfiles/campimg/campbusiness/camp/${camp.campImg2}" >
                          <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/camp/${camp.campImg2}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" style="height: 185px;">
                        </a>
                      </div>
                      <div class="col-sm-3 mb-sm-20">
                        <a class="image-popup-vertical-fit" href="/uploadfiles/campimg/campbusiness/camp/${camp.campImg3}" >
                          <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/camp/${camp.campImg3}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" style="height: 185px;">
                        </a>
                      </div>
                      <div class="col-sm-3 mb-sm-20">
                        <a class="image-popup-vertical-fit" href="/uploadfiles/campimg/campbusiness/camp/${camp.campImg4}" >
                          <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/camp/${camp.campImg4}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" style="height: 185px;">
                        </a>
                      </div>
                      <div class="col-sm-3 mb-sm-20">
                        <a class="image-popup-vertical-fit" href="/uploadfiles/campimg/campbusiness/camp/${camp.campImg5}" >
                          <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/camp/${camp.campImg5}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" style="height: 185px;">
                        </a>
                      </div>
                    </div>
                    <div calss="row">
                      <div calss="col-sm-12">
                        &nbsp;
                      </div>
                    </div>
                    <div calss="row">
                      <div calss="col-sm-12" style="text-align: center; font-size: large;">
                        <span class="icon-happy"></span>&nbsp;캠핑장 요약 정보&nbsp;<span class="icon-happy"></span>
                      </div>
                      <hr>
                      <div calss="col-sm-12" style="text-align: center; ">
                        ${camp.campSummery}
                      </div>
                    </div>
                    <hr>
                    <div calss="row">
                      <div calss="col-sm-12" style="text-align: center; font-size: large;">
                        <span class="icon-happy"></span>&nbsp;캠핑장 상세 정보&nbsp;<span class="icon-happy"></span>
                      </div>
                      <hr>
                      <div calss="col-sm-12" style="text-align: center; ">
                        ${camp.campDetail}
                      </div>
                    </div>
                  </div>


                  <div class="tab-pane" id="useinfo">
                    <div calss="row">
                      <div calss="col-sm-12" style="text-align: center; font-size: large;">
                        <span class="icon-happy"></span>&nbsp;캠핑장 지도&nbsp;<span class="icon-happy"></span>
                      </div>
                      <hr>
                      <div calss="row" >
                      <div class="col-sm-push-12">
                        <a class="image-popup-vertical-fit" href="/uploadfiles/campimg/campbusiness/camp/${camp.campMapImg}" >
                          <img class="img-responsive" style="width: 800px; height: 400px; " src="/uploadfiles/campimg/campbusiness/camp/${camp.campMapImg}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" >
                        </a>
                      </div>
                    </div>
                    </div>
                    <div calss="row">
                      <hr>
                    </div>
                    <div calss="row">
                      <div calss="col-sm-12" style="text-align: center; font-size: large;">
                        <span class="icon-happy"></span>&nbsp;주요시설안내&nbsp;<span class="icon-happy"></span>
                      </div>
                      <hr>
                      <div calss="col-sm-12"">
                        <c:set var="i" value="0" />
                          <c:forEach var="mainSite" items="${mainSite}">
                            <c:set var="i" value="${ i+1 }" />
                            <c:set var="type" value="${mainSite.mainSiteType}" />
                             <div class="row">
                              <div class="col-sm-3 mb-sm-20">
                                <a class="image-popup-vertical-fit" href="/uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg1}" >
                                  <img class="img-responsive" src="/uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'" >
                                </a>
                              </div>
                              <div class="col-lg-9">
                                 <div class="row">
                                    <div class="col-xs-12" style="font-size: large; font-weight: bold ">${mainSite.mainSiteType}&nbsp;(${mainSite.mainSiteName})</div>
                                 </div>   
                                 <div class="row">
                                  <div class="col-xs-12">${mainSite.mainSiteInfo}</div>
                                 </div>
                                 <hr>
                                 <div class="row">
                                   <div class="col-xs-12" style="font-size: medium;"> 기본 사용인원 : ${mainSite.mainSiteMinCapacity}인 (최대 사용인원 : (${mainSite.mainSiteMaxCapacity}인)</div>
                                 </div>
                                 <div class="row">
                                   <div class="col-xs-12"> 이용가격(1박) : ${mainSite.mainSiteMinPrice}원 (인원 추가금 : ${mainSite.mainSiteAddPrice}원)</div>
                                 </div>
                               </div>       
                           </div>
                           <hr>
                          </c:forEach>
                      </div>
                    </div>
                  </div>


                  <div class="tab-pane" id="mapview">
                    <div id="map" style="width:100%;height:350px;"></div>
                    <hr>

                    <script>
                      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                          mapOption = {
                              center: new kakao.maps.LatLng(1, 1), // 지도의 중심좌표
                              level: 3 // 지도의 확대 레벨
                          };  
                      
                        // 지도를 생성합니다    
                        var map = new kakao.maps.Map(mapContainer, mapOption); 
                                           
                      $('#myTab a').click(function (e) {
                        e.preventDefault()
                        $(this).tab('show');
                        setTimeout(function(){
                          map.relayout();

                          // 주소-좌표 변환 객체를 생성합니다
                          var geocoder = new kakao.maps.services.Geocoder();

                          // 주소로 좌표를 검색합니다
                            geocoder.addressSearch('서울특별시 종로구 종로2가 9', function(result, status) {
                            
                            // 정상적으로 검색이 완료됐으면 
                            if (status === kakao.maps.services.Status.OK) {
                        
                                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        
                                // 결과값으로 받은 위치를 마커로 표시합니다
                                var marker = new kakao.maps.Marker({
                                    map: map,
                                    position: coords
                                });
                        
                                // 인포윈도우로 장소에 대한 설명을 표시합니다
                                var infowindow = new kakao.maps.InfoWindow({
                                    content: '<div style="width:150px;text-align:center;padding:6px 0;">캠핑장</div>'
                                });
                                infowindow.open(map, marker);
                                
                                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                map.setCenter(coords);
                                } 
                            }); 
                        });  
                      });
                    </script>
                  </div>


                  <div class="tab-pane" id="notice">
                    <div calss="row" style="text-align: center; font-size: xx-large;">
                        공지사항
                    </div>
                  </div>


                  <div class="tab-pane" id="qna">
                    <div calss="row" style="text-align: center; font-size: xx-large;">
                      Q&A
                    </div>
                  </div>


                  <div class="tab-pane" id="reviews">
                    <!-- ratingReview -->      
                       <jsp:include page="/view/camp/listRatingReview.jsp"/>
                    <!-- ratingReview -->
                  </div>


              </div>
            </div>
          </div>
        </section>
        <hr class="divider-w">
        
    </main>
  
    <script src="../../resources/lib/jquery/jquery.js"></script>
		<script src="../../resources/lib/jquery-browser-mobile/jquery.browser.mobile.js"></script>
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

  </body>
</html>
