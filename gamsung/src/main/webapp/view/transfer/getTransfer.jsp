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
				* {
					font-family:
						'Noto Sans KR', sans-serif;
				}

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
					font-size: 33px;
					color: #333064;
					padding-left: 15px
				}

				h3 {
					font-size: 20px;
					color: #333064;
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
						data-background="../../uploadfiles/transfer/a.jpg">
						<div class="container">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<h1 class="module-title font-alt mb-0"></h1>
								</div>
							</div>
						</div>
					</section>
					<section class="module" style="padding:20px">
						<div class="container">
							<div class="container">

								<form name="transferform" id="transferform" role="form">
									<div class="row">

									</div>



									<div class="col-sm-12 minititle">
										<div class="gettransfertitle">
											${transfer.transferTitle}
											<hr class="divider-w mt-10 mb-20">
										</div>
										<div class="col-sm-6">
											<div class="form-group a">

												<label for="campname" class="control-label">
													<div>지역/캠핑장</div>
													<div>(펜션 및 숙박 장소)</div>
												</label>


												<div>[${transfer.transferArea}]&ensp;${transfer.transferCampname}</div>

											</div>


											<div class="form-group a">

												<label for="campdate" class="control-label">
													<div>양도예약날짜</div>
													<div>(입,퇴실날짜)</div>
												</label>


												<div>
													<div>${transfer.transferStartDate}

														<span>&ensp;-&ensp;</span>

														${transfer.transferEndDate}
													</div>
												</div>

											</div>
										</div>

										<div class="col-sm-6">

											<div class="form-group a">

												<label for="transferCampCall" class="control-label">
													<div>캠핑장</div>
													<div>전화번호</div>
												</label>
												<div>${transfer.transferCampCall}</div>

											</div>









											<div class="form-group a">
												<label for="transferUserNum" class="control-label"> <span>예약인원</span>
												</label>
												<div class="ohcamp">
													${transfer.transferUserNum}&ensp;명
												</div>
											</div>

											<div class="form-group a">
												<label for="textprice" class="control-label"> <span>양도금액</span>
												</label>
												<div class="ohcamp">
													${transfer.transferPrice} <span>무료양도</span>
												</div>
											</div>
										</div>



									</div>

									<div class="col-sm-12">
										<hr class="divider-w mt-10 mb-20">

										<div class="col-sm-7">
											<div class="minititle">
												<h3>양도사유</h3>
												<div>
													${transfer.transferContent}

												</div>
											</div>

											<div class="minititle" id="transferAddContent">
												<h3>특이사항</h3>
												<div>
													${transfer.transferAddContent}

												</div>
											</div>


											<div class="minititle" id="hashtag">
												<h3>해시태그</h3>
												${transfer.hashtag1}&ensp;${transfer.hashtag2}&ensp;${transfer.hashtag3}
											</div>


											<div class="submit" id="submit">

												<h3 style="
												text-align: center;
											">양수신청하고 캠핑가자
												</h3>
												<button type="button" name="receivebutton" class="receivebutton"
													style="background-color: white; padding-top: 0;border: none;position: relative;line-height: 4;width: 200px;height: 110px;overflow: hidden; transform: translatex(215px) translatey(19px);">
													<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%"
														fill="currentColor" class="bi bi-chevron-double-down"
														viewBox="0 0 16 16">
														<path fill-rule="evenodd"
															d="M1.646 6.646a.5.5 0 0 1 .708 0L8 12.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
														<path fill-rule="evenodd"
															d="M1.646 2.646a.5.5 0 0 1 .708 0L8 8.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
													</svg>
												</button>

											</div>
										</div>

										<div class="minititle transferpayment col-sm-5">
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











							<div>
								<!-- 요기다가 신청 리스트를 넣는다.  -->
							</div>











							<div class="receivelayer">
								<div class="container receive">
									<form name="receiveform" id="receiveform" role="form">
										<div class="col-sm-12">
											<div class="col-sm-12">
												<h4 class="mb-0" style="font-family:'Noto Sans KR', sans-serif;">예약양도 신청
												</h4>
												<hr class="divider-w mt-10 mb-20">

												<input id="receiveTitle" name="receiveTitle" class="form-control"
													type="text" placeholder="제목을 등록해주세요."
													style="height: 45px; margin-bottom: 18px;" />
											</div>

											<div class="col-sm-6 ">
												<div>

												</div>

												<div>

												</div>
											</div>
											<div class="col-sm-6 ">
												<div>
													<div class="ohcamp">
														<input id="receivePhone1" name="receivePhone"
															class="form-control" value="" type="text"
															placeholder="전화번호" />

														<span>&nbsp;ㅡ&nbsp;</span>

														<input id="receivePhone2" name="receivePhone"
															class="form-control" value="" type="text"
															placeholder="를입력해" />

														<span>&nbsp;ㅡ&nbsp;</span>

														<input id="receivePhone3" name="receivePhone"
															class="form-control" value="" type="text"
															placeholder="주세요♡" />
													</div>

												</div>
											</div>

											<div class="col-sm-12">
												<div class="minititle">
													<h3 style="margin-top: 0px;">양도사유</h3>
													<textarea id="receiveContent" name="receiveContent"
														class="form-control" rows="20"
														style="height: 400px;margin-bottom: 20px;"
														placeholder="양도사유를 입력해주세요."></textarea>
												</div>
												<br>
												<button type="button" class="btn btn-secondary btn-block"
													id="addreceiver"> 신청 뾰로롱 ~
												</button>
											</div>

										</div>
										<input type="hidden" id="transferNo" name="transferNo"
											value="{transfer.transferNo}">
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


				// isShow = true;
				// $(function () {
				// 	$("button:button[name='receivebutton']").on("click", function () {
				// 		console.log($("button:button[name='receivebutton']"));
				// 		console.log(isShow);
				// 		if (isShow == true) {
				// 			$('receivelayer').show();
				// 			isShow = false;
				// 		} else {
				// 			$('receivelayer').hide();
				// 			isShow = true;
				// 		}
				// 	});
				// });

				$(document).ready(function () {




					$('.receivebutton').click(function () {
						$('.receivelayer').toggle();
					});





				});


				$(function () {
					$("#addreceiver").on("click", addreceiver);
					//name이 reply인 button을 click했을때  listComment는 param값이 없다.
					// 그렇지만 클릭시 버튼에 걸린 event값이 event object 객체로 전달됨. 


					function addreceive(paramiter) {

						var queryString = $("form[name=receiveform]").serialize(); //serialize 는 form 태그 내의 항목들을 자동으로 읽어와서 quertString형식으로 변환시킨다. 


						console.log("queryString:::" + queryString);



						$.ajax({
							type: 'post',
							url: "/transfer/rest/addReceive",
							data: queryString,
							dataType: 'json',
							error: function () {
								alert(error);

							},
							success: function (json) {


								console.log("list \n", list);

							}
						});

					};//addreceive ENDs

				});//function EMD







			</script>

		</body>

		</html>