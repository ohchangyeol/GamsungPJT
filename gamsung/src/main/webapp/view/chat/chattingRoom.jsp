<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html  class="chatting">
	<head>
		<meta charset="UTF-8">
		<title>Chat Room</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="../../resources/css/chat.css" rel="stylesheet">
  	</head>
  	<body>
		<div class="row">
		<div class="col-lg-4">
			<div class="card">
				<div class="card-header">
					<div id="back-btn"><i class="fa fa-fw"></i></div>
					<div class="center">
						<input id="user-id" type="hidden" value="${user.nickName}">
						<span>${user.nickName}</span>
						<div id="more-btn"><i class="fa fa-fw"></i></div>
					</div>
					<div id="close-btn"><i class="fa fa-fw"></i></div>
				</div>
				<div class="card-footer">
					<ul id="messages"></ul>
				</div>
				<div class="card-body">
					<form action="">
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="m" autocomplete="off" />
							<div class="input-group-append">
							<button id="msg-send" class="btn btn-primary" placeholder="message"><i class="fa fa-fw"></i></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	
		<script src="http://localhost:82/socket.io/socket.io.js"></script>
		<script src="../../resources/lib/jquery/jquery.js"></script>
		<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
		<script src="../../resources/js/chatEvent.js"></script>
		<script>
			$(document).ready(function(){
				console.log("ready start");
				const socket = io("http://localhost:82");

				const message_box = $('#messages');
				const sender = $('#user-id').val();
				
				$('#msg-send').on("click",() => {
					const roomName = sender+"_"+"test1";
					const data = {
						"room" :  roomName,
						"content" : {
							"sender" : sender,
							"receiver": "test1",
							"message" : $('#m').val()
						}
					}
					console.log(data);
					socket.emit('req_message', data );
					$('#m').val('');
					return false;
				});

				socket.on('res_message', datas => {
					resive(datas);
				});

				socket.on('out_message', datas => {
					if(datas.length){
						datas.forEach(data => {
							resive(data);
						});
					}
				});
			});

			// 메세지 수신
			function resive(data) {
				const LR = (data.sender != sender)? "left" : "right";
				appendMessageTag(LR, data.message);
			}

			// 메세지 태그 append
			function appendMessageTag(LR_className, message) {
				message_box.append($('<li class ="'+LR_className+'">').append($("<span>").text(message)));
				
				// 스크롤바 아래 고정
				$(document).scrollTop(message_box.prop('scrollHeight'));
			};
		</script>
	</body>
</html>