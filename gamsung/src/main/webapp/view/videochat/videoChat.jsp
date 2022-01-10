<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화상채팅</title>
<link rel="stylesheet" href="https://unpkg.com/mvp.css">
</head>
<body>
	<header>낙찰된 상품 확인</header>
	<main>
		<div id="welcome">
			<form>
				<input type="hidden" value="${roomId}">
				<button>입장</button>
			</form>
		</div>
		<div id="call">
			<div id="myStream">
				<video id="myFace" src="" autoplay="autoplay" width="400" height="400"></video>
				<button id="mute">음소거</button>
				<button id="camera">화면끄기</button>
				<select id="cameras"></select>
				<video id="peerFace" src="" autoplay="autoplay" width="400" height="400"></video>
			</div>
		</div>
	</main>
</body>
<script src="http://127.0.0.1:3000/socket.io/socket.io.js"></script>
<script src="../../resources/js/videochat.js"></script>
<script src="../../resources/lib/jquery/jquery.js"></script>
</html>