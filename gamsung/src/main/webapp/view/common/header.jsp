<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  /////////////////////////jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<head>
    <meta charset="UTF-8"> 
</head>

<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="/">Gamsung</a>
    </div>
    <div class="collapse navbar-collapse" id="custom-collapse">
      <ul class="nav navbar-nav navbar-right">    
          
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Camping</a>
          <ul class="dropdown-menu">
            <li><a href="/campGeneral/campSearch" >Camping Search</a></li>
            <li><a href="/campGeneral/campDetailSearch" >Camping DetailSearch</a></li>           
          </ul>
        </li>
        
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">CampBusiness</a>
          <ul class="dropdown-menu">
           	<li><a href="/campBusiness/goSubMainCampBusiness">CampBusinessMain</a></li>        	      
          </ul>
        </li>
      
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Payment</a>
          <ul class="dropdown-menu">
          	<li><a href="/payment/managePoint">ManagePoint</a></li>
           	<br>
           	<li><a href="/payment/listPaymentCode">PaymentCode</a></li>
           	<br>
           	<li><a href="/payment/addMakePayment">MakePayment</a></li>
           	<li><a href="/payment/addRefundPayment">RefundPayment</a></li>
           	<li><a href="/payment/listPayment">listPayment</a></li>
           	<br>
           	<li><a href="/payment/listSiteProfit">SiteProfit</a></li>          	      
          </ul>
        </li>

        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">중고상품</a>

          <ul class="dropdown-menu">
            <li><a href="/auction/addAuctionProduct" >상품 등록</a></li>
            <li><a href="/auction/listWaitAuctionProduct" >경매 진행 전</a></li>
            <li><a href="/auction/listAuctionProduct" >경매 진행 중</a></li>
          </ul>
        </li>
        
        <li class="dropdown"><a class="dropdown-toggle" href="/community/listCommunity" data-toggle="dropdown">커뮤니티</a>
        	<ul class="dropdown-menu">
				<li><a href="/community/listCommunity">커뮤니티</a></li>
			</ul>
        </li>
               
        <li class="dropdown"><a class="dropdown-toggle" href="/servicecenter/home" data-toggle="dropdown">고객센터</a>
        	<ul class="dropdown-menu">
				<li><a href="/servicecenter/home">고객센터</a></li>
			</ul>
        </li>
    
        <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Portfolio</a>
          <ul class="dropdown-menu" role="menu">
            <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Boxed</a>
              <ul class="dropdown-menu">
              	<li><a href="login_register.html">Login / Register</a></li>
           		<li><a href="faq.html">FAQ</a></li>
           		<li><a href="404.html">Page 404</a></li>
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

        <li><a href="/view/user/tempLogin.jsp">
	       <button class="btn btn-border-w btn-round btn-xs" type="button">LOGIN</button>
        </a>
        </li>
        </c:if>
        </ul>
    </div>
  </div>
</nav>

 <script type="text/javascript">
    //============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#logout").on("click" , function() {
		 		//$(self.location).attr("href","/user/logout");
				self.location = "/user/logout"
			}); 
		 });	
</script> 
