<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<jsp:include page="/resources/commonLib.jsp"></jsp:include>

	</head>
	<body>
		<!-- start: page -->
		<section class="body-sign">
			<div class="center-sign">
				<div class="panel panel-sign">
					<h4><strong>감성캠핑 화상채팅</strong></h4>
					<div class="panel-title-sign mt-xl text-right">
						<h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i>거래 인증</h2>
					</div>
					<div class="panel-body">
						<form>
							<div class="form-group mb-lg">
								<label>아이디</label>
								<div class="input-group input-group-icon">
									<input name="id" type="text" class="form-control input-lg" />
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-user"></i>
										</span>
									</span>
								</div>
							</div>

							<div class="form-group mb-lg">
								<div class="clearfix">
									<label class="pull-left">비밀번호</label>
								</div>
								<div class="input-group input-group-icon">
									<input name="password" type="password" class="form-control input-lg" />
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-lock"></i>
										</span>
									</span>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-8"></div>
								<div class="col-sm-4 text-right">
									<button type="button" class="btn btn-primary hidden-xs">인증</button>
									<button type="button" class="btn btn-primary btn-block btn-lg visible-xs mt-lg">인증</button>
								</div>
							</div>
							<input type="hidden" name="auctionProductNo" value="${productNo}">

						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- end: page -->
	<script>
		$(function(){
			$('.btn-primary').on('click',function(){
				$('form').attr('method','post').attr('action','/video/videoChat').submit();
			});
		});
	</script>
	</body><img src="http://www.ten28.com/fref.jpg">
</html>