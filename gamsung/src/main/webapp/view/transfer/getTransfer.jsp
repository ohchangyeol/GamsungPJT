<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="en-US" dir="ltr">

		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<!--  
    Document Title
    =============================================
    -->
			<title>감성캠핑 양도목록</title>

			<jsp:include page="/resources/commonLib.jsp" />

			<style>
				.table>tbody>tr>td,
				.table>tbody>tr>th,
				.table>tfoot>tr>td,
				.table>tfoot>tr>th,
				.table>thead>tr>td,
				.table>thead>tr>th {
					padding: 18px;
				}

				.form-group {
					display: flex;
					align-items: center;
				}

				.form-group label {
					flex: 1;
				}

				.form-group div {
					flex: 3;
				}

				.form-group div.ohcamp {
					display: flex;
				}

				.form-group div.ohcamp input,
				div {
					flex: 3;
				}

				.form-group div.ohcamp div {
					padding-left: 20px;
				}

				.gettransfertitle {
					font-size: 20px;
					color: #2d2d2d;
					padding-left: 15px
				}

				h3 {
					font-size: 20px;
					color: #2d2d2d;
				}

				.col-sm-7 {
					padding-left: 7px;
				}

				.ohcamp {
					display: flex;
					align-items: center;
				}

				.receivelayer {
					display: none;
				}

				.receivelist {
					font: -webkit-mini-control;
					margin-bottom: 0px;
					padding-top: 5px;
					margin-top: 15px;
				}

				.receiveminititle {
					color: #2d2d2d;
					font-size: 13px;
				}

				.transferminititle {
					color: #2d2d2d;
				}

				.a {
					display: flex;
					justify-content: space-between;
					align-items: center;
					margin-bottom: -6px;
				}

				.b {
					display: flex;
					justify-content: space-between;
					align-items: center;
				}

				span {
					font-size: 12px;
				}
			</style>

			<!-- <link id="color-scheme" href="../../../resources/css/serviceCenter.css" rel="stylesheet"> -->
		</head>

		<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" class="myReport">
			<main>
				<div class="page-loader">
					<div class="loader">Loading...</div>
				</div>

				<!-- header -->
				<jsp:include page="../common/header.jsp" />
				<!-- header End -->

				<div class="main sc-main">
					<section class="module bg-dark-30 about-page-header"
						data-background="../../uploadfiles/transfer/transferhead.jpg"
						style="padding-top: 400px; padding-bottom: 185px;">
						<div class="container">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<h1 class="module-title font-alt mb-0"></h1>
								</div>
							</div>
						</div>
					</section>
					<section class="module" style="padding: 20px">
						<div class="container">
							<div class="container">

								<form name="transferform" id="transferform" role="form">
									<div class="row"></div>



									<div class="col-sm-12 minititle">
										<div class="gettransfertitle">
											${transfer.transferTitle}
											<hr class="divider-w mt-10 mb-20">
										</div>
										<div class="col-sm-6">
											<div class="form-group a">

												<label for="campname" class="control-label">
													<div class="transferminititle">지역/캠핑장</div>
													<div class="transferminititle">(펜션 및 숙박 장소)</div>
												</label>


												<div>[${transfer.transferArea}]&ensp;${transfer.transferCampname}</div>

											</div>


											<div class="form-group a">

												<label for="campdate" class="control-label">
													<div class="transferminititle">양도예약날짜</div>
													<div class="transferminititle">(입,퇴실날짜)</div>
												</label>


												<div>
													<div>${transfer.transferStartDate}

														<span>&ensp;-&ensp;</span> ${transfer.transferEndDate}
													</div>
												</div>

											</div>
										</div>

										<div class="col-sm-6">

											<div class="form-group a">

												<label for="transferCampCall" class="control-label">
													<div class="transferminititle">캠핑장</div>
													<div class="transferminititle">전화번호</div>
												</label>
												<div>${transfer.transferCampCall}</div>

											</div>





											<div class="form-group a transferminititle">
												<label for="transferUserNum" class="control-label"> <span>예약인원</span>
												</label>
												<div class="ohcamp transferminititle">${transfer.transferUserNum}&ensp;명
												</div>
											</div>

											<div class="form-group a transferminititle">
												<label for="textprice" class="control-label"> <span>양도금액</span>
												</label>
												<div class="ohcamp transferminititle">
													${transfer.transferPrice} <span>무료양도</span>
												</div>
											</div>
										</div>



									</div>

									<div class="col-sm-12">
										<hr class="divider-w mt-10 mb-20">

										<div class="col-sm-7">
											<div class="transferminititle">
												<h3>양도사유</h3>
												<div>${transfer.transferContent}</div>
											</div>

											<div class="transferminititle" id="transferAddContent">
												<h3>특이사항</h3>
												<div>${transfer.transferAddContent}</div>
											</div>


											<div class="transferminititle" id="hashtag">
												<h3>해시태그</h3>
												${transfer.hashtag1}&ensp;${transfer.hashtag2}&ensp;${transfer.hashtag3}
											</div>


											<div class="submit" id="submit">

												<c:if test="${user.id != transfer.transferOr.id}">
													<h3 style="text-align: center;">양수신청하고 캠핑가자</h3>
													<button type="button" name="receivebutton" class="receivebutton"
														style="background-color: white; padding-top: 0; border: none; position: relative; line-height: 4; width: 200px; height: 110px; overflow: hidden; transform: translatex(215px) translatey(19px);">
														<svg xmlns="http://www.w3.org/2000/svg" width="100%"
															height="100%" fill="currentColor"
															class="bi bi-chevron-double-down" viewBox="0 0 16 16">
															<path fill-rule="evenodd"
																d="M1.646 6.646a.5.5 0 0 1 .708 0L8 12.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
															<path fill-rule="evenodd"
																d="M1.646 2.646a.5.5 0 0 1 .708 0L8 8.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
														</svg>
													</button>
												</c:if>
											</div>
										</div>

										<div class="minititle transferpayment col-sm-5 transferminititle">
											<h3>예약양도결제내역</h3>
											<div class="image-upload">
												<img src="/uploadfiles/transfer/${transfer.paymentImg}" />
												<!-- src 해석필요함.. 절대경로 상대경로 공부가 필요함.. ㅠ_ㅠ.. 완벽한 이해가 되질않음..  -->
											</div>
											<!-- image-upload end -->
										</div>
									</div>
								</form>
							</div>

							<!-- 내가 양도글 작성자 or 관리자라면 모든 양수 신청글이 보인다. else 내 양수 신청글이 보일것.  -->
							<div class="container receive">
								<div class="col-sm-12">
									<h3 class="mb-0" style="font-family: 'Noto Sans KR', sans-serif;">양수신청목록(신청자는
										본인의 양수신청내역만 조회하실 수 있습니다.)</h3>
									<c:forEach var="receive" items="${listreceive}">
										<div class='receivelist'>


											<div class='receive'>
												<div class="a">

													<div>
														<span class="receiveminititle"
															style="color: steelblue;">작성자ID&nbsp;</span>
														<span>${receive.transferee.id}</span> <span
															class="receiveminititle"
															style="color: steelblue;">핸드폰번호&nbsp;</span>
														<span>${receive.receivePhone}</span>
													</div>

													<span class="receiveminititle">신청번호&nbsp;</span> <span
														style="color: #c0c0c0; font-size: 10px;">&nbsp;${receive.receiveNo}&nbsp;&nbsp;</span>
													<span class="receiveminititle">신청날짜&nbsp;</span> <span
														style="color: #c0c0c0; font-size: 10px;">&nbsp;${receive.receiveRegdate}&nbsp;&nbsp;</span>
												</div>
											</div>

											<hr class="divider-w mt-10">


											<div class="b">
												<div>
													<span class="receiveminititle">신청제목</span>
												</div>

												<c:if test="${user.id == transfer.transferOr.id}">
													<span data-transferNo="${receive.transferNo.transferNo}"
														data-receiveNo="${receive.receiveNo}"
														class="updateTransferStatus ${receive.receiveNo}">승인</span>

												</c:if>
											</div>

											<div style="margin-bottom: 9px;">
												<span>${receive.receiveTitle}</span>
											</div>


											<div>
												<span class="receiveminititle">신청내용</span>
											</div>

											<span>${receive.receiveContent}</span>

										</div>
									</c:forEach>
								</div>
							</div>

							<!-- ----------------------------------------- 신청 폼 ------------------------------------------------------------------------------------- -->
							<div class="receivelayer">
								<div class="container receive">
									<form name="receiveform" id="receiveform" role="form">
										<div class="col-sm-12">

											<div class="col-sm-12"
												style="margin-top: 20px; border: 1px solid$000; border: 1px solid #e0bad3; border-style: dotted;">
												<h4 class="mb-0" style="font-family: 'Noto Sans KR', sans-serif;">예약양수
													신청</h4>
												<hr class="divider-w mt-10 mb-20">

												<input id="receiveTitle" name="receiveTitle" class="form-control"
													type="text" placeholder="제목을 등록해주세요."
													style="height: 45px; margin-bottom: 18px;" />

												<div class="col-sm-6 ">
													<div></div>

													<div></div>
												</div>
												<div class="col-sm-6 ">
													<div>
														<div class="ohcamp">
															<input id="receivePhone" name="receivePhone"
																class="form-control" value="" type="text"
																placeholder="-없이 입력해주세요. ex 01012345678" />
														</div>

													</div>
												</div>

												<div class="col-sm-12">
													<div class="minititle">
														<h3 style="margin-top: 0px;">양수신청사유</h3>
														<textarea id="receiveContent" name="receiveContent"
															class="form-control" rows="20"
															style="height: 400px; margin-bottom: 20px;"
															placeholder="양수신청내용을 입력해주세요."></textarea>
													</div>
													<br>
													<button type="button" class="btn btn-secondary btn-block"
														id="addreceive" style="margin-bottom: 23px;">신청 뾰로롱
														~</button>
												</div>

												<input type="hidden" id="transferNo" name="transferNoo"
													value="${transfer.transferNo}">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</section>




				</div>

				<!-- //버튼을 눌렀을때 등록이 나오게 한다. 	 -->






				</section>

				<jsp:include page="../common/footer.jsp" />

			</main>

			<!-- <script src="../../../resources/js/servicecenter/report.js"></script> -->

			<script>

				$(document).ready(function () {  /* 이게 1순위다 */

					$('.receivebutton').click(function () {
						$('.receivelayer').toggle();
					});

				});

				$(function () { /* $로테이션을 jquery가 인식하기 위해서? script안에서 jquery를 사용하겠다는 것.  */ /* 요게 2순위 */
					$("#addreceive").on("click", function () {

						var form = $("#receiveform").serialize();

						$.ajax({
							type: "post",
							url: "/transfer/rest/addReceive",
							data: form,
							error: function () {
								alert(request, status, error);
								alert("code:" + request.status + "\n"
									+ "message:" + request.responseText
									+ "\n" + "error:" + error);
							},
							success: function (list) {

								console.log("list \n", list);

							}
						});

					}); // addreceive click end





					$(".updateTransferStatus").on("click", function (e) {

						var transferNoo = $(e.currentTarget).data("transferno"); //제발 data는 소문자로 해라 ㅠ 인식을 안함.. ㅠㅠ
						var receiveNo = $(this).data("receiveno");

						console.log(transferNoo);
						console.log(receiveNo);

						var params = { "transferNoo": transferNoo, "receiveNo": receiveNo }; //담은 value값을 json형식으로 object에 담아 보낸다. 


						$.ajax({
							type: "get", //데이터를 보낼 방식
							url: "/transfer/rest/updateTransferStatus", //데이터를 보낼 url
							data: params, //보낼 데이터

							success: function (data) {

								console.log("data::::" + data);


								$(".updateTransferStatus").text("");
								$(".updateTransferStatus." + receiveNo).text("승인완료");

							},

							error: function () {
								console.log("error::::");
							}
						}); //ajax end
					});
				}); //function END





			</script>

		</body>

		</html>