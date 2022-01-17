<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 로그인 모달 -->

		<div id="modalBasic" class="mfp-hide white-popup-block">
			<section class="panel">
				<header class="panel-heading">
					<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button> -->
					<h3 class="modal-title" align="center"
						style="font-size: 30px;font-weight: 500;margin-bottom: 20px;">로그인</h3>
				</header>
				<div class="panel-body">
					<form id="login-modal-form" action="" class="was-validated">
						<div class="form-group">
							<input type="text" class="form-control" id="modalId" placeholder="아이디를 입력하세요." name="id"
								required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요."
								name="password" required>
						</div>
						<div>
							<button class="btn btn-g btn-circle modal-dismiss" type="button" id="loginBtn">로그인</button>

						</div>

						<div class="find-content">
							<ul>
								<li id="joinUser">일반회원 가입</li>
								<li id="joinBusinessUser">사업자회원 가입</li>
								<li class="modal-dismiss" data-toggle="modal" data-target="#findIdPwdModal"
									id="findIdPwd">
									아이디 찾기/비밀번호 찾기</li>
							</ul>
						</div>
					</form>
				</div>
				<footer>
					<div class="f-and">
						<span>또는</span>
					</div>
					<div class="kakao">

						<button id="kakaobtn" class="btn btn-g btn-circle" type="button"
							onclick="javascript:kakaoLogin();">

							<img src="../../resources/images/kakao_login_large_narrow.png" />
							카카오 로그인
						</button>
					</div>

				</footer>
			</section>
		</div>

		<script type="text/javascript">

			$(document).ready(function () {

				var kakaoInfo = '${kakaoInfo}';

				if (kakaoInfo != "") {
					var data = JSON.parse(kakaoInfo);

					console.log("카카오로그인 성공 \n accessToken : " + data['accessToken']);
					console.log(
						"user : \n" + "email : "
						+ data['email']
						+ "\n nickname : "
						+ data['nickname']);
				}
			});

		</script>