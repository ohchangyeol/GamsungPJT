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
				.mb-0 {
					color: #333064;
					font-weight: 400;
					font-size: xxx-large;
					color: #333064;
				}

				.my-report {
					font-size: 12px;
					color: #333064;
					font-family:
						'Noto Sans KR', sans-serif;
				}

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
						data-background="../../uploadfiles/transfer/transferhead.jpg"style="padding-top: 400px; padding-bottom: 185px;">
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

							<section class="panel">
								<header class="panel-heading">
									<div class="row">
										<h4 class="col-sm-7 mb-0"></h4>
										<div class="col-sm-5 mb-sm-0">
											<div class="row">
												<form role="form" class="transfer-search" method="post">
													<div class="col-sm-4">
														<select class="form-control" name="searchCondition">
															<option value="0" ${ ! empty search.searchCondition
																&& search.searchCondition==0 ? "selected" : ""
																}>제목+내용</option>
															<option value="1" ${ ! empty search.searchCondition
																&& search.searchCondition==1 ? "selected" : ""
																}>제목</option>
															<option value="2" ${ ! empty search.searchCondition
																&& search.searchCondition==2 ? "selected" : ""
																}>내용</option>
														</select>
													</div>
													<div class="col-sm-8">
														<div class="search-box">
															<input class="form-control" type="text"
																placeholder="Search..." name="searchKeyword"
																value="${search.searchKeyword}">
															<button class="search-btn" type="submit"><i
																	class="fa fa-search"></i></button>
														</div>
													</div>
													<input type="hidden" id="currentPage" name="currentPage"
														value="${resultPage.currentPage}" />

												</form>
											</div>
										</div>

									</div>
								</header>

								<div class="panel-body transferlist">
									<div class="table-responsive">
										<table class="table table-hover mb-none">
											<thead>
												<tr>
													<th style="text-align: center;">No</th>
													<th style="text-align: center;">[지역]양도캠핑장(숙소)</th>
													<th style="text-align: center;">제목</th>
													<th style="text-align: center;">양도금액</th>
													<th style="text-align: center;">이용일자(입/퇴실)</th>
													<th style="text-align: center;">양도자닉네임</th>
												</tr>
											</thead>

											<tbody>

												<c:set var="i" value="0" />
												<c:forEach var="transfer" items="${list}">
													<c:set var="i" value="${ i+1 }" />

													<tr class="transfer" style="cursor: pointer; text-align: center;">

														<!--no-->
														<td class="col-sm-1 center transferno" id="${transfer.transferNo}" >${ i }</td>

														<!--양도캠핑장(숙소)-->
														<td class="col-sm-2" id="campName">
															${transfer.transferArea}&ensp;${transfer.transferCampname}
														</td>

														<!--제목-->
														<td class="col-sm-3">${transfer.transferTitle}</td>

														<!--양도금액-->
														<td class="col-sm-2" id="date">${transfer.transferPrice}</td>

														<!--이용일자(입/퇴실)-->
														<td class="col-sm-2" name="price">${transfer.transferStartDate}
															ㅡ
															${transfer.transferEndDate}</td>

														<!-- 양도자닉네임 -->
														<td class="col-sm-2"><span
																style="color: rgb(20, 35, 55);">${transfer.transferOr.nickName}</span>
														</td>


													</tr>



												</c:forEach>
											</tbody>
										</table>
									</div>

									<jsp:include page="../common/pageNavigator.jsp" />

								</div>
							</section>




						</div>
					</section>

					<jsp:include page="../common/footer.jsp" />

			</main>

			<!-- <script src="../../../resources/js/servicecenter/report.js"></script> -->
			
			<script>

			$(document).ready(function(){
			    
			   /*$("#report-condition").on("change" , ()=>{
			        // console.log("변경");
			        $(".rerport-search").attr("method", "post").submit();
			    }) */
			    			    
			    $(".transferlist tbody tr").on("click" , (e)=>{
			        const transferNo = $(e.currentTarget).find(".transferno").attr('id');
			        console.log(transferNo);
			        self.location ="/transfer/getTransfer?transferNo="+transferNo;
			    });
			    
			    
			    fncGetList = (currentPage)=>{
			    $("#currentPage").val(currentPage);
			    $(".transfer-search").attr("method", "post").submit();
			    };
			    
			});
			
			
			
			
			
			</script>

		</body>

		</html>