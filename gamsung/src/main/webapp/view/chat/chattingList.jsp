<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
	<head>
		<meta charset="utf-8">
		<title>Chat list</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="../../resources/css/chat.css" rel="stylesheet">
        <style>

            .format { display: none; }
        </style>
  	</head>
  	<body class="chatting-list" data-userName="${user.nickName}">
		<div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <div class="center">
                            <!-- gamsung -->
                            <span>Chat</span>
                        </div>
                        
                        <div id="close-btn"><i class="fa fa-fw"></i></div>
                    </div>
                    
                    <div class="card-footer">
                        <ul id="chat-lists">
                            <!-- chatList start -->
                        </ul>
                    </div>
                </div>
            </div>
		</div>
        <ul class="chat format">
            <li>
                <div class="list-box">
                    <div class="receive">
                        <div class="receiver"></div>
                        <div class="message"></div>
                    </div>
                    <div class="msg-new-time">
                        <div class="msg-total">
                            <span></span>
                        </div>
                        <div class="msg-time">
                            <span></span>
                        </div>
                    </div>
                    <div class="r-more-btn"><i class="fa fa-fw"></i></div>
                </div>
            </li>
        </ul>

        <script src="http://localhost:82/socket.io/socket.io.js"></script>
        <!-- <script src="http://192.168.0.89:82/socket.io/socket.io.js"></script> -->
		<script src="../../resources/lib/jquery/jquery.js"></script>
		<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
		<script>
            
            const socket = io("http://localhost:82/chatlist");
            // const socket = io("http://192.168.0.89:82/chatlist");
            const userName = $("body").data("username");
            
            socket.emit("getList",userName);
            
            socket.on("outList", datas=>{
                if(datas.length){
                    datas.forEach(data => {
                        let chatLi = $('ul.chat.format li').clone();
                        
                        chatLi.find(".receiver").text(data.members[0]);
                        chatLi.find(".list-box").attr('data-chatroom',data.room);
                        chatLi.find(".message").text(data.lastMsg);
                        $('#chat-lists').append(chatLi);
                    });
                }
            })
        </script>

        <script src="../../resources/js/chatEvent.js"></script>
	</body>
</html>