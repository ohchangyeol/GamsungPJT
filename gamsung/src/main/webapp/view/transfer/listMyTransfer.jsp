<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<!DOCTYPE html>
			<html>

			<head>

				<meta charset="utf-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<!-- Document Title -->
				<title>listMyTransfer</title>






				<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
					rel="stylesheet" type="text/css">
				<!-- Vendor CSS -->
				<link href="../../resources/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
				<link href="../../resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
				<link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet" />
				<link href="../../resources/lib/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
				<!-- Theme CSS -->
				<link href="../../resources/css/theme.css" rel="stylesheet" />
				<!-- Skin CSS -->
				<link href="../../resources/css/skins/default.css" rel="stylesheet" />
				<!-- Theme Custom CSS -->
				<link href="../../resources/css/theme-custom.css" rel="stylesheet">
				<!-- Head Libs -->
				<script src="../../resources/lib/modernizr/modernizr.js"></script>
				<!-- JavaScripts -->
				<script src="../../resources/lib/jquery/jquery.js"></script>
				<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
				<script src="../../resources/lib/wow/wow.js"></script>
				<script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
				<script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
				<script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
				<script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
				<script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
				<script src="../../resources/lib/smoothscroll.js"></script>
				<script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
				<script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
				<script src="../../resources/js/plugins.js"></script>
				<script src="../../resources/js/main.js"></script>
				<!-- Kakao Map-->
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f8199ad71211c3df709f290a0e83244&libraries=services"></script>
				<!-- Default stylesheets-->
				<link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
				<!-- Template specific stylesheets-->
				<link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
				<link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
				<link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
				<link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
				<link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
				<link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
				<link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
				<link href="../../resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
				<!-- Main stylesheet and color file-->
				<link href="../../resources/css/style.css" rel="stylesheet">
				<link id="color-scheme" href="../../resources/css/colors/default.css" rel="stylesheet">

				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


				<style>
					.panel-body.table-responsive.table.table-hover.mb-none.tr {
						color: #2d2d2d;
					}
					
					
					
					.inner-wrapper {

    padding-top: 0px;
    }
					
					
					
					
					
					
				</style>

			</head>

			<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60"
				data-havingpoint="${user.havingPoint}" data-userid="${user.id}">

				<main>

					<jsp:include page="../common/header.jsp"></jsp:include>
	<section class="module bg-dark-30 about-page-header"
					data-background="../../uploadfiles/transfer/mytransfer.jpg"
					style="padding-top: 370px;
    padding-bottom: 390px;">

				</section>
					<div class="inner-wrapper" style="background: ghostwhite;">


						<section class="body">



							<div class="row" style="padding-top: 20px;">
					


								<div class="col-xs-12">



									<div class="row">


										<h4 class="col-sm-6 mb-0"></h4>




										<div class="col-sm-5 mb-sm-0">

											<div class="row">




												<form role="form" class="post-search" id="postPagenavi">
													<input type="hidden" id="currentPage" name="currentPage"
														value="0" />
													<div class="col-sm-2 form-check"
														style="text-align: center; padding: 0px; padding-top: 3px;">
														<input type="radio" class="btn-check" name="options"
															id="transfer-outlined" autocomplete="off" value="1"
															onclick="transfercheck();" ${ empty options || options==1
															? "checked" : "" }> <label class="btn btn-outline-success"
															style="padding: 0px; font-size:10px" for="success-outlined">${user.nickName}님의<br/>양도내역</label>
													</div>
													<div class="col-sm-2 form-check"
														style="text-align: center; padding: 0px; padding-top: 3px;">
														<input type="radio" class="btn-check" name="options"
															id="receive-outlined" autocomplete="off" value="2"
															onclick="receivecheck()" ${ ! empty options && options==2
															? "checked" : "" }> <label class="btn btn-outline-success"
															style="padding: 0px; font-size:10px "for="success-outlined">${user.nickName}님의<br/>양수내역</label>
													</div>
													<div class="col-sm-4">
														<select class="form-control" name="searchCondition"
															style="background: ghostwhite; color: #2d2d2d;">
															<option value="0" ${! empty search.searchCondition &&
																search.searchCondition==0 ? "selected" : "" }>제목
															</option>
														</select>
													</div>
													<div class="col-sm-4">
														<div class="search-box">
															<input class="form-control" type="text" name="searchKeyword"
																placeholder="Search..."
																style="background: ghostwhite; color: #2d2d2d;">
															<button class="search-btn" type="submit">
																<i class="fa fa-search"></i>
															</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>



									<div class="row" style="margin-top: 20px;">

										<div class="col-md-1"></div>

										<div class="col-md-10" style="padding-left: 0px;">





											<section class="panel">
												<div class="panel-body listmytransfer"
													style="background: ghostwhite ; padding-left: 0px;">
													<div class="table-responsive">
														<table class="table table-hover mb-none">

															<thead style="color: #2d2d2d; font-size: 12px;">
																<tr>
																	<c:if test='${options == 1}'>
																		<th style="text-align: center;">양도 번호</th>
																	</c:if> 
																	
																	<c:if test='${options == 2}'>
																		<th style="text-align: center;">양도❤양수번호</th>
																	</c:if>
																	
																	<th style="text-align: center;">[주소]양도캠핑장(숙소)</th>
																	<th style="text-align: center;">양도글제목</th>

																	<c:if test='${options == 2}'>
																		<th style="text-align: center;">양수글제목</th>
																	</c:if> 
																	
																	
																	<th style="text-align: center;">양도금액</th>
																	
																	<c:if test='${options == 1}'>
																		<th style="text-align: center;">양도등록일자</th>
																	</c:if>
																	
																	<c:if test='${options == 2}'>
																		<th style="text-align: center;">양수등록일자</th>
																	</c:if>
																	
																	<th style="text-align: center;">거래상태</th>
																</tr>
															</thead>


															<tbody style="color: #2d2d2d; font-size: 11px;">
																<c:set var="i" value="0" />
																<c:forEach var="transfer" items="${Transferlist}">
																	<c:set var="i" value="${i+1}" />

																	<tr class="transfer" value="${transfer.transferNo}" style="cursor: pointer; text-align: center; color: #0c0c4f">
																		<!--양도글번호-->
																		<td class="center transferno" id="${transfer.transferNo}">
																		    <c:if test='${options == 1}'>${transfer.transferNo}</c:if>
																			<c:if test='${options == 2}'>${transfer.transferNo} ❤️ ${transfer.receiveNo}</c:if>
																		</td>
																		
																		<!--양도캠핑장(숙소)-->
																		<td id="campName">
																			[<span>${transfer.transferArea}<span>]${transfer.transferCampname}
																		</td>

																		<!--양도글 제목-->
																		<td>${transfer.transferTitle}</td>


																		<!--양수글 제목-->
																		<c:if test='${options == 2}'>
																		 <td class="center receiveTitle" id="${transfer.receiveTitle}">														
																		${transfer.receiveTitle}
																		</td>
																		</c:if>

																		<!--양도금액-->
																		<td id="price">
																			${transfer.transferPrice}원</td>

																		<!-- 등록일자 -->
																		<td name="date">
																			<c:if test='${options == 1}'>
																				${transfer.transferRegdate}
																			</c:if>
																			<c:if test='${options == 2}'>
																				${transfer.receiveRegdate}
																			</c:if>

																		</td>


																		<!-- 거래상태 -->
																		<td>
																			<c:if test='${options == 1}'>
																				<span style="color: rgb(20, 35, 55);">
																					<c:if
																						test="${transfer.transferStatus == 1}">
																						양도 등록 </c:if>
																					<c:if
																						test="${transfer.transferStatus == 2}">
																						양도 승인 </c:if>
																					<c:if
																						test="${transfer.transferStatus == 3}">
																						양도 완료 </c:if>
																				</span>
																			</c:if>
																			<c:if test='${options == 2}'>
																				<c:if
																					test="${transfer.receiveStatus == 1}">
																					양수 등록 </c:if>
																				<c:if test="${transfer.receiveStatus == 2}">
																					양수 승인
																					<div>
																						<button type='button'
																							id="payment"
																							+"${transfer.receiveNo}"
																							class='btn btn-success btn-xs receive-btn'
																							data-receiveno="${transfer.receiveNo}"
																							data-transferor="${transfer.transferOr.id}"
																							data-transferprice="${transfer.transferPrice}"
																							data-transferno="${transfer.transferNo}"
																							style='height: 21px; color: #fff;'>양수결제
																						</button>

																					</div>
																		</td>
													</div>
													</c:if>
													<c:if test="${transfer.receiveStatus == 3}">
														양도양수 완료 </c:if>
													<c:if test="${transfer.receiveStatus == 4}">
														양도 미승인 </c:if>
													</c:if>
													</td>
													</tr>
													</c:forEach>
													</tbody>


													</table>
												</div>
										</div>
						</section>
					</div>

					<div class="col-md-1"></div>

					</div>

					</div>

					</div>

					<div class="row">
						<jsp:include page="../common/pageNavigator.jsp" />
					</div>

					</section>

					<!-- <form id="postPagenavi">
							<input type="hidden" id="currentPage" name="currentPage" value="0" />
							<input type="hidden" name="searchKeyword" value="${search.searchKeyword}"> <input
								type="hidden" name="searchCondition" value="${search.searchCondition}">
						</form> -->

					</div>

				</main>

				<script src="../../resources/lib/bootstrap/js/bootstrap.js"></script>
				<script src="../../resources/lib/nanoscroller/nanoscroller.css"></script>
				<script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
				<script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
				<script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
				<!-- Specific Page Vendor -->
				<script src="../../resources/lib/pnotify/pnotify.custom.js"></script>
				<!-- Theme Base, Components and Settings -->
				<script src="../../resources/js/theme.js"></script>
				<!-- Theme Custom -->
				<script src="../../resources/js/theme.custom.js"></script>
				<!-- Theme Initialization Files -->
				<script src="../../resources/js/theme.init.js"></script>
				<!-- Examples -->
				<script src="../../resources/js/examples.lightbox.js"></script>

				<script type="text/javascript">
					var currentPage = 1;

					function fncGetList(currentPage) {

						$("#currentPage").val(currentPage);
						$("#postPagenavi").attr("method", "POST").attr("action", "/transfer/listMyTransfer").submit();

					}

					$(function () {


						$(".commu_post").on("click", function () {

							self.location = "/community/getPost?postNo=" + $(this).attr("value");

						});


						$("#searchKeyword").keypress(function (e) {
							if (e.keyCode == 13) {
								$("#postPagenavi").attr("method", "POST").attr("action", "/transfer/listMyTransfer").submit();
							}
						});

						$("#search").on("click", function () {
							$("#postPagenavi").attr("method", "POST").attr("action", "/transfer/listMyTransfer").submit();
						});

			 			// 결제 이벤트

						$(".receive-btn").on("click", function () {

							//양도자랑 양수자 id랑 user의 포인트를 가지고 온다.

							var havingPoint = Number($("body").data("havingpoint"));
							var transferee = $("body").data("userid"); //양수자=본인
							var transferor = $(this).data("transferor"); //양도자
							var transferPrice = Number($(this).data("transferprice"));
							var transferno = $(this).data("transferno");
							var receiveno = $(this).data("receiveno");

							console.log(typeof transferno);

							console.log("havingPoint:::" + havingPoint);
							console.log("transferee:::" + transferee);
							console.log("transferee:::" + transferor);
							console.log("transferPrice:::" + transferPrice);

							console.log("차액계산:::" + (transferPrice - havingPoint));

							if ((havingPoint - transferPrice) < 0) {

								if (confirm("포인트가 부족하여 결제가 불가능합니다. 충전페이지로 이동하시겠습니까?")) {

									window.location = "/payment/managePoint"
								}

							} else {

								if (confirm("해당 양도금액만큼 포인트가 차감됩니다.")) {

									window.location = "/transfer/TransferPayment?transferor=" + transferor + "&transferPrice=" + transferPrice + "&receiveno=" + receiveno + "&transferno=" + transferno;

								}

							}


						});



						receivecheck = () => {
							$("#postPagenavi").attr("method", "POST").attr("action", "/transfer/listMyTransfer").submit();
							// $.ajax({
							// 	type: "get",
							// 	url: "/transfer/rest/listTransferForReceive",

							// 	success: function (list) {

							// 		$("#receiveminititle").text("나의 양수 내역 조회");
							// 		const table = $("table.table-hover.mb-none"); // 1. 테이블을 잡는다.
							// 		//const thead = table.find("thead");
							// 		let thead = table.find("thead");
							// 		thead.html('');
							// 		let thead_tr =
							// 			"<tr>" +
							// 			"<th style='text-align: center;'>양도양수번호</th>" +
							// 			"<th style='text-align: center;'>[주소]양도캠핑장(숙소)</th>" +
							// 			"<th style='text-align: center;'>양도글제목</th>" +
							// 			"<th style='text-align: center;'>양도금액</th>" +
							// 			"<th style='text-align: center;'>양수신청일자</th>" +
							// 			"<th style='text-align: center;'>거래상태</th>" +
							// 			"</tr>";
							// 		thead.append(thead_tr);
							// 		let tbody = table.find("tbody"); //2. 테이블의 하위요소 tbody를 잡는다 .
							// 		//thead.html("");
							// 		tbody.html(''); // 3. 하위요소를 비운다.
							// 		let number = 0;

							// 		list.forEach(el => { //el이 이 list의 하나 하나 하나 하나 하나
							// 			tbody = table.find("tbody"); // 요소를 한번더 잡는다.
							// 			let tbody_tr =
							// 				"<tr class='receive' value='${transfer.transferNo}'style='cursor: pointer; text-align: center;'>" +
							// 				"<td class='col-sm-1 center receiveno' id=" + el.transferNo + ">" + el.transferNo + "♥" + el.receiveNo + "</td>" + //등록+신청번호
							// 				"<td class='col-sm-2' id='campName'>[" + el.transferArea + "]" + el.transferCampname + "</td>" + //지역
							// 				"<td class='col-sm-3'>" + el.transferTitle + "</td>" + //제목
							// 				"<td class='col-sm-1' id='date'>" + el.transferPrice + "</td>" + //가격
							// 				"<td class='col-sm-1' name='price'>" + el.receiveRegdate + "</td>" + //양수신청일자
							// 				"<td class='col-sm-1'><span style='color: rgb(20, 35, 55);'>";
							// 			//jstl은 자바로 한번 읽힐때만 사용이 가능하다. 스크립트로 읽어서 문자열 처리로 들어간다.
							// 			//html에서 읽는거라서 안됨.
							// 			if (el.receiveStatus == 1) {
							// 				tbody_tr += "양수등록";
							// 			} else if (el.receiveStatus == 2) {
							// 				tbody_tr += "양수승인";
							// 			} else if (el.receiveStatus == 3) {
							// 				tbody_tr += "양도양수완료";
							// 			} else if (el.receiveStatus == 4) {
							// 				tbody_tr += "양수미승인";
							// 			}
							// 			tbody_tr += "</span>";
							// 			if (el.receiveStatus == 2) {

							// 				tbody_tr += "<div>" +

							// 					"<button type='button' id ='payment" + el.receiveNo + "' class='btn btn-success btn-xs' data-transferor=" + el.transferOr.id + " data-transferprice = " + el.transferPrice + " data-transferno=" + el.transferNo + " data-receiveno=" + el.receiveNo + " style='height: 21px; color: #fff;'>" +

							// 					"양수결제</button ></div ></td > ";
							// 			}

							// 			tbody_tr += "</tr>";

							// 			tbody.append(tbody_tr);


// 							 			// 결제 이벤트

// 										$("#payment" + el.receiveNo).on("click", function () {

// 											//양도자랑 양수자 id랑 user의 포인트를 가지고 온다.

// 											var havingPoint = Number($("body").data("havingpoint"));
// 											var transferee = $("body").data("userid"); //양수자=본인
// 											var transferor = $(this).data("transferor"); //양도자
// 											var transferPrice = Number($(this).data("transferprice"));
// 											var transferno = $(this).data("transferno");
// 											var receiveno = $(this).data("receiveno");

// 											console.log(typeof transferno);

// 											console.log("havingPoint:::" + havingPoint);
// 											console.log("transferee:::" + transferee);
// 											console.log("transferee:::" + transferor);
// 											console.log("transferPrice:::" + transferPrice);

// 											console.log("차액계산:::" + (transferPrice - havingPoint));

// 											if ((havingPoint - transferPrice) < 0) {

// 												if (confirm("포인트가 부족하여 결제가 불가능합니다. 충전페이지로 이동하시겠습니까?")) {

// 													window.location = "/payment/managePoint"
// 												}

// 											} else {

// 												if (confirm("해당 양도금액만큼 포인트가 차감됩니다.")) {

// 													window.location = "/transfer/TransferPayment?transferor=" + transferor + "&transferPrice=" + transferPrice + "&receiveno=" + receiveno + "&transferno=" + transferno;

// 												}

// 											}


// 										});

							// 		});
							// 		console.log(list);
							// 	},
							// 	error: function () {
							// 		console.log("deleteComment error::::");
							// 	}
							// });
						};//receivecheck END


						transfercheck = () => {
							$("#postPagenavi").attr("method", "POST").attr("action", "/transfer/listMyTransfer").submit();

							// $.ajax({
							// 	type: "get",
							// 	url: "/transfer/rest/listMyTransfer",

							// 	success: function (data) {
							// 		const list = data.Transferlist;
							// 		$("#receiveminititle").text("나의 양도 내역 조회");

							// 		const table = $("table.table-hover.mb-none"); // 1. 테이블을 잡는다.
							// 		//const thead = table.find("thead");



							// 		let thead = table.find("thead");

							// 		thead.html('');


							// 		let thead_tr =


							// 			"<tr>" +
							// 			"<th style='text-align: center;'>양도번호</th>" +
							// 			"<th style='text-align: center;'>[주소]양도캠핑장(숙소)</th>" +
							// 			"<th style='text-align: center;'>양도글제목</th>" +
							// 			"<th style='text-align: center;'>양도금액</th>" +
							// 			"<th style='text-align: center;'>양도등록일자</th>" +
							// 			"<th style='text-align: center;'>거래상태</th>" +
							// 			"</tr>";



							// 		thead.append(thead_tr);




							// 		let tbody = table.find("tbody"); //2. 테이블의 하위요소 tbody를 잡는다 .
							// 		//thead.html("");
							// 		tbody.html(''); // 3. 하위요소를 비운다.

							// 		let number = 0;

							// 		list.forEach(el => { //el이 이 list의 하나 하나 하나 하나 하나

							// 			tbody = table.find("tbody"); // 요소를 한번더 잡는다.


							// 			let tbody_tr =



							// 				"<tr class='receive' value='${transfer.transferNo}'style='cursor: pointer; text-align: center;'>" +

							// 				"<td class='col-sm-1 center receiveno' id=" + el.transferNo + ">" + el.transferNo + "</td>" + //양도글번호

							// 				"<td class='col-sm-2' id='campName'>[" + el.transferArea + "]" + el.transferCampname + "</td>" + //주소 캠핑장명

							// 				"<td class='col-sm-3'>" + el.transferTitle + "</td>" + //제목

							// 				"<td class='col-sm-1' id='date'>" + el.transferPrice + "</td>" + //양도금액

							// 				"<td class='col-sm-1' name='price' >" + el.transferRegdate + "</td>" + //양도등록일자

							// 				"<td class='col-sm-1'><span style='color: rgb(20, 35, 55);'>";




							// 			if (el.transferStatus == 1) {
							// 				tbody_tr += "양도등록";
							// 			} else if (el.transferStatus == 2) {
							// 				tbody_tr += "양도승인";
							// 			} else if (el.transferStatus == 3) {
							// 				tbody_tr += "양도완료";
							// 			}



							// 			tbody_tr += "</span></td></tr>";


							// 			tbody.append(tbody_tr);



							// 		});

							// 		console.log(list);


							// 	},
							// 	error: function () {

							// 		console.log("deleteComment error::::");

							// 	}

							// });

						} //transfercheck END

						//get transfer clkick 이벤트 
						
			             $(".listmytransfer tbody tr").on("click" , (e)=>{
			                 const transferNo = $(e.currentTarget).find(".transferno").attr('id');
			                 console.log(transferNo);
			                 self.location ="/transfer/getTransfer?transferNo="+transferNo;
			             });
						

					}); //function END

				</script>

			</body>

			</html>