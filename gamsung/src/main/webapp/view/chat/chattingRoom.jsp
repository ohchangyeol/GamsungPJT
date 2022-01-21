<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html  class="chatting">
	<head>
		<meta charset="UTF-8">
		<title>Chat Room</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="../../resources/css/chat.css" rel="stylesheet">
  	</head>
  	<!-- param room data clone -->
  	<body id ="room" data-room="${param.room}" data-receiver="${receiver}" data-userid="${user.nickName}">
		<div class="row">
		<div class="col-lg-4">
			<div class="card">
				<div class="card-header">
					<div id="back-btn"><i class="fa fa-fw"></i></div>
					<div class="center">
						<span>${receiver}</span>
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
		<!-- <script src="http://192.168.0.89:82/socket.io/socket.io.js"></script> -->
		<script src="../../resources/lib/jquery/jquery.js"></script>
		<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
		<script src="../../resources/js/chatEvent.js"></script>
		<script>
			$(document).ready(function(){
				const socket = io("http://localhost:82/chatting");
				// const socket = io("http://192.168.0.89:82/chatting");
				const message_box = $('#messages');
				const sender = $("body").data("userid");
				const receiver = $("body").data("receiver");
				
				// room name get
				const room = $("body").data("room");
				
				// room join
				console.log("room에 대한 정보", room);
				socket.emit('joinRoom', room);
				
				// message send
				$('#msg-send').on("click",() => {
					socket.emit('req_message', messageData(room,sender,receiver) );
					return false;
				});

				// receive message
				socket.on('res_message', datas => {
					//console.log("전송 받은 data => " , datas);
					resive(datas);
				});

				// message init
				socket.on('out_message', datas => {
					//console.log("현재 방의 데이터",datas);
					if(datas.length){
						datas.forEach(data => {
							resive(data);
						});
					}
				});

				// message data
				function messageData(room, sender, receiver) {
					const data = {
						"room" :  room,
						"content" : {
							"sender" : sender,
							"receiver": receiver,
							"message" : $('#m').val()
						}
					}
					$('#m').val('');
					return data;
				}
				// message resive
				function resive(data) {
					const LR = (data.content.sender != sender)? "left" : "right";
					appendMessageTag(LR, data.content.message);
				}

				// message append
				function appendMessageTag(LR_className, message) {
					message_box.append($('<li class ="'+LR_className+'">').append($("<span>").text(message)));
					
					$(document).scrollTop(message_box.prop('scrollHeight'));
				};
			});

		</script>
	</body>
</html>