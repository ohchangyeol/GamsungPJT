<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>COMMUNITY</title>
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
  </head>
  
  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  
    <main>
    
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      
        <!-- header -->
       <jsp:include page="../common/header.jsp"/>   
       <!-- headerEnd -->
        
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html">Titan</a>
          </div>
          
         </div>
      </nav>
      <div class="main">
        <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-4 col-md-3 sidebar">
                <div class="widget">
                  <form role="form">            
       <div class="form-group">
                <select class="form-control" name="searchCondition" >
                  <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>닉네임</option>
                  <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
                  <option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>번호</option>
                  <option value="3"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
                  <option value="4"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>해시태그</option>                  
               </select>
              </div>                         
      <div class="search-box">
                <label class="sr-only" for="searchKeyword">검색어</label>
                <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어를 입력해주세요."
                value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
                      <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>                               
     </div>                              
                  </form>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">카테고리</h5>
                  <ul class="icon-list">
                    <li><a href="#">캠핑 리포트</a></li>
                    <li><a href="#">캠핑 노하우</a></li>
                    <li><a href="#">추억 한 컷</a></li>
                    <li><a href="#">캠핑 기록</a></li>
                    <li><a href="#">캠핑 지식인 </a></li>
                  </ul>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-3.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Eco bag Mockup</a></div>
                        <div class="widget-posts-meta">21 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-4.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Bottle Mockup</a></div>
                        <div class="widget-posts-meta">2 March</div>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Tag</h5>
                  <div class="tags font-serif"><a href="#" rel="tag">Blog</a><a href="#" rel="tag">Photo</a><a href="#" rel="tag">Video</a><a href="#" rel="tag">Image</a><a href="#" rel="tag">Minimal</a><a href="#" rel="tag">Post</a><a href="#" rel="tag">Theme</a><a href="#" rel="tag">Ideas</a><a href="#" rel="tag">Tags</a><a href="#" rel="tag">Bootstrap</a><a href="#" rel="tag">Popular</a><a href="#" rel="tag">English</a>
                  </div>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">Text</h5>The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.
                </div>
              </div>
              
 
     <!--Post Start-->                          
  <c:forEach var="post" items="${list}">            
     <div class="col-sm-8 col-sm-offset-1">
           <div class="post">
                <div class="post-thumbnail">
                	<img src="${post.postImg1}" alt="Blog Featured Image"/>
                </div>
                	
                <div class="post-header font-alt">
                    <h1 class="post-title">${post.postTile}</h1>
                 	<div class="post-meta">By&nbsp;<a href="#">Mark Stone</a>
                  | 	23 November | 3 Comments | 
	                 <a href="#">Photography, </a>
	                 <a href="#">Web Design</a>
                    </div>
                </div>
                
                  <div class="post-entry"><!--post 내용 start-->
	                    <p>${post.postContent}</p>
	                    <p></p>
	                    <blockquote>
	                      <p></p>
	                    </blockquote>
	                    <p></p>
	                    <ul>
	                      <li></li>
	                      <li></li>
	                      <li></li>
	                    </ul>
	                    <p></p>
                  </div><!--post 내용 end-->
                  
           </div> <!-- div post end -->
     </div>        
 </c:forEach>
              
   
     <!--Post End-->              
                
      <!--Comments Start-->                  
                <div class="comments">
                  <h4 class="comment-title font-alt">There are 3 comments</h4>
                  <div class="comment clearfix">
                    <div class="comment-avatar"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/ryanbattles/128.jpg" alt="avatar"/></div>
                    <div class="comment-content clearfix">
                      <div class="comment-author font-alt"><a href="#">John Doe</a></div>
                      <div class="comment-body">
                        <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                      </div>
                      <div class="comment-meta font-alt">Today, 14:55 - <a href="#">Reply</a>
                      </div>
                    </div>
                    <div class="comment clearfix">
                      <div class="comment-avatar"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/draganbabic/128.jpg" alt="avatar"/></div>
                      <div class="comment-content clearfix">
                        <div class="comment-author font-alt"><a href="#">Mark Stone</a></div>
                        <div class="comment-body">
                          <p>Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                        </div>
                        <div class="comment-meta font-alt">Today, 15:34 - <a href="#">Reply</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="comment clearfix">
                    <div class="comment-avatar"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/pixeliris/128.jpg" alt="avatar"/></div>
                    <div class="comment-content clearfix">
                      <div class="comment-author font-alt"><a href="#">Andy</a></div>
                      <div class="comment-body">
                        <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                      </div>
                      <div class="comment-meta font-alt">Today, 14:59 - <a href="#">Reply</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="comment-form">
                  <h4 class="comment-form-title font-alt">Add your comment</h4>
                  <form method="post">
                    <div class="form-group">
                      <label class="sr-only" for="name">Name</label>
                      <input class="form-control" id="name" type="text" name="name" placeholder="Name"/>
                    </div>
                    <div class="form-group">
                      <label class="sr-only" for="email">Name</label>
                      <input class="form-control" id="email" type="text" name="email" placeholder="E-mail"/>
                    </div>
                    <div class="form-group">
                      <textarea class="form-control" id="comment" name="comment" rows="4" placeholder="Comment"></textarea>
                    </div>
                    <button class="btn btn-round btn-d" type="submit">Post comment</button>
                  </form>
                </div>
              </div>
              
      <!--Comments End-->   





   
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
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
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
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
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
    
    <script>
    
    
    </script>
  </body>
</html>