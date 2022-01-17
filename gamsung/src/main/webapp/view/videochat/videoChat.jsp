<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화상채팅</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/lib/components-font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../../resources/css/video.css">
<style>

</style>
</head>
<body>
	<main>
	<div class="container">
		<div id="textWrapper">
			<div class="infoText"><h4 class="font-weight-bold">상품명 : ${auctionProduct.auctionProductName}</h4></div>
			<div class="infoText font-weight-bold">등록자ID : ${auctionProduct.registrantId}</div>
			<div class="infoText font-weight-bold">낙찰자ID : ${auctionProduct.successfulBidderId}</div>
			<div class="infoText font-weight-bold">최종금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${auctionProduct.currentBidPrice}" />원</div>
		</div>
		<div id="welcome">
			<form>
				<input type="hidden" value="${auctionProduct.auctionProductNo}">
				<button class="btn btn-light">입장</button>
			</form>
		</div>
		<div id="call">
			<div id="myStream">
				<div id="videoWrapper">
					<div id="videoFace">
						<video id="myFace" src="" autoplay="autoplay" width="100%" height="100%"></video>
					</div>
					<div id="videoPeer">
						<video id="peerFace" src="" autoplay="autoplay" width="100%" height="100%"></video>
					</div>
				</div>
				<div id="controlWrapper" class="row">
					<div class="col-md-4">
						<button id="audio" class="btn btn-light">
								<i class="fa fa-microphone"></i>
						</button>
						<button id="camera" class="btn btn-light"><i class="fa fa-video-camera"></i></button>
					</div>
					<div class="col-md-4">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
						    	<label class="input-group-text" for="cameras">카메라</label>
						  	</div>
							<select id="cameras" class="custom-select"></select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
						    	<label class="input-group-text" for="audios">마이크</label>
						  	</div>
							<select id="audios" class="custom-select"></select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
</body>

<!-- <script src="http://192.168.0.77:3000/socket.io/socket.io.js"></script> -->
<!-- <script src="https://192.168.0.77:3000/socket.io/socket.io.js"></script> -->
<script src="https://www.gamsung.site:3000/socket.io/socket.io.js"></script>

<script src="../../resources/js/videochat.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>