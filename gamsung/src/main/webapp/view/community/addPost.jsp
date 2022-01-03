<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>Titan | Multipurpose HTML5 Template</title>
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
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
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

    <style>
    

       
      .camera-box{
        display: flex;
/*         justify-content: flex-start; */
/*         text-align: center; */
         color: #c1c1c1; */
/*         height: 90px; */
/*         padding-bottom: 10px; */
        flex-direction: column;
      }
      
   
     .camera-video .camera-box+.camera-box{
      	margin-left : 20px
      }
      
      .camera-box div svg{
        width: 90%;
        height: 90%;
      }
      .camera-box .video-btn svg{
        transform: translateY(4px);
      }

      .camera-box .camera-btn svg{
        transform: translateY(2px);
      }
      
      .camera-video{
        display: flex;
        justify-content: flex-start;
        text-align: center;
        color: ##c1c1c1;        
        padding-bottom: 10px;
      	
      }
      
      #inputImgs {
       display: none;
        }
      
      
      
    </style>

  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" style="background: #fff">
    <main>

      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      
       <!-- header -->
       <jsp:include page="../common/header.jsp"/>   
       <!-- headerEnd -->
      


     
        <section class="module" id="contact">
          <div class="container">
          
            <div class="row">
                <!-- sidebar Start -->
				<jsp:include page="leftCommunity.jsp"/>
              	<!-- sidebar End -->

     <!--addPost Start-->   
     
              <div class="col-sm-8 col-sm-offset-1">
                <h2 class="module-title font-alt " style="color: #9a9696; text-align: inherit; position:absolute" >게시글 등록</h2>
                <div class="module-subtitle font-serif"></div>              
              </div>
:
                  
            
                  
              <div class="col-sm-8 col-sm-offset-1"> 
                <form id="contactForm" style="width: 500px" role="form" method="post" action="php/contact.php">



                  <div class="form-group">
                    <select class="form-control" name="category"  style="width: 216px">
                    <option selected="selected">카테고리를 선택해주세요.</option>
                     <!-- <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>캠핑리포트</option> -->
                    <option >캠핑리포트</option>
                      <!-- <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>캠핑노하우</option> -->
                    <option >캠핑노하우</option>
                      <!-- <option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>추억한컷</option> -->
                    <option >추억한컷</option>
                      <!-- <option value="3"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내캠핑기록</option> -->
                    <option >내캠핑기록</option>
                      <!-- <option value="4"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>캠핑지식인</option> -->
                    <option >캠핑지식인</option>  
                    </select>
                  </div>    

                  <div class="form-group">
                    <label class="sr-only" for="title">제목</label>
                    <input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력해주세요." required="required" data-validation-required-message="Please enter your name."/>
                    <p class="help-block text-danger"></p>
                  </div>

                  <div class="form-group">
                    <label class="sr-only" for="content">내용</label>
                    <input class="form-control" type="text" id="content" name="content" placeholder="내용을 입력해주세요." required="required" style="height: 514px" data-validation-required-message="Please enter your email address."/>
                    <p class="help-block text-danger"></p>
                  </div>

                  <div class="form-group">
                    <label class="sr-only" for="hashtag">해시태그</label>
                    <input class="form-control" type="text" rows="7" id="hashtag" name="hashtag" placeholder="태그를 입력해주세요(최대3개)" required="required" data-validation-required-message="Please enter your message."></input>
                    <p class="help-block text-danger"></p>
                  </div>
                  
                  <div class="camera-video">     
                             
	                  <div class="camera-box">	
	                  
	                   	 <button type="button" class="btn btn-outline-dark" style="background-color: white; padding-left: 0px; padding-right: 0px;"">					                
	                     <div class="camera-btn" style="width: 100px;  border: 1px solid;  border-radius: 20px;   margin-bottom : 5px;  text-color : #EAEAEA;">                  
	                      	<svg xmlns="http://www.w3.org/2000/svg" class="bi bi-camera" width="16" height="16" fill="currentColor" class="bi bi-camera" viewBox="0 0 16 16">
		                       <path d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z"/>
		                       <path d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
	                        </svg>
	                    </div>사진등록
	                    </button>
						<input type="file" id="inputImgs" name="inputImgs" multiple />  
	                  </div>
	                  
	                  
	                  
	                  
	                 <div>
								<div class="imgsWrap">
								<c:if test="${!empty auctionProduct.productImg1}">
									<a href="javascript:void(0);" onclick="deleteImageAction(0)" id="imgId0">
										<img id="productImg1" src="" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg2}">
									<a href="javascript:void(0);" onclick="deleteImageAction(1)" id="imgId1">
										<img id="productImg2" src="" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg3}">
									<a href="javascript:void(0);" onclick="deleteImageAction(2)" id="imgId2">
										<img id="productImg3" src="" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg4}">
									<a href="javascript:void(0);" onclick="deleteImageAction(3)" id="imgId3">
										<img id="productImg4" src="" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg5}">
									<a href="javascript:void(0);" onclick="deleteImageAction(4)" id="imgId4">
										<img id="productImg5" src="" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								</div>
					</div> 
	                  
	                  
	                  
	                  
	                  
	      
	                  <div class="camera-box">
	                  
	        			 <button type="button" class="btn btn-outline-dark" style="background-color: white; padding-left: 0px; padding-right: 0px;"">
							<div class="video-btn" style="width: 100px;  border: 1px solid;  border-radius: 20px;   margin-bottom : 5px;  text-color : #EAEAEA;">
   								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-video" viewBox="0 0 16 16">
  								<path fill-rule="evenodd" d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2V5zm11.5 5.175 3.5 1.556V4.269l-3.5 1.556v4.35zM2 4a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h7.5a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1H2z"></path>
							    </svg>
							</div>동영상등록
						</button>
	                  </div>

                  </div>
                  
                  
                  <div class="text-center">
                    <button class="btn btn-block btn-round btn-d" id="postsubmit" type="submit">등 록</button>
                  </div>

                </form>
                </div>
            </div>
          </div>
        </section>

        
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
    <script src="../../resources/lib/owl-carousel/owl.carousel.min.js"></script>
    <script src="../../resources/lib/smoothscroll.js"></script>
    <script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
    <script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../../resources/js/plugins.js"></script>
    <script src="../../resources/js/main.js"></script>
    
    <script>
    
	$("#postsubmit").on('click',function(){
			
		var hashtags = $('#hashtag').val().split('#');
		var tagCount = hashtags.length;
		
		if(hashtags.length >  4){
			alert("해시태그는 최대 3개 까지 등록 가능합니다.");
			$('#hashtag').focus();
			return;
		}else{			
			dataSet(imgCount, tagCount, hashtags);
		}
		
		$('form').attr('method','post').attr('action','/auction/addPost').attr("enctype","multipart/form-data").submit();
	});    
    
    
		function dataSet(imgCount, tagCount, hashtags){
			
			switch (imgCount) {
			  case 1 :
			      $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
			      break;
			  case 2:
				  $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
				  $('#inputImg2').val($($('.selProductFile')[1]).attr('data-file'));
				  break;
			  case 3:
				  $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
				  $('#inputImg2').val($($('.selProductFile')[1]).attr('data-file'));
				  $('#inputImg3').val($($('.selProductFile')[2]).attr('data-file'));
			      break;
			  case 4:
				  $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
				  $('#inputImg2').val($($('.selProductFile')[1]).attr('data-file'));
				  $('#inputImg3').val($($('.selProductFile')[2]).attr('data-file'));
				  $('#inputImg4').val($($('.selProductFile')[3]).attr('data-file'));
				  break;
			  case 5:
				  $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
				  $('#inputImg2').val($($('.selProductFile')[1]).attr('data-file'));
				  $('#inputImg3').val($($('.selProductFile')[2]).attr('data-file'));
				  $('#inputImg4').val($($('.selProductFile')[3]).attr('data-file'));
				  $('#inputImg5').val($($('.selProductFile')[4]).attr('data-file'));
				  break;
			}
			
			switch(tagCount){
				case 2 :
					$('#hashtag1').val("#"+hashtags[1]);
			      break;
			  	case 3:
				  	$('#hashtag1').val("#"+hashtags[1]);
				  	$('#hashtag2').val("#"+hashtags[2]);
				  break;
			 	case 4:
				  	$('#hashtag1').val("#"+hashtags[1]);
					$('#hashtag2').val("#"+hashtags[2]);
					$('#hashtag3').val("#"+hashtags[3]);
			      break;
			}
			
		}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    </script>
    
    
    
    
  </body>
</html>