<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

			<style type="text/css">
				.sidebar-left {
					background-color: #171717 !important;
				}

				#addSecessionModal .modal-dialog .modal-content .was-validated .form-group .form-control {
					border-radius: 100px;
					padding-left: 20px;
					height: 40px;
					font-size: 13px;
				}


				#addSecessionModal {

					position: absolute;
					top: 50%;
					left: 50%;
					transform: translateY(-50%) translateX(-50%);
				}

				#Secession-btn {
					display: flex;
					justify-content: end;
					gap: 15px;
				}
			</style>
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

							<!-- The Modal -->
							<div class="modal" id="addSecessionModal">
								<div class="modal-dialog-centered">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h5 class="modal-title">회원탈퇴</h5>
										</div>

										<!-- Modal body -->
										<div class="modal-body">
											<form action="" class="was-validated">
												<div class="form-group">
													<input type="text" class="form-control" id="secession-userId"
														value="${user.id}" name="id" required readonly>
												</div>
												<div class="form-group">
													<input type="password" class="form-control" id="secession-userPwd"
														placeholder="비밀번호를 입력하세요" name="password" required>
												</div>
												<div id="Secession-btn">
													<button type="button" class="btn btn-primary"
														id="addSecession_btn">탈퇴하기</button>
													<button type="button" class="btn btn-danger"
														data-dismiss="modal">취소</button>
												</div>
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