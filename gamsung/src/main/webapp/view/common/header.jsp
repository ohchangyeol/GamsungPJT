<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  /////////////////////////jQuery CDN ////////////////////////// -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->

<head>
    <meta charset="UTF-8">
    
   <!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="../../resources/lib/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="../../resources/lib/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="../../resources/lib/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="../../resources/lib/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="../../resources/lib/pnotify/pnotify.custom.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="../../resources/css/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="../../resources/css/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="../../resources/css/theme-custom.css">

		<!-- Head Libs -->
		<script src="../../resources/lib/modernizr/modernizr.js"></script>
		
		  <!-- Vendor -->
		 
		<script src="../../resources/lib/flot/jquery.js"></script>
		<script src="../../resources/lib/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="../../resources/lib/bootstrap/js/bootstrap.js"></script>
		<script src="../../resources/lib/nanoscroller/nanoscroller.js"></script>
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
		<script src="../../resources/js/ui-elements/examples.modals.js"></script>
		
		 
		 
		<script src="../../resources/lib/bootStrap/js/bootstrap.js"></script>
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
		
		<script src="../../resources/lib/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="../../resources/lib/bootStrap/js/bootstrap.js"></script>		
		<script src="../../resources/lib/nanoscroller/nanoscroller.js"></script>
		<script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
		<script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
		<script src="../../resources/lib/pnotify/pnotify.custom.js"></script>
		<script src="../../resources/js/theme.js"></script>
		<script src="../../resources/js/theme.custom.js"></script>
		<script src="../../resources/js/theme.init.js"></script>
		<script src="../../resources/js/ui-elements/examples.modals.js"></script>
     
</head>

 <script type="text/javascript">
    //============= logout Event =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#logout").on("click" , function() {
		 		//$(self.location).attr("href","/user/logout");
				self.location = "/user/logout"
			}); 
		 });	
   
</script> 

<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="/">Gamsung</a>
    </div>
    <div class="collapse navbar-collapse" id="custom-collapse">
      <ul class="nav navbar-nav navbar-right">    
      
      	<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">MilkyWay</a>
          <ul class="dropdown-menu">
           	<li><a href="/campBusiness/goSubMainCampBusiness">CampBusinessMain</a></li>
            <li><a href="index_op_fullscreen_gradient_overlay.html">Payment</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Camping</a>
          <ul class="dropdown-menu">

            <li><a href="/campGeneral/campSearch" >Camping Search</a></li>
            <li><a href="/campGeneral/campDetailSearch" >Camping DetailSearch</a></li>

        
            <li><a href="index_mp_fullscreen_video_background.html">Default</a></li>
            <li><a href="index_op_fullscreen_gradient_overlay.html">One Page</a></li>
            <li><a href="index_agency.html">Agency</a></li>
            <li><a href="index_portfolio.html">Portfolio</a></li>
            <li><a href="index_restaurant.html">Restaurant</a></li>
            <li><a href="index_finance.html">Finance</a></li>
            <li><a href="index_landing.html">Landing Page</a></li>
            <li><a href="index_photography.html">Photography</a></li>
            <li><a href="/servicecenter/home">고객센터</a></li>

          </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">중고상품</a>

          <ul class="dropdown-menu">
            <li><a href="/auction/addAuctionProduct" >상품 등록</a></li>
            <li><a href="/auction/listWaitAuctionProduct" >경매 진행 전</a></li>
            <li><a href="/auction/listAuctionProduct" >경매 진행 중</a></li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Text Rotator Header</a>
              <ul class="dropdown-menu">
                <li><a href="index_mp_fullscreen_text_rotator.html">Fulscreen</a></li>
                <li><a href="index_mp_classic_text_rotator.html">Classic</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Gradient Overlay Header</a>
              <ul class="dropdown-menu">
                <li><a href="index_mp_fullscreen_gradient_overlay.html">Fulscreen</a></li>
                <li><a href="index_mp_classic_gradient_overlay.html">Classic</a></li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Pages</a>
          <ul class="dropdown-menu">
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">About</a>
              <ul class="dropdown-menu">
                <li><a href="about1.html">About 1</a></li>
                <li><a href="about2.html">About 2</a></li>
                <li><a href="about3.html">About 3</a></li>
                <li><a href="about4.html">About 4</a></li>
                <li><a href="about5.html">About 5</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Services</a>
              <ul class="dropdown-menu">
                <li><a href="service1.html">Service 1</a></li>
                <li><a href="service2.html">Service 2</a></li>
                <li><a href="service3.html">Service 3</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Pricing</a>
              <ul class="dropdown-menu">
                <li><a href="pricing1.html">Pricing 1</a></li>
                <li><a href="pricing2.html">Pricing 2</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Gallery</a>
              <ul class="dropdown-menu">
                <li><a href="gallery_col_2.html">2 Columns</a></li>
                <li><a href="gallery_col_3.html">3 Columns</a></li>
                <li><a href="gallery_col_4.html">4 Columns</a></li>
                <li><a href="gallery_col_6.html">6 Columns</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Contact</a>
              <ul class="dropdown-menu">
                <li><a href="contact1.html">Contact 1</a></li>
                <li><a href="contact2.html">Contact 2</a></li>
                <li><a href="contact3.html">Contact 3</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Restaurant menu</a>
              <ul class="dropdown-menu">
                <li><a href="restaurant_menu1.html">Menu 2 Columns</a></li>
                <li><a href="restaurant_menu2.html">Menu 3 Columns</a></li>
              </ul>
            </li>
            <li><a href="login_register.html">Login / Register</a></li>
            <li><a href="faq.html">FAQ</a></li>
            <li><a href="404.html">Page 404</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Portfolio</a>
          <ul class="dropdown-menu" role="menu">
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Boxed</a>
              <ul class="dropdown-menu">
                <li><a href="portfolio_boxed_col_2.html">2 Columns</a></li>
                <li><a href="portfolio_boxed_col_3.html">3 Columns</a></li>
                <li><a href="portfolio_boxed_col_4.html">4 Columns</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Boxed - Gutter</a>
              <ul class="dropdown-menu">
                <li><a href="portfolio_boxed_gutter_col_2.html">2 Columns</a></li>
                <li><a href="portfolio_boxed_gutter_col_3.html">3 Columns</a></li>
                <li><a href="portfolio_boxed_gutter_col_4.html">4 Columns</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Full Width</a>
              <ul class="dropdown-menu">
                <li><a href="portfolio_full_width_col_2.html">2 Columns</a></li>
                <li><a href="portfolio_full_width_col_3.html">3 Columns</a></li>
                <li><a href="portfolio_full_width_col_4.html">4 Columns</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Full Width - Gutter</a>
              <ul class="dropdown-menu">
                <li><a href="portfolio_full_width_gutter_col_2.html">2 Columns</a></li>
                <li><a href="portfolio_full_width_gutter_col_3.html">3 Columns</a></li>
                <li><a href="portfolio_full_width_gutter_col_4.html">4 Columns</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Masonry</a>
              <ul class="dropdown-menu">
                <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Boxed</a>
                  <ul class="dropdown-menu">
                    <li><a href="portfolio_masonry_boxed_col_2.html">2 Columns</a></li>
                    <li><a href="portfolio_masonry_boxed_col_3.html">3 Columns</a></li>
                    <li><a href="portfolio_masonry_boxed_col_4.html">4 Columns</a></li>
                  </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Full Width</a>
                  <ul class="dropdown-menu">
                    <li><a href="portfolio_masonry_full_width_col_2.html">2 Columns</a></li>
                    <li><a href="portfolio_masonry_full_width_col_3.html">3 Columns</a></li>
                    <li><a href="portfolio_masonry_full_width_col_4.html">4 Columns</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Hover Style</a>
              <ul class="dropdown-menu">
                <li><a href="portfolio_hover_black.html">Black</a></li>
                <li><a href="portfolio_hover_gradient.html">Gradient</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Single</a>
              <ul class="dropdown-menu">
                <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Featured Image</a>
                  <ul class="dropdown-menu">
                    <li><a href="portfolio_single_featured_image1.html">Style 1</a></li>
                    <li><a href="portfolio_single_featured_image2.html">Style 2</a></li>
                  </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Featured Slider</a>
                  <ul class="dropdown-menu">
                    <li><a href="portfolio_single_featured_slider1.html">Style 1</a></li>
                    <li><a href="portfolio_single_featured_slider2.html">Style 2</a></li>
                  </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Featured Video</a>
                  <ul class="dropdown-menu">
                    <li><a href="portfolio_single_featured_video1.html">Style 1</a></li>
                    <li><a href="portfolio_single_featured_video2.html">Style 2</a></li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Blog</a>
          <ul class="dropdown-menu" role="menu">
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Standard</a>
              <ul class="dropdown-menu">
                <li><a href="blog_standard_left_sidebar.html">Left Sidebar</a></li>
                <li><a href="blog_standard_right_sidebar.html">Right Sidebar</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Grid</a>
              <ul class="dropdown-menu">
                <li><a href="blog_grid_col_2.html">2 Columns</a></li>
                <li><a href="blog_grid_col_3.html">3 Columns</a></li>
                <li><a href="blog_grid_col_4.html">4 Columns</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Masonry</a>
              <ul class="dropdown-menu">
                <li><a href="blog_grid_masonry_col_2.html">2 Columns</a></li>
                <li><a href="blog_grid_masonry_col_3.html">3 Columns</a></li>
                <li><a href="blog_grid_masonry_col_4.html">4 Columns</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Single</a>
              <ul class="dropdown-menu">
                <li><a href="blog_single_left_sidebar.html">Left Sidebar</a></li>
                <li><a href="blog_single_right_sidebar.html">Right Sidebar</a></li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Features</a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="alerts-and-wells.html"><i class="fa fa-bolt"></i> Alerts and Wells</a></li>
            <li><a href="buttons.html"><i class="fa fa-link fa-sm"></i> Buttons</a></li>
            <li><a href="tabs_and_accordions.html"><i class="fa fa-tasks"></i> Tabs &amp; Accordions</a></li>
            <li><a href="content_box.html"><i class="fa fa-list-alt"></i> Contents Box</a></li>
            <li><a href="forms.html"><i class="fa fa-check-square-o"></i> Forms</a></li>
            <li><a href="icons.html"><i class="fa fa-star"></i> Icons</a></li>
            <li><a href="progress-bars.html"><i class="fa fa-server"></i> Progress Bars</a></li>
            <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="/servicecenter/home" data-toggle="dropdown">고객센터</a>
          <ul class="dropdown-menu" role="menu">
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Product</a>
              <ul class="dropdown-menu">
                <li><a href="shop_product_col_3.html">3 columns</a></li>
                <li><a href="shop_product_col_4.html">4 columns</a></li>
              </ul>
            </li>
            <li><a href="shop_single_product.html">Single Product</a></li>
            <li><a href="shop_checkout.html">Checkout</a></li>
          </ul>
        </li>
        <!--li.dropdown.navbar-cart-->
        <!--    a.dropdown-toggle(href='#', data-toggle='dropdown')-->
        <!--        span.icon-basket-->
        <!--        |-->
        <!--        span.cart-item-number 2-->
        <!--    ul.dropdown-menu.cart-list(role='menu')-->
        <!--        li-->
        <!--            .navbar-cart-item.clearfix-->
        <!--                .navbar-cart-img-->
        <!--                    a(href='#')-->
        <!--                        img(src='resources/images/shop/product-9.jpg', alt='')-->
        <!--                .navbar-cart-title-->
        <!--                    a(href='#') Short striped sweater-->
        <!--                    |-->
        <!--                    span.cart-amount 2 &times; $119.00-->
        <!--                    br-->
        <!--                    |-->
        <!--                    strong.cart-amount $238.00-->
        <!--        li-->
        <!--            .navbar-cart-item.clearfix-->
        <!--                .navbar-cart-img-->
        <!--                    a(href='#')-->
        <!--                        img(src='resources/images/shop/product-10.jpg', alt='')-->
        <!--                .navbar-cart-title-->
        <!--                    a(href='#') Colored jewel rings-->
        <!--                    |-->
        <!--                    span.cart-amount 2 &times; $119.00-->
        <!--                    br-->
        <!--                    |-->
        <!--                    strong.cart-amount $238.00-->
        <!--        li-->
        <!--            .clearfix-->
        <!--                .cart-sub-totle-->
        <!--                    strong Total: $476.00-->
        <!--        li-->
        <!--            .clearfix-->
        <!--                a.btn.btn-block.btn-round.btn-font-w(type='submit') Checkout-->
        <!--li.dropdown-->
        <!--    a.dropdown-toggle(href='#', data-toggle='dropdown') Search-->
        <!--    ul.dropdown-menu(role='menu')-->
        <!--        li-->
        <!--            .dropdown-search-->
        <!--                form(role='form')-->
        <!--                    input.form-control(type='text', placeholder='Search...')-->
        <!--                    |-->
        <!--                    button.search-btn(type='submit')-->
        <!--                        i.fa.fa-search-->
        <li class="dropdown"><a class="dropdown-toggle" href="documentation.html" data-toggle="dropdown">Documentation</a>
          <ul class="dropdown-menu">
            <li><a href="documentation.html#contact">Contact Form</a></li>
            <li><a href="documentation.html#reservation">Reservation Form</a></li>
            <li><a href="documentation.html#mailchimp">Mailchimp</a></li>
            <li><a href="documentation.html#gmap">Google Map</a></li>
            <li><a href="documentation.html#plugin">Plugins</a></li>
            <li><a href="documentation.html#changelog">Changelog</a></li>
          </ul>
        </li>
    
         <c:if test="${sessionScope.user.role!=null}">
	      <li><a href="#"><button class="btn btn-border-w btn-round btn-xs" type="button" id="logout">LOGOUT</button></a></li>
	    </c:if>
	     <c:if test="${sessionScope.user.role==null}">
        <!-- <li><a href="/view/user/tempLogin.jsp"> -->
	       <a class="mb-xs mt-xs mr-xs modal-basic btn btn-default" href="#modalBasic">LOGIN</a>
        <!-- </a> </li> -->
        </c:if>
        </ul>
    </div>
  </div>
</nav>
<div id="modalBasic" class="modal-block modal-block-primary mfp mfp-hide">
	<section class="panel">
		<header class="panel-heading">
			<h2 class="panel-title">Are you sure?</h2>
		</header>
			<div class="panel-body">
			<div class="modal-wrapper">
			<div class="modal-text">
				<p>Are you sure that you want to delete this image?</p>
			</div>
	</div>
</div>
		<footer class="panel-footer">
		<div class="row">
			<div class="col-md-12 text-right">
				<button class="btn btn-primary modal-confirm">Confirm</button>
				<button class="btn btn-default modal-dismiss">Cancel</button>
			</div>
		</div>
		</footer>
	</section>
</div>
<!--  
<div id="modalMD" class="modal-block modal-block-md" hidden="hidden">
<div class="modal-dialog modal-dialog-centered">
<div class="mfp-content">
<div class="modal-dialog">
<section class="panel">
<header class="panel-heading">
	</header>
	<div class="panel-body" >
	<form action="" class="was-validated">
	<button class="close" data-dismiss="modal">&times;</button>
		<div class="form-group">
			<label for="userId">아이디 </label>
			<input type="text" class="form-control" id="userId" placeholder="아이디를 입력하세요." name="userId" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>
		<div class="form-group">
			<label for="userPw">비밀번호 </label>
			<input type="password" class="form-control" id="userPw" placeholder="비밀번호를 입력하세요." name="userPw" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>
		<button type="submit" class="btn btn-primary" style="margin-left:50%;">로그인</button>
		<button type="button" class="btn btn-secondary">회원가입</button>
		<img src="../../resources/images/kakao_login_small.png"/>
	</form>
		</div>
			<footer class="panel-footer">
				<div class="row">
					<div class="col-md-12 text-right">
						<button class="btn btn-primary modal-confirm">아이디 찾기</button>
						<button class="btn btn-default modal-dismiss">비밀번호 찾기</button>
					</div>
				</div>
			</footer>
		</section>
		</div>
	</div>
	</div>
	</div>
-->





