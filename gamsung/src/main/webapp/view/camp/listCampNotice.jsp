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
    <title>listRatingReview</title>
     
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

    <script>

     
      
    </script>

  </head>
<body id = "noticechange" data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

          
  <div class="row">
    <div calss="col-sm-12" style="text-align: center; font-size: x-large; margin-bottom: 10px;">
      <span class="icon-happy"></span>&nbsp;공지사항 목록&nbsp;<span class="icon-happy"></span>
    </div>
    <div class="col-xs-12">
      <div class="row">
        <h4 class="col-sm-7 mb-0"></h4>
        <div class="col-sm-5 mb-sm-0">
          <div class="row">
            <form role="form" class="notice-search" id="searchform">
              <div class="col-sm-4">
                <select class="form-control" name="searchCondition">
                  <option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목+내용</option>
						      <option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
						      <option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
                </select>
              </div>
              <div class="col-sm-8">
                <div class="search-box">
                  <input class="form-control" type="text" name="searchKeyword" placeholder="Search...">
                  <button class="search-btn" type="submit" id="search"><i class="fa fa-search"></i></button>
                </div>
              </div>
              <input type="hidden" name="campNo" value="${campNo}"/>
            </form>
          </div>
        </div>
      </div>
      <hr class="divider-w mt-10 mb-20">
      <div class="notice-list">
        <ul>
          <div class="row" style="text-align: center;">
            <div class="col-sm-2 center" style="font-size: large; font-weight: bold;">번호</div>
            <div class="col-sm-6 " style="font-size: large; font-weight: bold;">제목</div>
            <div class="col-sm-2 notice-view-count" style="font-size: large; font-weight: bold;">조회수</div>
            <div class="col-sm-2 notice-reg-date" style="font-size: large; font-weight: bold;">등록일</div>
          </div>
          <hr>

          <!-- list Start -->
          <c:set var ="i" value="0" />
          <c:forEach var ="notice" items="${wrapper.notices}">
            <c:set var ="i" value="${i+1}" />
          
            <div class="row" style="text-align: center;">
              <div class="col-sm-2 center">${ i }</div>
              <div class="col-sm-6 notice-title"  style="cursor: pointer;" value=${notice.noticeNo}>${notice.noticeTitle}</div>
              <div class="col-sm-2 notice-view-count"><i class="fa fa-fw"></i> ${notice.viewCount}</div>
              <div class="col-sm-2 notice-reg-date">${notice.regDate}</div>
            </div>
            <hr>
          
        </c:forEach>
          
        </ul>
      </div>
    </div>
    
</div>
            
        <form id="pagenavi">
          <input type="hidden" id="currentPage" name="currentPage" value="0"/>
          <input type="hidden" name="searchKeyword" value="${search.searchKeyword}">
          <input type="hidden" name="searchCondition" value="${search.searchCondition}">
          <input type="hidden" name="campNo" value="${campNo}"/>
        </form>

         <!-- PageNavigation -->
         <div class="row">
          <jsp:include page="../common/pageNavigator.jsp"/>
       </div>
       
   	 <script src="../../resources/lib/bootstrap/js/bootstrap.js"></script>
     <script src="../../resources/lib/nanoscroller/nanoscroller.css"></script>
     <script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
     <script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
     <script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
     <!-- Specific Page Vendor -->
     <script src="../../resources/lib/pnotify/pnotify.custom.js"></script>
     <!-- Theme Base, Components and Settings -->
    
     <!-- Theme Custom -->
     <script src="../../resources/js/theme.custom.js"></script>
     <!-- Theme Initialization Files -->
     <script src="../../resources/js/theme.init.js"></script>
     <!-- Examples -->
     <script src="../../resources/js/examples.lightbox.js"></script>
    
</body>

      <script type="text/javascript">

        var currentPage = 1;
      
        function fncGetList(currentPage) {

              $("#currentPage").val(currentPage);
              $("#pagenavi").attr("method","POST").attr("action","/campGeneral/listCampNotice").submit();

            }

        $(function() {

          $(".notice-title").on("click" , function() {
          
            self.location ="/campGeneral/getCampNotice?noticeNo="+$(this).attr("value");
          
          });
        })

        $("#searchKeyword").keypress(function(e) { 
            if (e.keyCode == 13){
              $("#searchform").attr("method","POST").attr("action","/campGeneral/listCampNotice").submit();
            }    
        });

        $("#search").on("click" , function() {
          $("#searchform").attr("method","POST").attr("action","/campGeneral/listCampNotice").submit();
        });

          
      </script>

      <script type="text/javascript">
        parent.noticeIframeHeight(document.getElementById("noticechange").scrollHeight);
      </script>

</html>