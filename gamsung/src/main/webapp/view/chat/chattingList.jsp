<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
	<head>
		<meta charset="UTF-8">
		<title>Chat list</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="../../resources/css/chat.css" rel="stylesheet">
		
  	</head>
  	<body class="chatting-list">
		<div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <div class="center">
                            <input id="user-id" type="hidden" value="${user.nickName}">
                            <span>Chat</span>
                        </div>
                        
                        <div id="close-btn"><i class="fa fa-fw"></i></div>
                    </div>
                    
                    <div class="card-footer">
                        <ul id="chat-lists">
                            <li>
                                <a href="#">
                                    <div class="list-box">
                                        <div class="receive">
                                            <div class="receiver">상대방 닉네임</div>
                                            <div class="message">메시지 내용</div>
                                        </div>
                                        <div class="msg-new-time">
                                            <div class="msg-total">
                                                <span>3</span>
                                            </div>
                                            <div class="msg-time">
                                                <span>03:23</span>
                                            </div>
                                        </div>
                                        <div class="r-more-btn"><i class="fa fa-fw"></i></div>
                                    </div>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <div class="list-box">
                                        <div class="receive">
                                            <div class="receiver">상대방 닉네임</div>
                                            <div class="message">메시지 내용</div>
                                        </div>
                                        <div class="msg-new-time">
                                            <div class="msg-total">
                                                <span>3</span>
                                            </div>
                                            <div class="msg-time">
                                                <span>03:23</span>
                                            </div>
                                        </div>
                                        <div class="r-more-btn"><i class="fa fa-fw"></i></div>
                                    </div>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <div class="list-box">
                                        <div class="receive">
                                            <div class="receiver">상대방 닉네임</div>
                                            <div class="message">메시지 내용</div>
                                        </div>
                                        <div class="msg-new-time">
                                            <div class="msg-total">
                                                <span>3</span>
                                            </div>
                                            <div class="msg-time">
                                                <span>03:23</span>
                                            </div>
                                        </div>
                                        <div class="r-more-btn"><i class="fa fa-fw"></i></div>
                                    </div>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <div class="list-box">
                                        <div class="receive">
                                            <div class="receiver">상대방 닉네임</div>
                                            <div class="message">메시지 내용</div>
                                        </div>
                                        <div class="msg-new-time">
                                            <div class="msg-total">
                                                <span>3</span>
                                            </div>
                                            <div class="msg-time">
                                                <span>03:23</span>
                                            </div>
                                        </div>
                                        <div class="r-more-btn"><i class="fa fa-fw"></i></div>
                                    </div>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <div class="list-box">
                                        <div class="receive">
                                            <div class="receiver">상대방 닉네임</div>
                                            <div class="message">메시지 내용</div>
                                        </div>
                                        <div class="msg-new-time">
                                            <div class="msg-total">
                                                <span>3</span>
                                            </div>
                                            <div class="msg-time">
                                                <span>03:23</span>
                                            </div>
                                        </div>
                                        <div class="r-more-btn"><i class="fa fa-fw"></i></div>
                                    </div>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <div class="list-box">
                                        <div class="receive">
                                            <div class="receiver">상대방 닉네임</div>
                                            <div class="message">메시지 내용</div>
                                        </div>
                                        <div class="msg-new-time">
                                            <div class="msg-total">
                                                <span>3</span>
                                            </div>
                                            <div class="msg-time">
                                                <span>03:23</span>
                                            </div>
                                        </div>
                                        <div class="r-more-btn"><i class="fa fa-fw"></i></div>
                                    </div>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <div class="list-box">
                                        <div class="receive">
                                            <div class="receiver">상대방 닉네임</div>
                                            <div class="message">메시지 내용</div>
                                        </div>
                                        <div class="msg-new-time">
                                            <div class="msg-total">
                                                <span>3</span>
                                            </div>
                                            <div class="msg-time">
                                                <span>03:23</span>
                                            </div>
                                        </div>
                                        <div class="r-more-btn"><i class="fa fa-fw"></i></div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
		</div>
	
		<script src="../../resources/lib/jquery/jquery.js"></script>
		<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
		<script src="../../resources/js/chatEvent.js"></script>
		
	</body>
</html>