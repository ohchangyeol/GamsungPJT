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
    <title>캠핑장 리뷰등록</title>
     
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

  </head>

  <style>
    .starR{
        background: url('http://127.0.0.1:8080/uploadfiles/ico_review.png') no-repeat right 0;
        background-size: auto 100%;
        width: 15px;
        height: 15px;
        display: inline-block;
        text-indent: -9999px;
        cursor: pointer;
      }
    .starR.on{background-position:0 0;}
    
  </style>

<body id="getReservation" data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
 
  <main>

    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="inner-wrapper">
      
        <jsp:include page="../common/userSideBar.jsp"></jsp:include>

        <section class="body">
          <div class="row getReservation" >
              <div class="col-xs-12">
                
                <div class="row" style="padding-top: 20px;">
                  <div calss="col-sm-12" style="text-align: center; font-size: x-large; margin-bottom: 10px;">
                    <span class="icon-happy"></span>&nbsp;리뷰 등록&nbsp;<span class="icon-happy"></span>
                  </div>
              </div>
                  <hr class="divider-w mt-10 mb-20">

                  <div class="container panel-body" style="margin-bottom: 20px;">

                    <form class="form-horizontal form-center" id="add_review" enctype="multipart/form-data">

                      <div class="form-group" style="text-align: center; padding: 25px;">
                        <div class="col-xs-4"></div>
                        <div class="col-xs-4" style="font-size: 50px; color: deeppink;">
                          ${camp.campRate}
                      </div>
                      </div>

                      <div class="form-group" style="text-align: center;">
                          <div class="col-xs-4"></div>
                          <div class="col-xs-4">
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
                      </div>

                      <div class="form-group" style="text-align: center;">
                          <div class="col-xs-4"></div>
                          <div class="col-xs-4">
                            <strong>${camp.user.campName}캠핑장 평점</strong>
                            <hr>
                          </div>
                      </div>

                      <div class="row">
                               <div class="col-xs-2"></div>
                               <div class="col-xs-8">
                                    <div class="form-group">
                                         <div class="col-xs-1" style="text-align: end;">평점</div>
                                         <div class="starRev col-xs-3" style="text-align: start; top: 3px; padding-left: 0px;">
                                              <span class="starR on" data-star=1.0>별1</span>
                                              <span class="starR"    data-star=2.0>별2</span>
                                              <span class="starR"    data-star=3.0>별3</span>
                                              <span class="starR"    data-star=4.0>별4</span>
                                              <span class="starR"    data-star=5.0>별5</span>
                                              <span id="result_star" style="text-align: center;"></span>
                                         </div>
                                    </div>
                                    <div class="form-group" style="text-align: start; margin-bottom: 0px;">
                                          <div class="col-xs-8">
                                              <textarea class="form-control" name="ratingReviewContent" rows="10" id="review_comment"></textarea>
                                          </div>
                                          <div class="col-xs-4">
                                              <div>
                                                <button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
                                                <input id="input_file" multiple="multiple" type="file" style="display:none;">
                                                <div style="font-size:10px; color: gray;">※이미지 파일은 최대 3개까지 등록이 가능합니다.</div>
                                                <div class="data_file_txt" id="data_file_txt">
                                                    <span>첨부 파일</span>
                                                    <br />
                                                    <div id="articlefileChange">
                                                    </div>
                                                </div>
                                              </div>
                                          </div>
                                    </div>

                                    <div class="form-group" style="text-align: start;">
                                          <div>
                                              <div id="review_comment_cnt">(0 / 1000)</div>
                                          </div>
                                    </div>
                                    
                                    <div class="form-group">
                                          <div class="col-xs-2" style="text-align: start;">
                                              <button type="button" class="btn btn-danger">신고</button>
                                          </div>

                                          <div class="col-xs-8" style="text-align: start; top: 7px; padding-left: 0px;">
                                              <span style="color:tomato">이용하신 캠핑장에 신고사항이 있으면 신고 해주세요.</span>
                                          </div>

                                          <div class="col-xs-2" style="text-align: end;">
                                              <button type="button" class="btn btn-success" onclick="add_camp_review()">등록</button>
                                          </div>
                                    </div>
                                
                                </div>
                                <div class="col-xs-2"></div>
                            </div>
                </div>
                       <div class="col-xs-2"></div>   
                    </div>
                </div>
                
                <input type="hidden" id="statusRating" name="statusRating" value=1.0>
                <input type="hidden" id="camp_no" name="camp.campNo" value="${camp.campNo}">
                <input type="hidden" id="reservation_no" value="${campReservation.reservationNo}">
              </form>
                </div>

              </div>
          </div>
        </section>

    </div>
   
  </main>  

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

      // input file 파일 첨부시 fileCheck 함수 실행
        $(document).ready(function(){
          $("#input_file").on("change", fileCheck);
        });

        $(function () {
            $('#btn-upload').click(function (e) {
                e.preventDefault();
                $('#input_file').click();
            });
        });

              // 파일 현재 필드 숫자 totalCount랑 비교값
        var fileCount = 0;
        // 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
        var totalCount = 3;
        // 파일 고유넘버
        var fileNum = 0;
        // 첨부파일 배열
        var content_files = new Array();

        function fileCheck(e) {
            var files = e.target.files;
            
            // 파일 배열 담기
            var filesArr = Array.prototype.slice.call(files);
            
            // 파일 개수 확인 및 제한
            if (fileCount + filesArr.length > totalCount) {
              alert('이미지 파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
              return;
            } else {
              fileCount = fileCount + filesArr.length;
            }
            
            // 각각의 파일 배열담기 및 기타
            filesArr.forEach(function (f) {
              var reader = new FileReader();
              reader.onload = function (e) {
                content_files.push(f);
                $('#articlefileChange').append(
                  '<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
                  + '<font style="font-size:12px">' + f.name + '</font>'  
                  + '<img src="/uploadfiles/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
                  + '<div/>'
            );
                fileNum ++;
              };
              reader.readAsDataURL(f);
            });
            console.log(content_files);
            //초기화 한다.
            $("#input_file").val("");
          }

        // 파일 부분 삭제 함수
        function fileDelete(fileNum){
            var no = fileNum.replace(/[^0-9]/g, "");
            content_files[no].is_delete = true;
          $('#' + fileNum).remove();
          fileCount --;
            console.log("제이쿼리 밖"+content_files);
        }
        
         //리뷰등록
        function add_camp_review(){
            console.log("리뷰등록함수"+content_files); 
            
            var formdata = new FormData(document.getElementById('add_review'));

             for (var x = 0; x < content_files.length; x++) {
                // 삭제 안한것만 담아 준다. 
                if(!content_files[x].is_delete){
                  formdata.append("reviewImg", content_files[x]);
                }
              }
              
              var xhr = new XMLHttpRequest();
              var reservationNo = $("#reservation_no").val();

              xhr.open("POST", "/campGeneral/addCampRatingReview?reservationNo="+reservationNo);  
              xhr.send(formdata);
        }

      
      $( function() { 

          //캠핑장 신고
          $(".btn-danger").on("click" , function() {

            var imgArray = $("#")
              
            self.location ="/campGeneral/updateMyReservationView?reservationNo="+$(this).attr("value");
            
          });

          $('#review_comment').on('keyup', function() {
                $('#review_comment_cnt').html("("+$(this).val().length+" / 1000)");
        
                if($(this).val().length > 1000) {
                    $(this).val($(this).val().substring(0, 1000));
                    $('review_comment_cnt').html("(1000 / 1000)");
                }
            });

          $('.starRev span').on("click", function(){
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            var append = "&nbsp;&nbsp;&nbsp;("+$(this).data('star')+ "점)";
            
            console.log($(this).data("star"));

            $("#statusRating").val($(this).data("star"));
            $("#result_star").empty();
            $("#result_star").append(append);
            
            return false;
          });
     
      });

    </script>

</body>

</html>