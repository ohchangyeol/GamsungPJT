<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- <html>
<body>
<h2>Hello World!</h2>

 	<br>
 	<br>
 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<a href="./view/campbusiness/campBusinessMain.jsp">Camping Business Test Main</a>

</body>
</html> -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
    <title>Christmas - Responsive HTML5 Template</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="#" type="image/x-icon" />
    <link rel="apple-touch-icon" href="#" />

	<link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/custom.css">
    <link rel="stylesheet" href="resources/css/flashy.min.css">
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/pogo-slider.min.css">
    <link rel="stylesheet" href="resources/css/responsive.css">
    <link rel="stylesheet" href="resources/css/responsiveslides.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/timeline.css">     

    
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
   	<script src="resources/javascript/bootstrap.min.js"></script>
	<script src="resources/javascript/contact-form-script.js"></script>
	<script src="resources/javascript/custom.js"></script>
	<script src="resources/javascript/form-validator.min.js"></script>
	<script src="resources/javascript/images-loded.min.js"></script>
	<script src="resources/javascript/isotope.min.js"></script>
	<script src="resources/javascript/jquery.magnific-popup.min.js"></script>
	<script src="resources/javascript/jquery.min.js"></script>
	<script src="resources/javascript/jquery.pogo-slider.min.js"></script>
	<script src="resources/javascript/popper.min.js"></script>
	<script src="resources/javascript/responsiveslides.min.js"></script>
	<script src="resources/javascript/slider-index.js"></script>
	<script src="resources/javascript/smoothscroll.js"></script>
	
	
</head>
<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">

	<!-- LOADER -->
   <!--  <div id="preloader">
		<div class="loader">
			<div class="box"></div>
			<div class="box"></div>
		</div>
    </div> --><!-- end loader -->
    <!-- END LOADER -->
	
	<jsp:include page="view/common/header.jsp"></jsp:include>
	
	<!-- Start Banner -->
	<div class="ulockd-home-slider">
		<div class="container-fluid">
			<div class="row">
				<div class="pogoSlider" id="js-main-slider">
					<div class="pogoSlider-slide" style="background-image:url(resources/images/감성캠핑.png);"></div>
					<div class="pogoSlider-slide" style="background-image:url(resources/images/감성캠핑.png);"></div>
				</div><!-- .pogoSlider -->
			</div>
		</div>
	</div>
	<!-- End Banner -->
	
	<!-- wish -->
	<div id="wish" class="about-box" style="padding-bottom: 0;">
		<div class="about-a1">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="title-box">
							<h2>Camp</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="row align-items-center about-main-info">
							
							<div class="col-lg-6 col-md-6 col-sm-12 text_align_center">
						      <div class="full">
						      	  <img class="img-responsive" src="resources/images/w1.png" alt="#" />
						      </div>
							</div>

                              <div class="col-lg-6 col-md-6 col-sm-12">
								<h2><img style="width: 60px;" src="resources/images/head_s.png" alt="#" /> 여기 캠핑장 구역</h2>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the when an unknown..</p>
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi.</p>
								<a href="#" class="hvr-radial-out button-theme">Read More</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div> 
		<div class="about-a1" style="background:#f7f7f7;margin-top: 50px;padding-top: 75px;padding-bottom: 50px;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="row align-items-center about-main-info">
						
                            <div class="col-lg-6 col-md-6 col-sm-12">
								<h2><img style="width: 60px;" src="resources/images/head_s.png" alt="#" />Q&A</h2>
								<a href="#" class="hvr-radial-out button-theme">목록보기</a>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-12 text_align_center">
						        <h2><img style="width: 60px;" src="resources/images/head_s.png" alt="#" />공지사항</h2>
						        <a href="#" class="hvr-radial-out button-theme">목록보기</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- wish us -->
	
	<!-- best deals -->
	<div id="b-deals" class="services-box main-timeline-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-box">
						<h2>Auction</h2>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-6 col-sm-6">
					<figure class="effect-service">
						<img src="resources/images/d1.png" alt="" />
						<figcaption>
							<h2>Deal One</h2>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
							<a href="#">View more</a>
						</figcaption>
					</figure>
				</div>
				<div class="col-lg-6 col-sm-6">
					<figure class="effect-service">
						<img src="resources/images/d2.png" alt="" />
						<figcaption>
							<h2>Deal Two</h2>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
							<a href="#">View more</a>
						</figcaption>
					</figure>
				</div>
				<div class="col-lg-6 col-sm-6">
					<figure class="effect-service">
						<img src="resources/images/d3.png" alt="" />
						<figcaption>
							<h2>Deal Three</h2>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
							<a href="#">View more</a>
						</figcaption>
					</figure>
				</div>
				<div class="col-lg-6 col-sm-6">
					<figure class="effect-service">
						<img src="resources/images/d4.png" alt="" />
						<figcaption>
							<h2>Deal Four</h2>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
							<a href="#">View more</a>
						</figcaption>
					</figure>
				</div>
				
			</div>
			
		</div>
	</div>
	<!-- best deals -->

	<!-- donate -->
	<div id="donate" class="gallery-box" style="background: #f7f7f7;"> 
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-box">
						<h2>Community</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<ul class="popup-gallery clearfix">
					<li>
						<a href="resources/images/d1.png">
							<img class="img-fluid" src="resources/images/d1.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
					<li>
						<a href="resources/images/d2.png">
							<img class="img-fluid" src="resources/images/d2.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
					<li>
						<a href="resources/images/d3.png">
							<img class="img-fluid" src="resources/images/d3.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
					<li>
						<a href="resources/images/d4.png">
							<img class="img-fluid" src="resources/images/d4.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
					<li>
						<a href="resources/images/d1.png">
							<img class="img-fluid" src="resources/images/d1.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
					<li>
						<a href="resources/images/d2.png">
							<img class="img-fluid" src="resources/images/d2.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
					<li>
						<a href="images/d3.png">
							<img class="img-fluid" src="resources/images/d3.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
					<li>
						<a href="images/d4.png">
							<img class="img-fluid" src="resources/images/d4.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
					<li>
						<a href="images/d1.png">
							<img class="img-fluid" src="resources/images/d1.png" alt="single image">
							<span class="overlay"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- end donate -->
	
	<!-- testimonial -->
	<div id="testi" class="gallery-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-box">
						<h2>Testimonial</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 offset-md-2 col-10 offset-1 testimonial_slider">
                    <div id="client_slider" class="carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                        <li data-target="#client_slider" data-slide-to="0" class="active"></li>
                        <li data-target="#client_slider" data-slide-to="1"></li>
                      </ol>
                      <div class="carousel-inner">
                        <div class="carousel-item text-center active">
                            <div class="testimonial_img">
                                <img width="150" height="150" class="d-block rounded-circle" src="http://nicesnippets.com/demo/profile-1.jpg" alt="First slide">
                            </div>
                            <h5 class="mt-4 mb-0"><strong class="text-uppercase" style="color: #e91327;padding-bottom: 0;">Harry Mike</strong></h5>
                            <p class="m-0 pt-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at, luctus dui. Mauris magna metus, dapibus nec turpis vel, semper malesuada ante. Idac bibendum scelerisque non non purus. Suspendisse varius nibh non aliquet.</p>
                        </div>
                        <div class="carousel-item text-center">
                            <div class="testimonial_img">
                                <img width="150" height="150" class="d-block rounded-circle" src="http://nicesnippets.com/demo/profile-3.jpg" alt="First slide">
                            </div>
                            <h5 class="mt-4 mb-0"><strong class="text-uppercase" style="color: #e91327;padding-bottom: 0;">Jonh Max</strong></h5>
                            <p class="m-0 pt-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at, luctus dui. Mauris magna metus, dapibus nec turpis vel, semper malesuada ante. Idac bibendum scelerisque non non purus. Suspendisse varius nibh non aliquet.</p>
                        </div>
                      </div>
                    </div>
                </div>  
			</div>
		</div>
	</div>
	<!-- end testimonial -->
	
	
	<!-- contact -->
	<div id="contact" class="contact-box" style="background: #f7f7f7;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-box">
						<h2>Contact us</h2>
					</div>
				</div>
			</div>
			<div class="row">
				
				<div class="col-lg-7 col-sm-7 col-xs-12">
				  <div class="contact-block">
					<form id="contactForm">
					  <div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required data-error="Please enter your name">
								<div class="help-block with-errors"></div>
							</div>                                 
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" placeholder="Your Email" id="email" class="form-control" name="name" required data-error="Please enter your email">
								<div class="help-block with-errors"></div>
							</div> 
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<input type="text" placeholder="Your number" id="number" class="form-control" name="number" required data-error="Please enter your number">
								<div class="help-block with-errors"></div>
							</div> 
						</div>
						<div class="col-md-12">
							<div class="form-group"> 
								<textarea class="form-control" id="message" placeholder="Your Message" rows="8" data-error="Write your message" required></textarea>
								<div class="help-block with-errors"></div>
							</div>
							<div class="submit-button text-center">
								<button class="btn btn-common" id="submit" type="submit">Send Message</button>
								<div id="msgSubmit" class="h3 text-center hidden"></div> 
								<div class="clearfix"></div> 
							</div>
						</div>
					  </div>            
					</form>
				  </div>
				</div>


				<div class="col-lg-5 col-sm-5 col-xs-12">
					<div class="left-contact">
						<div class="media cont-line">
							<div class="media-left icon-b">
								<i class="fa fa-location-arrow" aria-hidden="true"></i>
							</div>
							<div class="media-body dit-right">
								<h4>Address</h4>
								<p>Fleming 196 Woodside Circle Mobile, FL 36602</p>
							</div>
						</div>
						<div class="media cont-line">
							<div class="media-left icon-b">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</div>
							<div class="media-body dit-right">
								<h4>Email</h4>
								<a href="#">demoinfo@gmail.com</a><br>
								<a href="#">demoinfo@gmail.com</a>
							</div>
						</div>
						<div class="media cont-line">
							<div class="media-left icon-b">
								<i class="fa fa-volume-control-phone" aria-hidden="true"></i>
							</div>
							<div class="media-body dit-right">
								<h4>Phone Number</h4>
								<a href="#">12345 67890</a><br>
								<a href="#">12345 67890</a>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<!-- end contact -->
	
	<!-- Start Subscribe -->
	<div class="subscribe-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="subscribe-inner text-center clearfix">
						<h2>Subscribe</h2>
						<form action="#" method="post">
							<div class="form-group">
								<input class="form-control-1" id="email-1" name="email" placeholder="Email Address" required="" type="text">
							</div>
							<div class="form-group">
								<button type="submit" class="hvr-radial-out">
									Subscribe
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Subscribe -->
	
	<!-- Start Footer -->
	<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p class="footer-company-name">All Rights Reserved. &copy; 2018 <a href="#">Evento Christmas</a> Design By : <a href="https://html.design/">html design</a></p>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->
	
	<a href="#" id="scroll-to-top" class="hvr-radial-out"><i class="fa fa-angle-up"></i></a>

	<!-- ALL JS FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
	<script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.pogo-slider.min.js"></script> 
	<script src="js/slider-index.js"></script>
	<script src="js/smoothscroll.js"></script>
	<script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
	<script src="js/isotope.min.js"></script>	
	<script src="js/images-loded.min.js"></script>	
    <script src="js/custom.js"></script>
</body>
</html>
