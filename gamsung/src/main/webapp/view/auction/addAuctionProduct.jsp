<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<title>상품 등록</title>
	
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
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    
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
    <link rel="stylesheet" href="assets/vendor/pnotify/pnotify.custom.css" />  
 
 	<style>
 	
		.filebox label { 
		display: inline-block; 
		padding: 60px 60px; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
		} 
			 
		 #file{
		 	display: flex;
		 	flex-direction: row;
		 	justify-content: space-between;
		 }
		 .form-group{
		 	display: flex;
		 }
		 .time{
		 	display: flex;
		 }
		 
		  input[type=file] {
            display: none;
        }

        .imgsWrap {

            border: 2px solid #A8A8A8;
            margin-top: 30px;
            margin-bottom: 30px;
            padding-top: 10px;
            padding-bottom: 10px;

        }
        .imgsWrap img {
            max-width: 150px;
            margin-left: 10px;
            margin-right: 10px;
        }
		 
	</style>
	
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

	
</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
   <main>
		<div class="page-loader">
       		<div class="loader">Loading...</div>
     	</div>
  		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="main">
			<section class="module bg-dark-30 about-page-header"
				data-background="assets/images/about_bg.jpg">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h1 class="module-title font-alt mb-0">Forms</h1>
						</div>
					</div>
				</div>
			</section>
		</div>
		<section class="module">
          <div class="container">
            <div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<h4 class="font-alt mb-0">상품 등록</h4>
						<hr class="divider-w mt-10 mb-20">
						<form class="form" role="form">
							<div class="form-group">
								<label for="auctionProductName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label> 
								<input id="auctionProductName" name="auctionProductName" class="form-control" type="text" value="${auctionProduct.auctionProductName}" placeholder="상품명을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="startBidPrice" class="col-sm-offset-1 col-sm-3 control-label">경매 시작가</label>
								<input id="startBidPrice" name="startBidPrice" class="form-control" type="text" value="${auctionProduct.startBidPrice}" placeholder="경매 시작가를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="hopefulBidPrice" class="col-sm-offset-1 col-sm-3 control-label">희망 낙찰가</label>
								<input id="hopefulBidPrice" name="hopefulBidPrice" class="form-control" type="text" value="${auctionProduct.hopefulBidPrice}" placeholder="희망 낙찰가를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="bidUnit" class="col-sm-offset-1 col-sm-3 control-label">입찰 단위</label> 
								<input id="bidUnit" name="bidUnit" class="form-control" type="text"	value="${auctionProduct.bidUnit}"  placeholder="입찰 단위를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="auctionStartTime" class="col-sm-offset-1 col-sm-3 control-label">경매 시작 시간</label>
								<input id="auctionStartTime" name="auctionStartTime" class="form-control" type="text"  value="${auctionProduct.auctionStartTime}"  placeholder="경매 시작 시간을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="auctionEndTime" class="col-sm-offset-1 col-sm-3 control-label">경매 종료 시간</label>
								<input id="auctionEndTime" name="auctionEndTime" class="form-control" type="text" value="${auctionProduct.auctionEndTime}" placeholder="경매 종료 시간을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="bidableGrade" class="col-sm-offset-1 col-sm-3 control-label">입찰 가능 등급</label>
								<input id="bidableGrade" name="bidableGrade" class="form-control" type="text" value="${auctionProduct.bidableGrade}" placeholder="입찰 가능 등급을 입력하세요." />
							</div>
							<div class="inputWrap">
								<button type="button" id="fileUpload" class="btn btn-border-d btn-round">파일 업로드</button>
								 <input type="file" id="inputImgs" name="inputImgs" multiple />
							</div>
							<div>
								<div class="imgsWrap"></div>
							</div>
							<textarea id="textareaDetail" name="auctionProductDetail" class="form-control" rows="7" placeholder="상품 정보를 입력 하세요.." ></textarea>
		                </form>
                <div class="col-sm-4 col-sm-offset-2"></div>
                <div class="col-sm-4 col-sm-offset-2">
                <div class="row">
                
	                <button id="cancel" class="btn btn-border-d btn-circle" type="button">취소</button>
	                <button id="previewBtn" class="btn btn-border-d btn-circle" type="button">미리보기</button>                
                </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Titan</h5>
                  <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                  <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                  <p>Email:<a href="#">somecompany@example.com</a></p>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
	<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p class="footer-company-name">All Rights Reserved. &copy; 2018 <a href="#">Evento Christmas</a> Design By : <a href="https://html.design/">html design</a></p>
				</div>
			</div>
		</div>
	</footer>
	
    <script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../resources/lib/wow/wow.js"></script>
    <script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
    <script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="../../resources/lib/smoothscroll.js"></script>
    <script src="../../resources/lib/magnific-popup/jquery.magnific-popup.js"></script>
    <script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../../resources/js/plugins.js"></script>
    <script src="../../resources/js/main.js"></script>
	
	<script>
		$(function(){
			$("#cancel").on('click', function(){
				window.location.href = "/auction/listAuctionProduct";
			});
			
			$("#previewBtn").on('click',function(){
				if( !$.isNumeric( $('#startBidPrice').val() ) ){
					$('#startBidPrice').focus();
					$('#startBidPriceDiv').attr('hidden',false)
					$('#startBidPriceStrong').text('경매 시작가가 숫자가 아닙니다.').css('color','red');
					return;
				}
				
				if( !$.isNumeric( $('#hopefulBidPrice').val() ) ){
					$('#hopefulBidPrice').focus();
					$('#hopefulBidPriceDiv').attr('hidden',false)
					$('#hopefulBidPriceStrong').text('희망 낙찰가가 숫자가 아닙니다.').css('color','red');
					return;
				}
				
				$('form').attr('method','post').attr('action','/auction/previewAuctionProduct').attr("enctype","multipart/form-data").submit();
			});
			
			$('#fileUpload').on('click',fileUploadAction);
			$("#inputImgs").on("change",handleImgFileSelect);
			
		});
		
		var sel_files = [];
		
		function fileUploadAction() {
            console.log("fileUploadAction");
            $("#inputImgs").trigger('click');
        }
		
		function handleImgFileSelect(e){
			
			sel_files = [];
			$(".imgsWrap").empty();
			
			var files = e.target.files;
			var filesArray = Array.prototype.slice.call(files);
			
			var index = 0;
			
			filesArray.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("이미지만 업로드 가능합니다.");
					return;
				}
			
				sel_files.push(f);
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					 var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"imgId"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
					$('.imgsWrap').append(html);
					index++;
				}
				reader.readAsDataURL(f);
			});
		}
		
		function deleteImageAction(index) {
           
            sel_files.splice(index, 1);

            var imgId = "#imgId"+index;
            $(imgId).remove(); 
        }
		
		
		
		
		
	</script>
</body>
</html>