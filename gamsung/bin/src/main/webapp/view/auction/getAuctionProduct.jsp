<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${auctionProduct.auctionProductName}</title>

<link rel="apple-touch-icon" sizes="57x57"
	href="../../resources/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="../../resources/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="../../resources/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="../../resources/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="../../resources/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="../../resources/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="../../resources/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="../../resources/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="../../resources/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="../../resources/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../../resources/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="../../resources/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../../resources/images/favicons/favicon-16x16.png">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="../../resources/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

<link href="../../resources/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="../../resources/lib/animate.css/animate.css"
	rel="stylesheet">
<link
	href="../../resources/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../resources/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link href="../../resources/lib/flexslider/flexslider.css"
	rel="stylesheet">
<link
	href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="../../resources/lib/magnific-popup/magnific-popup.css"
	rel="stylesheet">
<link
	href="../../resources/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="../../resources/css/style.css" rel="stylesheet">
<link id="color-scheme" href="../../resources/css/colors/default.css"
	rel="stylesheet">

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="main">
			<div class="alert alert-success" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-cog fa-spin"></i><strong></strong></div>
			<div class="alert alert-info" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-cutlery"></i><strong></strong></div>
			<div class="alert alert-warning" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-diamond"></i><strong></strong></div>
			<div class="alert alert-danger" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-coffee"></i><strong></strong> </div>
			<section class="module">
				<div class="container">
					<div class="col-sm-2"></div>
					<div class="col-sm-8"><h1 class="product-title">${auctionProduct.auctionProductName}</h1></div>
					<div class="col-sm-2"></div>
					<div class="row">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<img src="${auctionProduct.productImg1}" alt="Single Product Image" />
							<div class="product-gallery">
							<c:if test="${!empty auctionProduct.productImg2}">
								<img src="${auctionProduct.productImg2}" alt="Single Product" />
							</c:if>
							<c:if test="${!empty auctionProduct.productImg3}">
								<img src="${auctionProduct.productImg3}" alt="Single Product" />
							</c:if>
							<c:if test="${!empty auctionProduct.productImg4}">
								<img src="${auctionProduct.productImg4}" alt="Single Product" />
							</c:if>
							<c:if test="${!empty auctionProduct.productImg5}">
								<img src="${auctionProduct.productImg5}" alt="Single Product" />
							</c:if>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="row">
							</div>
							<div class="row mb-20">
								<div class="col-sm-12">
									<span><i class="fa fa-star star"></i></span><span><i
										class="fa fa-star star"></i></span><span><i
										class="fa fa-star star"></i></span><span><i
										class="fa fa-star star"></i></span><span><i
										class="fa fa-star star-off"></i></span><a
										class="open-tab section-scroll" href="#reviews"></a>
								</div>
							</div>
							<div class="row mb-20">
								<div class="col-sm-12">
									<div class="price font-alt">
										<a>시작가 : ${auctionProduct.startBidPrice}원</a><br>
										<a>희망 낙찰가 : ${auctionProduct.hopefulBidPrice}원</a><br>
										<a>입찰 단위 : ${auctionProduct.bidUnit}원</a><br>
										<input type="hidden" id="bidUnit" value="${auctionProduct.bidUnit}">
										<a>입찰 가능 등급 : ${auctionProduct.bidableGrade}LV 이상</a><br><br>
										<input type="hidden" id="bidableGrade" value="${auctionProduct.bidableGrade}">
									</div>
								</div>
							</div>
							<div class="row mb-20">
								<div class="col-sm-12">
									<div class="description">
										<span class="amount">현재입찰가 : </span>
										
									</div>
								</div>
							</div>
							<div class="row mb-20">
								<div class="col-sm-8 mb-sm-20">
									<input id="bidPrice" class="form-control input-lg" type="number" name="" value="1" max="40" min="1" required="required" width="100%"/>
								</div>
							</div>
							<div class="row mb-20">
								<div class="col-sm-8">
									<a id="bidBtn" class="btn btn-lg btn-block btn-round btn-b">입찰</a>
									<input type="hidden" id="auctionProductNo" value="${auctionProduct.auctionProductNo}">
								</div>
							</div>
							<div class="row mb-20">
								<div class="col-sm-12">
									<div class="product_meta">
										Categories:<a href="#"> Man, </a><a href="#">Clothing, </a><a
											href="#">T-shirts</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-70">
						<div class="col-sm-12">
							<ul class="nav nav-tabs font-alt" role="tablist">
								<li class="active"><a href="#description" data-toggle="tab"><span
										class="icon-tools-2"></span>Description</a></li>
								<li><a href="#data-sheet" data-toggle="tab"><span
										class="icon-tools-2"></span>Data sheet</a></li>
								<li><a href="#reviews" data-toggle="tab"><span
										class="icon-tools-2"></span>Reviews (2)</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="description">
									<p>Everyone realizes why a new common language would be
										desirable: one could refuse to pay expensive translators. To
										achieve this, it would be necessary to have uniform grammar,
										pronunciation and more common words. If several languages
										coalesce, the grammar of the resulting language is more simple
										and regular than that of the individual languages.</p>
									<p>The European languages are members of the same family.
										Their separate existence is a myth. For science, music, sport,
										etc, Europe uses the same vocabulary. The languages only
										differ in their grammar, their pronunciation and their most
										common words.</p>
								</div>
								<div class="tab-pane" id="data-sheet">
									<table class="table table-striped ds-table table-responsive">
										<tbody>
											<tr>
												<th>Title</th>
												<th>Info</th>
											</tr>
											<tr>
												<td>Compositions</td>
												<td>Jeans</td>
											</tr>
											<tr>
												<td>Size</td>
												<td>44, 46, 48</td>
											</tr>
											<tr>
												<td>Color</td>
												<td>Black</td>
											</tr>
											<tr>
												<td>Brand</td>
												<td>Somebrand</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="tab-pane" id="reviews">
									<div class="comments reviews">
										<div class="comment clearfix">
											<div class="comment-avatar">
												<img src="" alt="avatar" />
											</div>
											<div class="comment-content clearfix">
												<div class="comment-author font-alt">
													<a href="#">John Doe</a>
												</div>
												<div class="comment-body">
													<p>The European languages are members of the same
														family. Their separate existence is a myth. For science,
														music, sport, etc, Europe uses the same vocabulary. The
														European languages are members of the same family. Their
														separate existence is a myth.</p>
												</div>
												<div class="comment-meta font-alt">
													Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star-off"></i></span>
												</div>
											</div>
										</div>
										<div class="comment clearfix">
											<div class="comment-avatar">
												<img src="" alt="avatar" />
											</div>
											<div class="comment-content clearfix">
												<div class="comment-author font-alt">
													<a href="#">Mark Stone</a>
												</div>
												<div class="comment-body">
													<p>Europe uses the same vocabulary. The European
														languages are members of the same family. Their separate
														existence is a myth.</p>
												</div>
												<div class="comment-meta font-alt">
													Today, 14:59 -<span><i class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star-off"></i></span><span><i
														class="fa fa-star star-off"></i></span>
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
														<label class="sr-only" for="name">Name</label> <input
															class="form-control" id="name" type="text" name="name"
															placeholder="Name" />
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="sr-only" for="email">Name</label> <input
															class="form-control" id="email" type="text" name="email"
															placeholder="E-mail" />
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
														<textarea class="form-control" id="" name="" rows="4"
															placeholder="Review"></textarea>
													</div>
												</div>
												<div class="col-sm-12">
													<button class="btn btn-round btn-d" type="submit">Submit
														Review</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<hr class="divider-w">
			<section class="module-small">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">Related Products</h2>
						</div>
					</div>
					<div class="row multi-columns-row">
						<div class="col-sm-6 col-md-3 col-lg-3">
							<div class="shop-item">
								<div class="shop-item-image">
									<img src="../../resources/images/shop/product-11.jpg"
										alt="Accessories Pack" />
									<div class="shop-item-detail">
										<a class="btn btn-round btn-b"><span class="icon-basket">Add
												To Cart</span></a>
									</div>
								</div>
								<h4 class="shop-item-title font-alt">
									<a href="#">Accessories Pack</a>
								</h4>
								£9.00
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3">
							<div class="shop-item">
								<div class="shop-item-image">
									<img src="../../resources/images/shop/product-12.jpg"
										alt="Men’s Casual Pack" />
									<div class="shop-item-detail">
										<a class="btn btn-round btn-b"><span class="icon-basket">Add
												To Cart</span></a>
									</div>
								</div>
								<h4 class="shop-item-title font-alt">
									<a href="#">Men’s Casual Pack</a>
								</h4>
								£12.00
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3">
							<div class="shop-item">
								<div class="shop-item-image">
									<img src="../../resources/images/shop/product-13.jpg"
										alt="Men’s Garb" />
									<div class="shop-item-detail">
										<a class="btn btn-round btn-b"><span class="icon-basket">Add
												To Cart</span></a>
									</div>
								</div>
								<h4 class="shop-item-title font-alt">
									<a href="#">Men’s Garb</a>
								</h4>
								£6.00
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3">
							<div class="shop-item">
								<div class="shop-item-image">
									<img src="../../resources/images/shop/product-14.jpg"
										alt="Cold Garb" />
									<div class="shop-item-detail">
										<a class="btn btn-round btn-b"><span class="icon-basket">Add
												To Cart</span></a>
									</div>
								</div>
								<h4 class="shop-item-title font-alt">
									<a href="#">Cold Garb</a>
								</h4>
								£14.00
							</div>
						</div>
					</div>
				</div>
			</section>
			<hr class="divider-w">
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">Exclusive products</h2>
							<div class="module-subtitle font-serif">The languages only
								differ in their grammar, their pronunciation and their most
								common words.</div>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5"
							data-pagination="false" data-navigation="false">
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-1.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										£12.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-3.jpg"
											alt="Derby shoes" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Derby shoes</a>
										</h4>
										£54.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-2.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										£19.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-4.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										£14.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-5.jpg"
											alt="Chelsea boots" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Chelsea boots</a>
										</h4>
										£44.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-6.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										£19.00
									</div>
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
								<p>The languages only differ in their grammar, their
									pronunciation and their most common words.</p>
								<p>Phone: +1 234 567 89 10</p>
								Fax: +1 234 567 89 10
								<p>
									Email:<a href="#">somecompany@example.com</a>
								</p>
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
										<div class="widget-posts-image">
											<a href="#"><img src="../../resources/images/rp-1.jpg"
												alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Designer Desk Essentials</a>
											</div>
											<div class="widget-posts-meta">23 january</div>
										</div>
									</li>
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img src="../../resources/images/rp-2.jpg"
												alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Realistic Business Card Mockup</a>
											</div>
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
							<p class="copyright font-alt">
								&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights
								Reserved
							</p>
						</div>
						<div class="col-sm-6">
							<div class="footer-social-links">
								<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
									class="fa fa-twitter"></i></a><a href="#"><i
									class="fa fa-dribbble"></i></a><a href="#"><i
									class="fa fa-skype"></i></a>
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="../../resources/lib/jquery/jquery.js"></script>
	<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resources/lib/wow/wow.js"></script>
	<script
		src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
	<script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../../resources/lib/smoothscroll.js"></script>
	<script
		src="../../resources/lib/magnific-popup/jquery.magnific-popup.js"></script>
	<script
		src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../../resources/js/plugins.js"></script>
	<script src="../../resources/js/main.js"></script>
	
	<script>
	var socket = null;
	function connect(){
		
		var auctionProductNo = $('#auctionProductNo').val();
		
		var ws = new WebSocket("ws://localhost:8080/");
		socket = ws;
		
		ws.onopen = function() {
			console.log('info : connection opened');
		};
		
		ws.onmessage = function(event){
			console.log(event.date+'\n');
		};
		
		ws.onclose = function(event){
			console.log('info : connection closed');
			/* setTimeout(function(){
				connect();
			}, 1000); //retry connection */
		};
		
		ws.onerror = function(error){
			console.log('error : ',error);
		};
		
	}
		
	$('#bidBtn').on('click',function(event){
		
		var bidUnit = $('#bidUnit').val();
		var bidPrice = $('#bidPrice').val();
		if(bidPrice%bidUnit != 0){
			$('.alert-danger').children('strong').text('입찰 단위를 확인해 주세요.');
			$('.alert-danger').attr('hidden',false);
		}else{
			$('.alert-success').children('strong').text('입찰 성공하셨습니다.');
			$('.alert-danger').attr('hidden',true);
			$('.alert-success').attr('hidden',false);
		}
		
		event.preventDefault();
		if(socket.readyState !== 1){
			return;
		}
		socket.send(bidPrice);
	});
	
	connect();
	
	</script>
</body>
</html>