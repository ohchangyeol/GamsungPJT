<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  ///////////////////////// jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('span:contains("로그인")')
			.on(
					'click',
					function() {
						$('#loginModal').on('show.bs.modal');
						$('button:contains("LOGIN")').click(
								function() {
									var id = $('#modalId').val();
									var pwd = $('#modalPwd').val();
									if (id.length == 0) {
										alert("아이디를 입력해 주세요.");
										return;
									}
									if (pwd.length == 0) {
										alert("패스워드를 입력해 주세요.");
										return;
									}
									$('#loginForm').attr('method', 'post')
											.attr('action', '/user/login')
											.submit();
								});
						$("#kakao-png")
								.on(
										"click",
										function() {
											Kakao
													.init('b3bed223fd618abc07f64c2103ca9659');
											console.log(Kakao
													.isInitialized());
											Kakao.Auth
													.login({
														success : function(
																authObj) {
															Kakao.API
																	.request({
																		url : '/v2/user/me',
																		success : function(
																				result) {
																			console
																					.log(result);
																			$(
																					'#kakaoId')
																					.val(
																							result.kakao_account.profile.nickname);
																			$(
																					'#kakaoName')
																					.val(
																							result.kakao_account.profile.nickname);
																			$(
																					'#kakaoEmail')
																					.val(
																							result.kakao_account.email);
																			$(
																					'#kakaoImage')
																					.val(
																							result.kakao_account.profile.thumbnail_image_url);
																			$(
																					'#addKakao')
																					.attr(
																							'method',
																							'post')
																					.attr(
																							'action',
																							'/user/kakaoUser')
																					.submit();
																		}
																	});
															//$(self.location).attr("href","/user/login/pass");
														},
														fail : function(err) {
															console
																	.log(JSON
																			.stringify(err))
														},
													})
										});
						$("#logout").on("click", function() {
							if (Kakao.Auth.getAccessToken()) {
								Kakao.Auth.logout();
							}
						});
					});
	$('span:contains("회원가입")').on('click', function() {
		$('addModal').on('show.bs.modal');
	});
});
</script>
<div hidden="" class="modal fade" id="loginModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">로그인</h4>
			</div>
			<div class="modal-body">
				<form id="loginForm">
					<div class="form-group">
						<label>ID</label> <input id="modalId" type="text"
							class="form-control" name="userId" placeholder="Id">
					</div>
					<div class="form-group">
						<label>Password</label> <input id="modalPwd" type="password"
							class="form-control" name="password" placeholder="Password">
					</div>
					<div class="checkbox">
						<label> <input type="checkbox"> 자동로그인
						</label>
					</div>
					<button type="button" class="btn btn-default">LOGIN</button>
					<hr class="my-4">
					<div id="img">
						<div id="img-in">
							<div id="kakao-img">
								<img id="kakao-png"
									src="/images/RestApi/Kakao/kakao_login_medium_wide.png">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>