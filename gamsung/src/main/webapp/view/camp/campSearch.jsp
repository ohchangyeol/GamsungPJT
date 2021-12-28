<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>campSearch</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="../../resources/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="../../resources/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="../../resources/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="../../resources/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="../../resources/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="../../resources/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="../../resources/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="../../resources/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="../../resources/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="../../resources/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../../resources/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../../resources/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../../resources/images/favicons/favicon-16x16.png">
    <!-- <link rel="manifest" href="/manifest.json"> -->
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="resources/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
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
  </head>

  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <!-- header -->
      <jsp:include page="/view/common/header.jsp"/>
      <!-- header End -->
      <section class="bg-dark-30 showcase-page-header module parallax-bg" data-background="../../resources/images/showcase_bg.jpg">
        <class class="titan-caption">
          <div class="col-md-5"></div>
          <h2 class="col-md-3" style="margin-bottom: 20px;">캠핑장을 검색해 주세요!</h2>
          <div class="col-md-4"></div>
          <div class="panel-body">
            
            <form class="form-horizontal form-bordered">
              <div class="form-group">
                <div class="col-md-6" ></div>
                <div class="col-md-1" ></div>
                <div class="col-md-1" >
                  <div class="input-group mb-md">
                    <div class="input-group-btn">
                      <button class="btn btn-success control-label" type="button" style="padding: 3px;">상세검색+</button>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-md-5 control-label">키워드 검색</label>
                <div class="col-md-4">
                  <div class="input-group mb-md">
                    <input type="text" class="col-md-4" style="width: 408px;">
                  </div>
                </div>
              </div>
    
              <div class="form-group">
                <label class="col-md-5 control-label">지역별</label>
                <div class="col-md-4">
                  <div class="input-group mb-md">
                    <div class="input-group-btn">
                      <select name="sido" id="sido" class="btn btn-primary dropdown-toggle"  >
                        <option value="">전체/도</option>
                        <option value="1">서울</option>
                        <option value="2">부산</option>
                        <option value="3">대구</option>
                        <option value="4">인천</option>
                        <option value="5">광주</option>
                        <option value="6">대전</option>
                        <option value="7">울산</option>
                        <option value="8">세종</option>
                        <option value="9">경기</option>
                        <option value="10">강원</option>
                        <option value="11">충북</option>
                        <option value="12">충남</option>
                        <option value="13">전북</option>
                        <option value="14">전남</option>
                        <option value="15">경북</option>
                        <option value="16">경남</option>
                        <option value="17">제주</option>
                      </select>
                      
                      <select name="signgu" id="signgu" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        <option value="">전체/시/군</option>
                        <option value="1">강남구</option>
                        <option value="2">강동구</option>
                        <option value="3">강북구</option>
                        <option value="4">강서구</option>
                        <option value="5">관악구</option>
                        <option value="6">광진구</option>
                        <option value="7">구로구</option>
                        <option value="8">금천구</option>
                        <option value="9">노원구</option>
                        <option value="10">도봉구</option>
                        <option value="11">동대문구</option>
                        <option value="12">동작구</option>
                        <option value="13">마포구</option>
                        <option value="14">서대문구</option>
                        <option value="15">서초구</option>
                        <option value="16">성동구</option>
                        <option value="17">성북구</option>
                        <option value="18">송파구</option>
                        <option value="19">양천구</option>
                        <option value="20">영등포구</option>
                        <option value="21">용산구</option>
                        <option value="22">은평구</option>
                        <option value="23">종로구</option>
                        <option value="24">중구</option>
                        <option value="25">중랑구</option>
                      </select>

                      <button class="btn btn-success" type="button">검색</button>
                      
                    </div>
                    
                  </div>
               </div>
              </div>
            </form>
          </div>         
        </class>
      </section>
     </main>
    <!--  
    JavaScripts
    =============================================
    -->
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
    <script type="text/javascript">
        $( function() {
                
                $("#search").focus();
    
                $("button:contains(search)").on("click" , function() {
                    
                    var keyword=$("#keyword").val();
                    var addr = $("#addr1").val() + $("#addr2").val();
                        
                    $("form").attr("method","POST").attr("action","/campGeneral/login").submit();
                });
            });	
    </script>	
  </body>
</html>