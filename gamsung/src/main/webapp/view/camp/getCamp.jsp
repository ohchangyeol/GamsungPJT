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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


    <style>
      .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
      .map_wrap {position:relative;width:100%;height:350px;}
      #category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
      #category li {float:left;list-style: none;width:50px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
      #category li.on {background: #eee;}
      #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
      #category li:last-child{margin-right:0;border-right:0;}
      #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
      #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
      #category li .bank {background-position: -10px 0;}
      #category li .mart {background-position: -10px -36px;}
      #category li .pharmacy {background-position: -10px -72px;}
      #category li .oil {background-position: -10px -108px;}
      #category li .cafe {background-position: -10px -144px;}
      #category li .store {background-position: -10px -180px;}
      #category li.on .category_bg {background-position-x:-46px;}
      .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
      .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
      .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
      .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
      .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
      .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
      .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
      .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
      .placeinfo .tel {color:#0f7833;}
      .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
    
    </style>
    
    <style>
    
      img { display : block;
            margin : auto;}

    </style>

    
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
                    <c:set var="rating" value="${camp.campRate}" />
                      <c:if test="${rating < 1.0}">
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                      </c:if>
                      <c:if test="${rating >= 1.0 && rating < 2.0}">
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                      </c:if>
                      <c:if test="${rating >= 2.0 && rating < 3.0}">
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                      </c:if>
                      <c:if test="${rating >= 3.0 && rating < 4.0}">
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                      </c:if>
                      <c:if test="${rating >= 4.0 && rating < 5.0}">
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star-off"></i></span>
                      </c:if>
                      <c:if test="${rating == 5.0}">
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                        <span><i class="fa fa-star star"></i></span>
                      </c:if>
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
                 <div class="col-sm-12"><a class="btn btn-lg btn-block btn-round btn-b" id="reservation">예약하기</a></div>
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
                  <li><a href="#reviews" data-toggle="tab" id="rating_review"><span class="icon-magnifying-glass"></span>평점&리뷰</a></li>
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
                    <div class="map_wrap">
                      <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                        <ul id="category">
                          <li id="FD6" data-order="0"> 
                              음식점
                          </li>       
                          <li id="CT1" data-order="1"> 
                              문화시설
                          </li>  
                          <li id="AT4" data-order="2"> 
                              관광명소
                          </li>  
                        </ul>
                    </div>
                    <hr>

                    <script>

                      // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
                      var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
                          contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
                          markers = [], // 마커를 담을 배열입니다
                          currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다


                      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                          mapOption = {
                              center: new kakao.maps.LatLng(1, 1), // 지도의 중심좌표
                              level: 7 // 지도의 확대 레벨
                          };  
                      
                        // 지도를 생성합니다    
                        var map = new kakao.maps.Map(mapContainer, mapOption); 

                        
                        // 장소 검색 객체를 생성합니다
                        var ps = new kakao.maps.services.Places(map); 

                        // 지도에 idle 이벤트를 등록합니다
                        kakao.maps.event.addListener(map, 'idle', searchPlaces);

                        // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
                        contentNode.className = 'placeinfo_wrap';

                        // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
                        // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
                        addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
                        addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

                        // 커스텀 오버레이 컨텐츠를 설정합니다
                        placeOverlay.setContent(contentNode);  

                        // 각 카테고리에 클릭 이벤트를 등록합니다
                        addCategoryClickEvent();

                        // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
                        function addEventHandle(target, type, callback) {
                            if (target.addEventListener) {
                                target.addEventListener(type, callback);
                            } else {
                                target.attachEvent('on' + type, callback);
                            }
                        }

                        // 카테고리 검색을 요청하는 함수입니다
                        function searchPlaces() {
                            if (!currCategory) {
                                return;
                            }
                            
                            // 커스텀 오버레이를 숨깁니다 
                            placeOverlay.setMap(null);

                            // 지도에 표시되고 있는 마커를 제거합니다
                            removeMarker();
                            
                            ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
                        }

                        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                        function placesSearchCB(data, status, pagination) {
                            if (status === kakao.maps.services.Status.OK) {

                                // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
                                displayPlaces(data);
                            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                                // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

                            } else if (status === kakao.maps.services.Status.ERROR) {
                                // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
                                
                            }
                        }

                        // 지도에 마커를 표출하는 함수입니다
                        function displayPlaces(places) {

                            // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
                            // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
                            var order = document.getElementById(currCategory).getAttribute('data-order');

                            

                            for ( var i=0; i<places.length; i++ ) {

                                    // 마커를 생성하고 지도에 표시합니다
                                    var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

                                    // 마커와 검색결과 항목을 클릭 했을 때
                                    // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                                    (function(marker, place) {
                                        kakao.maps.event.addListener(marker, 'click', function() {
                                            displayPlaceInfo(place);
                                        });
                                    })(marker, places[i]);
                            }
                        }

                        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                        function addMarker(position, order) {
                            //  var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                            //      imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
                            //      imgOptions =  {
                            //         spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
                            //         spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                            //         offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                            //     },
                            //     markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                                    marker = new kakao.maps.Marker({
                                    position: position, // 마커의 위치
                                    //image: markerImage 
                                });

                            marker.setMap(map); // 지도 위에 마커를 표출합니다
                            markers.push(marker);  // 배열에 생성된 마커를 추가합니다

                            return marker;
                        }

                        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                        function removeMarker() {
                            for ( var i = 0; i < markers.length; i++ ) {
                                markers[i].setMap(null);
                            }   
                            markers = [];
                        }

                        // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
                        function displayPlaceInfo (place) {
                            var content = '<div class="placeinfo">' +
                                            '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

                            if (place.road_address_name) {
                                content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                                            '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
                            }  else {
                                content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
                            }                
                          
                            content += '    <span class="tel">' + place.phone + '</span>' + 
                                        '</div>' + 
                                        '<div class="after"></div>';

                            contentNode.innerHTML = content;
                            placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
                            placeOverlay.setMap(map);  
                        }


                        // 각 카테고리에 클릭 이벤트를 등록합니다
                        function addCategoryClickEvent() {
                            var category = document.getElementById('category'),
                                children = category.children;

                            for (var i=0; i<children.length; i++) {
                                children[i].onclick = onClickCategory;
                            }
                        }

                        // 카테고리를 클릭했을 때 호출되는 함수입니다
                        function onClickCategory() {
                            var id = this.id,
                                className = this.className;

                            placeOverlay.setMap(null);

                            if (className === 'on') {
                                currCategory = '';
                                changeCategoryClass();
                                removeMarker();
                            } else {
                                currCategory = id;
                                changeCategoryClass(this);
                                searchPlaces();
                            }
                        }

                        // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
                        function changeCategoryClass(el) {
                            var category = document.getElementById('category'),
                                children = category.children,
                                i;

                            for ( i=0; i<children.length; i++ ) {
                                children[i].className = '';
                            }

                            if (el) {
                                el.className = 'on';
                            } 
                        } 



                                           
                      $('#myTab a').click(function (e) {
                        e.preventDefault()
                        $(this).tab('show');
                        setTimeout(function(){
                          map.relayout();

                          // 주소-좌표 변환 객체를 생성합니다
                          var geocoder = new kakao.maps.services.Geocoder();

                          // 주소로 좌표를 검색합니다
                            geocoder.addressSearch('${camp.user.addr}', function(result, status) {
                            
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
                                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${camp.user.campName}&nbsp;캠핑장</div>'
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
                    <div class="tab-pane" id="reviews">
                      <div calss="row">
                        <div calss="col-sm-12" style="text-align: center; font-size: large;">
                          <span class="icon-happy"></span>&nbsp;평점&리뷰 (전체 <span style="color: rgb(230, 173, 17);">${resultPage.totalCount}건</span>)&nbsp;<span class="icon-happy"></span>
                        </div>
                        <div calss="row" >
                          <div calss="col-sm-12" style="text-align: center; font-size: medium;">
                            &nbsp;평균평점&nbsp;
                            <c:set var="rating" value="${camp.campRate}" />
                                  <c:if test="${rating < 1.0}">
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                  </c:if>
                                  <c:if test="${rating >= 1.0 && rating < 2.0}">
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                  </c:if>
                                  <c:if test="${rating >= 2.0 && rating < 3.0}">
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                  </c:if>
                                  <c:if test="${rating >= 3.0 && rating < 4.0}">
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                  </c:if>
                                  <c:if test="${rating >= 4.0 && rating < 5.0}">
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star-off"></i></span>
                                  </c:if>
                                  <c:if test="${rating == 5.0}">
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                    <span><i class="fa fa-star star"></i></span>
                                  </c:if>
                                <a class="open-tab section-scroll">&nbsp;(${camp.campRate})</a>
                          </div>
                          <!-- <div class="row">
                            <div class="fa-hover col-xs-12" style="text-align: end;">  
                             
                              평점
                              <i class="fa fa-arrow-down" id="statusRatings" data-camp_no="${camp.campNo}" data-sort_condition="평점 높은순" ></i>
                              
                              등록일
                              
                              <i class="fa fa-arrow-down" id="reviewRegDate" data-camp_no="${camp.campNo}" data-sort_condition="최근 등록일순"></i>
                              
                              &nbsp;&nbsp;&nbsp;
                            </div>
                          </div> -->
                          <hr>
                        </div>
                      </div>
            
                      <form id="get_review">
                        <c:set var="i" value="0" />
                           <c:forEach var="review" items="${list}">
                              <c:set var="i" value="${ i+1 }" />
                              <div class="comments reviews">
                                  <div class="comment clearfix">

                                    <div class="img-responsive col-sm-3">
                                      <a class="image-popup-vertical-fit" href="/uploadfiles/campimg/review/${review.img1}" >
                                       <img class="img-responsive" src="/uploadfiles/campimg/review/${review.img1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'"/>
                                      </a>
                                    </div>

                                    <div class="comment-content clearfix col-sm-8" style="margin-left: 0px; margin-bottom: 0px;">
                                      
                                      <div class="comment-author">
                                        <span style="font-size: large;">${review.user.nickName}</span>&nbsp;
                                        <c:if test="${review.ratingReviewStatus == 1}">
                                          (예약후기)
                                        </c:if>
                                        <c:if test="${review.ratingReviewStatus == 2}">
                                          (커뮤니티글)
                                        </c:if>
                                        <span style="font-size: x-small;">&nbsp;&nbsp;&nbsp;${review.reviewRegDate}</span>
                                      </div>
                                                                              
                                      <div class="comment-author">
                                        <c:set var="rating" value="${review.statusRating}" />
                                          <c:if test="${rating < 1.0}">
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                          </c:if>
                                          <c:if test="${rating >= 1.0 && rating < 2.0}">
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                          </c:if>
                                          <c:if test="${rating >= 2.0 && rating < 3.0}">
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                          </c:if>
                                          <c:if test="${rating >= 3.0 && rating < 4.0}">
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                          </c:if>
                                          <c:if test="${rating >= 4.0 && rating < 5.0}">
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                          </c:if>
                                          <c:if test="${rating == 5.0}">
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                            <span><i class="fa fa-star star"></i></span>
                                          </c:if>
                                        <a class="open-tab section-scroll">&nbsp;(${review.statusRating})</a>
                                      </div>
                                      <div class="comment-body">
                                        <p>${review.ratingReviewContent}</p>
                                      </div>

                                      <c:if test="${review.comment != null && review.comment != ''}">
                                        <div class="row">
                                        <div class="col-sm-1"></div>
                                        <div class="comment-author font-alt">re : <span style="font-size: large;">${camp.user.campName}</span>
                                          <span style="font-size: x-small;">&nbsp;${review.commentRegDate}</span></div>
                                        </div>
                                        <div class="row">
                                          <div class="col-sm-1"></div>
                                          <div class="comment-body">
                                            <p>&nbsp;&nbsp;${review.comment}</p>
                                          </div>
                                        </div>
                                      </c:if>
                                     
                                    </div>
                                  </div>
                                 </div>
                                <hr>
                        </c:forEach>

                        <div class="row">
                          <jsp:include page="../common/pageNavigator.jsp"/>
                        </div>

                    </form>
                        
                  </div>
                  </div>

              </div>
            </div>
          </div>
        </section>
        <hr class="divider-w">

        <form id="hidden">
          <input type="hidden" id="campno" name="camp.campNo" value="${camp.campNo}"/>
          <input type="hidden" id="id" name="user.id" value="${user.id}"/>
        </form>
        
    </main>
  
    <!-- <script src="../../resources/lib/jquery/jquery.js"></script>
		<script src="../../resources/lib/jquery-browser-mobile/jquery.browser.mobile.js"></script> -->
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
    
      var campNo = document.getElementById('campno').value;
      
      function fncGetList(currentPage) {
        
        var Page = currentPage;

          $("#get_review").empty();
 
              $.ajax( 
                  {
                    url : "/campGeneral/json/listReviews/"+Page+"/"+campNo,
                    method : "GET" ,
                    dataType : "json" ,
                    headers : {
                      "Accept" : "application/json",
                      "Content-Type" : "application/json"
                    },
                    success : function(JSONData , status) {
                      var append_node ="";      
                      $.each(JSONData, function(i, ratingReview) {

                        append_node += "<div class='comments reviews'>"
                        append_node += "<div class='comment clearfix'>"
                        append_node += "<div class='img-responsive col-sm-3'>"
                        append_node += "<img class='img-responsive' src='/uploadfiles/campimg/review/"+ratingReview.img1+"'" + "onerror=this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg' />"
                        append_node += "</div>"
                        append_node += "<div class='comment-content clearfix col-sm-8' style='margin-left: 0px; margin-bottom: 0px;'>"
                        append_node += "<div class='comment-author'>"
                        append_node += "<span style='font-size: large;'>"+ratingReview.user.nickName+"</span>&nbsp;"
                          if(ratingReview.ratingReviewStatus == 1){
                            append_node += "(예약후기)"
                          }else if(ratingReview.ratingReviewStatus == 2){
                            append_node += "(커뮤니티글)"
                          }
                       
                        append_node += "</div>"
                        append_node += "<div class='comment-author'>"

                          if(ratingReview.statusRating < 1.0){
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                          }
                          if(ratingReview.statusRating >= 1.0 && ratingReview.statusRating < 2.0){
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                          }
                          if(ratingReview.statusRating >= 2.0 && ratingReview.statusRating < 3.0){
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                          }
                          if(ratingReview.statusRating >= 3.0 && ratingReview.statusRating < 4.0){
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                          }
                          if(ratingReview.statusRating >= 4.0 && ratingReview.statusRating < 5.0){
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star-off'></i></span>"
                          }
                          if(ratingReview.statusRating == 5.0){
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                            append_node +="<span><i class='fa fa-star star'></i></span>"
                          }
                          
                        append_node += "<a class='open-tab section-scroll'>&nbsp;("+ratingReview.statusRating+")</a>"
                        append_node += "</div>"
                        append_node += "<div class='comment-body'>"
                        append_node += "<p>"+ratingReview.ratingReviewContent+"</p>"
                        append_node += "</div>"

                        if(ratingReview.comment != null && ratingReview.comment != ''){
                          append_node += "<div class='row'>"
                          append_node += "<div class='col-sm-1'></div>"
                          append_node += "<div class='comment-author font-alt'>re : <span style='font-size: large;'>${camp.user.campName}</span>"
                          append_node += "</div>"
                          append_node += "<div class='row'>"
                          append_node += "<div class='col-sm-1'></div>"
                          append_node += "<div class='comment-body'>"
                          append_node += "<p>&nbsp;&nbsp;"+ratingReview.comment+"</p>"
                          append_node += "</div>"
                          append_node += "</div>"
                        }
   
                        append_node += "</div>";
                        append_node += "</div>";
                        append_node += "</div>";
                        append_node += "<hr>";
                       
                      });
                      $('#get_review').append(append_node);
                    }
                   
                });
        }
        
      $( function() {
        $(  "#reservation"  ).on("click", function() {    
           var mainSiteNo = 0;
           $("#hidden").attr("method","POST").attr("action","/campGeneral/addReservation?mainSiteNo="+mainSiteNo).submit();
        }); 
      });

    </script>

  </body>
</html>
