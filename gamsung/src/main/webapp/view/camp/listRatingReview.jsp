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
    
    <!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css"> -->
    <!-- Vendor CSS -->
    <!-- <link href="../../resources/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet" />
    <link href="../../resources/lib/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" /> -->
    <!-- Theme CSS -->
    <!-- <link href="../../resources/css/theme.css" rel="stylesheet" /> -->
    <!-- Skin CSS -->
    <!-- <link href="../../resources/css/skins/default.css" rel="stylesheet" /> -->
    <!-- Theme Custom CSS -->
    <!-- <link href="../../resources/css/theme-custom.css" rel="stylesheet" > -->
    <!-- Head Libs -->
    <!-- <script src="../../resources/lib/modernizr/modernizr.js"></script> -->
    <!-- JavaScripts -->
    <!-- <script src="../../resources/lib/jquery/jquery.js"></script>
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
    <script src="../../resources/js/main.js"></script> -->
    <!-- Kakao Map-->
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f8199ad71211c3df709f290a0e83244&libraries=services"></script> -->
    <!-- Default stylesheets-->
    <!-- <link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- Template specific stylesheets-->
    <!-- <link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="../../resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">        -->
    <!-- Main stylesheet and color file-->
    <!-- <link href="../../resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../../resources/css/colors/default.css" rel="stylesheet">   -->

    <!-- <style>

      img { display : block;
            margin : auto;}

    </style> -->

    <script type="text/javascript">
          
      $( function() {

      });

    </script>
  </head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
        <div class="comments reviews">
            <div class="comment clearfix">
              <div class="comment-avatar"><img src="" alt="avatar"/></div>
              <div class="comment-content clearfix">
                <div class="comment-author font-alt"><a href="#">John Doe</a></div>
                <div class="comment-body">
                  <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                </div>
                <div class="comment-meta font-alt">Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star-off"></i></span>
                </div>
              </div>
            </div>
            <div class="comment clearfix">
              <div class="comment-avatar"><img src="" alt="avatar"/></div>
              <div class="comment-content clearfix">
                <div class="comment-author font-alt"><a href="#">Mark Stone</a></div>
                <div class="comment-body">
                  <p>Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                </div>
                <div class="comment-meta font-alt">Today, 14:59 -<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star-off"></i></span><span><i class="fa fa-star star-off"></i></span>
                </div>
              </div>
            </div>
          </div>
          <div class="comment-form mt-30">
            <h4 class="comment-form-title font-alt">Add review</h4>
            <form method="post">
              <div class="row">
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="sr-only" for="name">Name</label>
                    <input class="form-control" id="name" type="text" name="name" placeholder="Name"/>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="sr-only" for="email">Name</label>
                    <input class="form-control" id="email" type="text" name="email" placeholder="E-mail"/>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <select class="form-control">
                      <option selected="true" disabled="">Rating</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                    </select>
                  </div>
                </div>
                <div class="col-sm-12">
                  <div class="form-group">
                    <textarea class="form-control" id="" name="" rows="4" placeholder="Review"></textarea>
                  </div>
                </div>
                <div class="col-sm-12">
                  <button class="btn btn-round btn-d" type="submit">Submit Review</button>
                </div>
              </div>
            </form>
          </div>
        </div>
     </main>

    <!-- <script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/jquery-browser-mobile/jquery.browser.mobile.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.js"></script>
    <script src="../../resources/lib/nanoscroller/nanoscroller.css"></script>
    <script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
    <script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script> -->
    <!-- Specific Page Vendor -->
    <!-- <script src="../../resources/lib/pnotify/pnotify.custom.js"></script> -->
    <!-- Theme Base, Components and Settings -->
    <!-- <script src="../../resources/js/theme.js"></script> -->
    <!-- Theme Custom -->
    <!-- <script src="../../resources/js/theme.custom.js"></script> -->
    <!-- Theme Initialization Files -->
    <!-- <script src="../../resources/js/theme.init.js"></script> -->
    <!-- Examples -->
    <!-- <script src="../../resources/js/examples.lightbox.js"></script> -->
</body>
</html>