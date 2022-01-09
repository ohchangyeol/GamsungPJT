<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>경매 통계</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
		<meta name="author" content="JSOFT.net">

		<jsp:include page="/resources/commonCssAdmin.jsp"/>

	</head>
	<body class="admin-page">
		<section class="body">

			<!-- start: header -->
			<jsp:include page="../common/adminHeader.jsp"/>
			
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<jsp:include page="../common/adminSidebar.jsp"/>
				<!-- end: sidebar -->

				<section role="main" class="content-body">
				<h3><strong>금일 경매 통계</strong></h3>
					<div class="row">
						<div class="col-md-12 col-lg-12 col-xl-12">
							<div class="row">
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-primary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-legal"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">등록된 상품</h4>
														<div class="info">
															<strong class="amount">${todayAuction.addProductCount}개</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">금일 등록된 상품 총 개수입니다.</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-secondary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-secondary">
														<i class="fa fa-won"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">경매 수익</h4>
														<div class="info">
															<strong class="amount">14,890.30원</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">금일 거래중 발생한 수수료 총액 입니다.</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-tertiary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-shopping-cart"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">입찰 횟수</h4>
														<div class="info">
															<strong class="amount">${todayAuction.bidCount}번</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">금일 입찰 발생 총 횟수입니다.</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-quartenary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-user"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">방문자 수</h4>
														<div class="info">
															<strong class="amount">${todayAuction.realTimeViewCount}회</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">모든 상품에 대한 금일 조회수 입니다.</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-lg-12 col-xl-12">
							<section class="panel">
								<div class="panel-body">
									<h3><strong>연도 별 경매 통계</strong></h3>
									<!-- Flot: Basic -->
									<div class="chart chart-lg" id="flotDashBasic"></div>
									<script>

										var flotDashBasicData = 
											[${yearList[0]},${yearList[1]},${yearList[2]},${yearList[3]}];


									</script>
								</div>
							</section>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-lg-12 col-xl-12">
							<section class="panel">
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-8">
											<div class="chart-data-selector" id="salesSelectorWrapper">
												<h2>
													<strong>
														<select class="form-control" id="salesSelector">
															<option value="confirm" selected>작년 경매확정 통계</option>
															<option value="fail">작년 낙찰취소 & 중도철회 통계</option>	
															<option value="cancel">작년 경매 유찰 통계</option>														
														</select>
													</strong>
												</h2>
												<div id="salesSelectorItems" class="chart-data-selector-items mt-sm">
													<div class="chart chart-lg" data-sales-rel="confirm" id="flotDashSales1" class="chart-active"></div>
													<script>
														var flotDashSales1Data = [${lastYearList[0]}];
													</script>

													<!-- Flot: Sales JSOFT Drupal -->
													<div class="chart chart-lg" data-sales-rel="fail" id="flotDashSales2" class="chart-hidden"></div>
													<script>
														var flotDashSales2Data = [${lastYearList[2]},${lastYearList[3]}];
													</script>
													
													<!-- Flot: Sales JSOFT Drupal -->
													<div class="chart chart-lg" data-sales-rel="cancel" id="flotDashSales3" class="chart-hidden"></div>
													<script>
														var flotDashSales3Data = [${lastYearList[1]}];
													</script>
												</div>
											</div>
										</div>
										<div class="col-lg-4 text-center">
											<h2 class="panel-title mt-md"><strong>전년 대비</strong></h2>
											<div class="liquid-meter-wrapper liquid-meter-lg mt-lg">
												<div class="liquid-meter">
													<meter min="0" max="100" value="0" id="meterSales"></meter>
												</div>
												<div class="liquid-meter-selector" id="meterSalesSel">
													<a id="confirmJson" data-val="" class="active">경매확정</a>
													<a id="withdrawalJson" data-val="" >중도철회</a>
													<a id="cancelJson" data-val="" >낙찰취소</a>
													<a id="failJson" data-val="" >유찰</a>
												</div>
											</div>
											<strong id="rate"></strong>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
				</section>
			</div>

		</section>

		<jsp:include page="/resources/commonScriptAdmin.jsp"/>
		<script>
			/* 경매확정 */
			var confirmJson = JSON.parse('${yearList[0]}');
			var lastYearConfirm = Number(confirmJson.data[confirmJson.data.length-2][1]);

			var currentYearConfirm = 0;
			var confirmPercentage = 0;

			if(confirmJson.data.length != 0){
				currentYearConfirm = Number(confirmJson.data[confirmJson.data.length-1][1]);
				confirmPercentage = Math.round(currentYearConfirm/lastYearConfirm*100);
			}else{
				confirmPercentage = 0;
			}

			document.getElementById('meterSales').setAttribute('value',confirmPercentage);
			document.getElementById('confirmJson').setAttribute('data-val',confirmPercentage);
			
			var rate = document.getElementById('rate');
			
			rate.innerText = '작년 : '+lastYearConfirm+'회, 금년 : '+currentYearConfirm+'회';
			
			$(function(){
				
				/* 경매확정 */
				$('#confirmJson').on('click',function(){
					var confirmJson = JSON.parse('${yearList[0]}');
					var lastYearConfirm = Number(confirmJson.data[confirmJson.data.length-2][1]);

					var currentYearConfirm = 0;
					var confirmPercentage = 0;

					if(confirmJson.data.length != 0){
						currentYearConfirm = Number(confirmJson.data[confirmJson.data.length-1][1]);
						confirmPercentage = Math.round(currentYearConfirm/lastYearConfirm*100);
					}else{
						confirmPercentage = 0;
					}

					document.getElementById('meterSales').setAttribute('value',confirmPercentage);
					document.getElementById('confirmJson').setAttribute('data-val',confirmPercentage);
					
					rate.innerText = '작년 : '+lastYearConfirm+'회, 금년 : '+currentYearConfirm+'회';
				});
			
				/* 중도철회 */
			
				$('#withdrawalJson').on('click',function(){
					var withdrawalJson = JSON.parse('${yearList[1]}');
					var lastYearWithdrawal = Number(withdrawalJson.data[withdrawalJson.data.length-2][1]);
					
					var currentYearWithdrawal = 0;
					var withdrawalPercentage = 0;
					
					if(withdrawalJson.data.length != 0){
						currentYearWithdrawal = Number(withdrawalJson.data[withdrawalJson.data.length-1][1]);
						withdrawalPercentage = Math.round(currentYearWithdrawal/lastYearWithdrawal*100);
					}else{
						withdrawalPercentage = 0;
					}
					document.getElementById('meterSales').setAttribute('value',withdrawalPercentage);
					document.getElementById('withdrawalJson').setAttribute('data-val',withdrawalPercentage);
					rate.innerText = '작년 : '+lastYearWithdrawal+'회, 금년 : '+currentYearWithdrawal+'회';
				});
				
				/* 낙찰취소 */
				
				$('#cancelJson').on('click',function(){
					var cancelJson = JSON.parse('${yearList[2]}');
					var lastYearCancel = Number(cancelJson.data[cancelJson.data.length-2][1]);
					
					var currentYearCancel = 0;
					var cancelPercentage = 0;
					
					if(cancelJson.data.length != 0){
						currentYearCancel = Number(cancelJson.data[cancelJson.data.length-1][1]);
						cancelPercentage = Math.round(currentYearCancel/lastYearCancel*100);
					}else{
						cancelPercentage = 0;
					}
					document.getElementById('meterSales').setAttribute('value',cancelPercentage);
					document.getElementById('cancelJson').setAttribute('data-val',cancelPercentage);
					rate.innerText = '작년 : '+lastYearCancel+'회, 금년 : '+currentYearCancel+'회';
				});
				
				/* 유찰 */
				
				$('#failJson').on('click',function(){
					var failJson = JSON.parse('${yearList[3]}');
					var lastYearFail = Number(failJson.data[failJson.data.length-2][1]);
					
					var currentYearFail = 0;
					var failPercentage = 0;
					
					if(failJson.data.length != 0){
						currentYearFail = Number(failJson.data[failJson.data.length-1][1]);
						failPercentage = Math.round(currentYearFail/lastYearFail*100);
					}else{
						failPercentage = 0;
					}
					document.getElementById('meterSales').setAttribute('value',failPercentage);
					document.getElementById('failJson').setAttribute('data-val',failPercentage);
					rate.innerText = '작년 : '+lastYearFail+'회, 당월 : '+currentYearFail+'회';
				});
			});
			
			
	
			
			
		</script>
	</body>
</html>