<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


			<!DOCTYPE html>
			<html>

			<head>



				<meta charset="UTF-8">
				<meta name="viewport"
					content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

				<title>예약 양도 등록</title>
				<link rel="preconnect" href="https://fonts.googleapis.com">
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
				<link
					href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
					rel="stylesheet">
				<!--폰트-->

				<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
				<link
					href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css"
					rel="stylesheet">
				<jsp:include page="/resources/commonLib.jsp"></jsp:include>


				<style>
					@import url(https://fonts.googleapis.com/css?family=BenchNine:700);

					.snip1535 {
						background-color: #ffffff;
						border: none;
						color: #333064;
						cursor: pointer;
						display: inline-block;
						font-family: 'Roboto Condensed';
						font-size: 1em;
						font-size: 30px;
						line-height: 1em;
						margin: 15px 40px;
						outline: none;
						padding: 12px 40px 10px;
						position: relative;
						text-transform: uppercase;
						width: 1000px;
					}


					.snip1535:before,
					.snip1535:after {
						border-color: transparent;
						-webkit-transition: all 0.25s;
						transition: all 0.25s;
						border-style: solid;
						border-width: 0;
						content: "";
						height: 24px;
						position: absolute;
						width: 24px;
					}

					.snip1535:before {
						border-color: #333064;
						border-right-width: 5px;
						border-top-width: 5px;
						right: -10px;
						top: -10px;
					}

					.snip1535:after {
						border-bottom-width: 5px;
						border-color: #ccc;
						border-left-width: 5px;
						bottom: -10px;
						left: -10px;
					}

					.snip1535:hover,
					.snip1535.hover {
						background-color: #ffffff;
					}

					.snip1535:hover:before,
					.snip1535.hover:before,
					.snip1535:hover:after,
					.snip1535.hover:after {
						height: 100%;
						width: 100%;
					}

					.filebox label {
						display: inline-block;
						padding: 60px 60px;
						color: #999;
						font-size: inherit;
						line-height: normal;
						vertical-align: middle;
						background-color: #fdfdfd;
						cursor: pointer;
						border: 1px solid #ebebeb;
						border-bottom-color: #e2e2e2;
						border-radius: .25em;
					}

					#file {
						display: flex;
						flex-direction: row;
						justify-content: space-between;
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

					.time {
						display: flex;
					}

					#inputImgs {
						display: none;
					}

					.imgsWrap {

						border: 2px solid #A8A8A8;
						margin-top: 30px;
						margin-bottom: 30px;
						padding-top: 10px;
						padding-bottom: 10px;

					}

					.imgsWrap img {
						max-width: 150px;
						margin-left: 10px;
						margin-right: 10px;
					}


					.mb-0 {
						color: #333064;
						font-weight: 400;
						font-size: xxx-large;
					}

					.minititle {
						color: #333064;
						font-weight: 400;
						font-size: x-large;
						font-family:
							'Noto Sans KR', sans-serif;
						margin-bottom: 30px;
					}
placeholder
					#addcontent {
						height: 180px;
					}


					#hashtag {
						height: 100px;
					}

					.minititle .MyCampReservation {
						font-size: 12px;

					}

					* {
						font-family:
							'Noto Sans KR', sans-serif;
					}
					
					.form-control{
											    background: #f3f6f9;
					    border-radius: 10px;
					}
					
					
					input::placeholder {
						color: #2d2d2d !important;
					}
					
										textarea::placeholder {
						color: #2d2d2d !important;
					}
					
					.transferlayer{
					
					display: none;
					
					}
									button {
					margin: 20px;
				}

				.w-btn-outline {
					position: relative;
					padding: 9px 50px;
					border-radius: 7px;
					font-family: "paybooc-Light", sans-serif;
					box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
					text-decoration: none;
					font-weight: 600;
					transition: 0.25s;
				}

				.w-btn-blue-outline {
					border: 3px solid #cdddf1;
					color: #8483a2;
				}

				.w-btn-blue-outline:hover {
					background-color: #cdddf1;
					color: #8483a2;
				}

				.w-btn-outline:hover {

					transform: scale(1.1);
					cursor: pointer;
				}

				.w-btn-outline:active {
					transform: scale(1.8);
				}
					
				</style>

			</head>

			<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
				<!-- 	<div class="page-loader">
       		<div class="loader">Loading...</div>
     	</div> -->
				<jsp:include page="../common/header.jsp"></jsp:include>
				<section class="module bg-dark-30 about-page-header"
					data-background="../../uploadfiles/transfer/insert.jpg"
					style="padding-top: 370px;
    padding-bottom: 390px;">

				</section>
				<section class="module" style="margin-top: 0px; padding: 0px; ">
					<div class="container">
						<form name="transferform" id="transferform" role="form">
							<div class="row">
								<div class="col-sm-12 " style="margin-top: 20px;">
					<input id="transferTitle" name="transferTitle" class="form-control" type="text"placeholder="제목을 등록해주세요." style="height: 45px; margin-bottom: 20px;"/>
								</div>
							</div>



							<div class="col-sm-12 minititle">
														<button type="button" name="receivebutton" class="transferbutton"
														style="background-color: #ffffff00; border: none; line-height: 4; width: 200px; height: 110px; transform: translatex(215px) translatey(19px);">
														<h3 style="margin: 0px;
														text-align: center;
														font-family: 'Gaegu', cursive;
														font-size: 39px;
														color: #82727f;">
															나의 캠핑장 예약 목록 (Click)</h3>
													</button>
						

								<div class="MyCampReservation transferlayer" style="padding-top: 50px;">

									<table class="table table-hover mb-none">
										<thead>
											<tr>
												<th style="text-align: center;">선택</th>
												<th style="text-align: center;">No</th>
												<th style="text-align: center;">예약번호</th>
												<th style="text-align: center;">캠핑장</th>
												<th style="text-align: center;">이용시설</th>
												<th style="text-align: center;">이용날짜</th>
												<th style="text-align: center;">이용가격</th>
												<th style="text-align: center;">예약상황</th>
											</tr>
										</thead>





										<tbody>

											<c:set var="i" value="0" />
											<c:forEach var="CampReservation" items="${list}">
												<c:set var="i" value="${ i+1 }" />

												<tr class="reservation" style="cursor: pointer; text-align: center;">
													<td class="col-sm-1 center"
														data-addr="${CampReservation.camp.user.addr}">

														<div class="form-check">
															<input class="form-check-input" name="form-check-input"
																type="radio" id="${CampReservation.reservationNo}">
															<label class="form-check-label" for="flexRadioDefault1">
															</label>
														</div>

													</td>
													<!--선택-->
													<td class="col-sm-1 center"
														id="number${CampReservation.reservationNo}"
														data-campcall="${CampReservation.camp.user.campCall}"
														data-usenum="${CampReservation.useNum}">${ i }</td>
													<!--번호-->
													<td class="col-sm-1"
														name="reservationNo${CampReservation.reservationNo}">
														${CampReservation.reservationNo}</td>
													<!--예약번호-->

													<td class="col-sm-2" id="campName${CampReservation.reservationNo}"
														data-campname="${CampReservation.camp.user.campName}">
														${CampReservation.camp.user.campName}</td>
													<!--캠핑장이름-->

													<td class="col-sm-2">${CampReservation.mainSite.mainSiteType}</td>
													<!--이용시설-->

													<td class="col-sm-2" id="date${CampReservation.reservationNo}"
														data-startdate="${CampReservation.reservationStartDate}"
														data-enddate="${CampReservation.reservationEndDate}">
														${CampReservation.reservationStartDate} ㅡ
														${CampReservation.reservationEndDate}</td>
													<!--이용날짜-->

													<td class="col-sm-2" name="price">
														${CampReservation.totalPaymentPrice}</td>
													<!--이용가격-->

													<td class="col-sm-1"><span style="color: rgb(41, 69, 105);">
															<c:if test="${CampReservation.reservationStatus eq 1}">예약완료
															</c:if>
															<c:if test="${CampReservation.reservationStatus eq 2}">예약변경
															</c:if>
														</span>
														<!--예약상황-->
													</td>
												</tr>



											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!--                                                                                                     -->
							<div class="col-sm-6">

								<div class="form-group">

									<label for="transferCampname" class="control-label">
										<div>캠핑장</div>
										<div>(펜션 및 숙박 장소)</div>
									</label>

									<div>
										<!-- <input type="hidden" id="transferReservationNo" name="transferReservationNo"
											value="">-->
										<input type="hidden" id="transferArea" name="transferArea" value="">

										<input id="transferCampname" name="transferCampname" class="form-control"
											value="" type="text" placeholder="직접입력/캠핑장" />
									</div>

								</div>


								<div class="form-group">
									<label for="campdate" class="control-label">
										<div>양도예약날짜</div>
										<div>(입,퇴실날짜)</div>
									</label>
									<div>
										<div class="ohcamp">
											<input id="transferStartDate" name="transferStartDate" class="form-control"
												value="" type="text" placeholder="YYYY-MM-DD" />

											<span>-</span>

											<input id="transferEndDate" name="transferEndDate" class="form-control"
												value="" type="text" placeholder="YYYY-MM-DD" />
										</div>

									</div>

								</div>

							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="transferCampCall" class="control-label">
										<div>캠핑장</div>
										<div>전화번호</div>
									</label>
									<div>
										<input id="transferCampCall" name="transferCampCall" class="form-control"
											value="" type="text" placeholder="-없이 입력해주세요." />
									</div>
								</div>

								<div class="form-group">
									<label for="transferUserNum" class="control-label">
										<span>예약인원</span>
									</label>

									<div class="ohcamp">
										<input id="transferUserNum" name="transferUserNum" class="form-control" value=""
											type="text" placeholder="0" />
										<div>
											<span>명</span>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="textprice" class="control-label">
										<span>양도금액</span>
									</label>
									<div class="ohcamp">
										<input id="textprice" name="transferPrice" class="form-control" value=""
											type="text" placeholder="양도금액을 입력해주세요." />

										<div class="free control-label">
											<input type="checkbox" id="checkprice" class="" onClick="checkDisable(this.form)">

											<span>무료양도</span>
										</div>


									</div>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="minititle">
									<h3>양도사유</h3>
									<textarea id="transferContent" name="transferContent" class="form-control" rows="20"
										placeholder="양도사유를 입력해주세요."></textarea>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="minititle" id="transferAddContent">
									<h3>특이사항</h3>
									<textarea id="transferAddContent" name="transferAddContent" class="form-control"
										rows="8" placeholder="특이사항이 있을 경우 입력해주세요."></textarea>
								</div>

								<div class="minititle" id="hashtag">
									<h3>해시태그</h3>
									<textarea id="allhashtag" name="allhashtag" class="form-control" rows="5"
										placeholder="태그를 입력해주세요(최대 3개)"></textarea>

									<input type="hidden" id="hashtag1" name="hashtag1" value="">
									<input type="hidden" id="hashtag2" name="hashtag2" value="">
									<input type="hidden" id="hashtag3" name="hashtag3" value="">

								</div>
							</div>
							<div class="minititle transferpayment col-sm-4">
								<h3>예약양도결제내역</h3>
								<div class="image-upload">
									<button type="button" id="filebutton" class="btn btn-outline-dark"
										style="background-color: white; padding-bottom: 0;transform: translatey(-12px);padding-top: 0;">
										<svg xmlns="http://www.w3.org/2000/svg" class="bi bi-camera" width="300"
											height="280" fill="currentColor" class="bi bi-camera" viewBox="0 0 16 16">
											<path
												d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z" />
											<path
												d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
										</svg>
									</button>
									<p
										style="line-height: normal;font-size: 16px;transform: translatey(-28px);color: salmon;">
										캠핑장(펜션 및 숙박장소)를 예약하신 후에 받은 확정 문자 및 메일을 이미지 파일로 업로드 해주세요(필수)</p>
									<input type="file" id="file" name="paymentImgs" multiple="multiple"
										onchange="uploadFile(this)" style="display:none" />

								</div><!-- image-upload end -->
							</div>


							<!-- 	<div class="col-sm-12"> -->
							<div class="col-sm-12">
								<button class="w-btn-outline w-btn-blue-outline" style="
    transform: translateX(480px);
"name="Addtransfer" type="button">양도 등록</button>
							</div>
							<!-- 	</div> -->

						</form>
					</div>

				</section>

				<jsp:include page="../common/footer.jsp"></jsp:include>

				<script src="../../resources/lib/bootstrap-maxlength/bootstrap-maxlength.js"></script>
				<script src="../../resources/lib/ios7-switch/ios7-switch.js"></script>
				<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
				<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
				<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
				<script type="text/javascript"
					src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

				<script>
					$(document).ready(function () {
						
						$('.transferbutton').click(function () {
							$('.transferlayer').toggle();
						});
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						console.log($("input#textprice"));
						$("input#textprice").on("keyup", function (e) {
							console.log("zzzzz")
							var value = $(e.currentTarget).val();
							var checkprice = $("#checkprice");

							console.log("value => ", value)

							console.log("checkprice => ", checkprice);

							console.log('length => ', value.length);
							if (value.length != 0) {
								checkprice.disabled = true;
								checkprice.attr("disabled", true);
							} else {
								checkprice.disabled = false;
								checkprice.attr("disabled", false);
							}
						})
					})



					$(function () { // 라디오박스 선택시 해당 val값 넣어주는 이벤트


						$("input:radio[name=form-check-input]").on("click", function () {

							var reservationNo = $(this).attr('id');

							var addr = $(this).closest("td[data-addr]");



							var transferArea = addr.data("addr")

							console.log("transferArea" + transferArea);

							var number = $("#number" + reservationNo); //이용 인원, 캠핑장 전화번호를 가진 요소를 담는다.

							var campcall = number.data("campcall");// 캠핑장 전화번호 

							var transferUserNum = number.data("transferUserNum");//이용인원

							var campname = $('#campName' + reservationNo).data("campname"); //캠핑장 이름

							var date = $('#date' + reservationNo); //이용 시작, 종료날짜

							var startdate = date.data("startdate")

							var enddate = date.data("enddate")

							$('#transferCampname').val(campname); //캠핑장
							$('#transferCampCall').val(campcall); //캠핑장전화번호
							$('#transferStartDate').val(startdate); //예약 시작,종료날짜
							$('#transferEndDate').val(enddate); //예약 시작,종료날짜 // input은 val로 값을 넣어준다. 
							$('#usernum').val(transferUserNum); //예약인원
							// $('#transferReservationNo').val(reservationNo); //예약번호
							$('#transferArea').val(transferArea); //캠핑장주소

							console.log("일단 라디오박스 체크 완료:::" + reservationNo + addr + number + campcall + transferUserNum + campname + date + startdate + enddate);


						});
					});


					function checkDisable(frm) {
						console.log(frm.checkprice);
						console.log(frm.transferPrice);
						if (frm.checkprice.checked == true) {
							frm.transferPrice.disabled = true;
							frm.transferPrice.value = "0";
						} else {

							frm.transferPrice.disabled = false;
						}
						// 체크박스 체크시 인풋박스 비활성화
					}

					$('#filebutton').click(function () {

						$('#file').click();

					});

					function uploadFile(e) {

						console.log("file Name:", e.value);

					}




					$(function () { // 양도 게시글 등록 이벤트

						$("button:button[name='Addtransfer']").on("click", function (e) {
							// e.preventDefault()
							fncAddTransfer();
						});
					});

					function fncAddTransfer() {

						console.log("fncAddTransfer 호출")

						var campname = $("input[name='transferCampname']").val(); //캠핑장 이름 
						var transferStartDate = $("input[name='transferStartDate']").val(); //양도예약시작날짜
						var transferEndDate = $("input[name='transferEndDate']").val(); //양도예약종료날짜
						var transferCampCall = $("input[name='transferCampCall']").val(); //캠핑장전화번호
						var transferUserNum = $("input[name='transferUserNum']").val(); //예약인원
						var transferPrice = $("input[name='transferPrice']").val(); // text 양도금액  
						console.log("transferPrice:::::" + transferPrice);

						var transferContent = $("textarea[name='transferContent']").val(); //양도내용
						var transferAddContent = $("textarea[name='transferAddContent']").val(); //양도추가내용
						var hashtags = $('#allhashtag').val().split('#'); //해쉬태그
						var paymentImg = $("input[name='paymentImg']").val();

						console.log($("input[name='paymentImg']").val());

						hashtags.shift(); // 첫번째 배열 삭제 

						console.log($('#allhashtag').val());
						console.log(hashtags);


						if (campname == '') {
							alert("캠핑장명을 입력해주세요.");
							$("input[name='transferCampname']").focus();
							return;
						}

						if (transferStartDate == '') {
							alert("예약시작일자를 입력해주세요.");
							$("input[name='transferStartDate']").focus();
							return;
						}

						if (transferEndDate == '') {
							alert("예약종료일자를 입력해주세요");
							$("input[name='transferEndDate']").focus();
							return;
						}

						if (transferCampCall == '') {
							alert("캠핑장 전화번호를 입력해주세요.");
							$("input[name='transferCampCall']").focus();
							return;
						}

						if (transferUserNum == '') {
							alert("예약인원을 입력해주세요");
							$("input[name='transferUserNum']").focus();
							return;
						}

						if (transferPrice == '') {
							alert("양도금액을 입력해주세요");
							$("input[name='transferPrice']").focus();
							return;
						}

						if (transferContent == '') {
							alert("양도사유를 입력해주세요");
							$("textarea[name='transferContent']").focus();
							return;
						}


						if (paymentImg == '') {
							alert("예약결제내역을 첨부해주세요");
							$("input[name='paymentImg']").focus();
							return;
						}

						if (hashtags.length > 4) {
							alert("해시태그는 최대 3개 까지 등록 가능합니다.");
							$('#allhashtag').focus();
							return;
						}


						hashtags.forEach((el, index) => { /* array item 하나씩, 그리고 그것의 index */

							var i = index + 1;  /* 0+1=1 , 1+1=2 , 2+1=3 .... 여기서 var는 hashtag앞에 붙일 숫자.  */

							$('#hashtag' + i).val('#' + el); /* #hashtag1, #hashtag2, #hashtag3에 val을 넣는다. el값 하나씩  */

							console.log("이것좀보세요" + $('#hashtag' + i).val());

						})


						if (confirm("등록하시겠습니까?")) {
							$("#transferform").attr("method", "POST").attr("action", "/transfer/addTransfer").attr("enctype", "multipart/form-data").submit();
						}




					}

				</script>
			</body>

			</html>