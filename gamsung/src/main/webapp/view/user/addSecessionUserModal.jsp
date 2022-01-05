<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</head>

	<body>
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<!-- Brand -->
			<a class="navbar-brand" href="#">HAMOYE</a>

			<!-- Toggler/collapsibe Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar links -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="#" data-toggle="modal" data-target="#login">
							로그인
						</a>
						<!-- The Modal -->
						<div class="modal" id="login">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h5 class="modal-title">회원탈퇴</h5>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<form action="" class="was-validated">
											<div class="form-group">
												<label for="secessionn-userId">아이디 </label>
												<input type="text" class="form-control" id="secessionn-userId"
													placeholder="아이디를 입력하세요" name="id" required>
											</div>
											<div class="form-group">
												<label for="secession-userPwd">비밀번호 </label>
												<input type="password" class="form-control" id="userPwd"
													placeholder="비밀번호를 입력하세요" name="password" required>
											</div>

											<button type="submit" class="btn btn-primary">탈퇴하기</button>
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">취소</button>

										</form>
									</div>

								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</body>

	</html>