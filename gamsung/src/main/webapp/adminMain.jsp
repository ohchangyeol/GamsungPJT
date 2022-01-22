<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>관리자메인</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
		<meta name="author" content="JSOFT.net">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

		<jsp:include page="/resources/commonCssAdmin.jsp"/>

	</head>
	<body >
		<section class="body">

			<!-- start: header -->
			
			<jsp:include page="./view/common/adminHeader.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<jsp:include page="./view/common/adminSidebar.jsp"/>
				<!-- end: sidebar -->

				<section role="main" class="content-body" style="padding-top: 0px;">
					
					<h3><strong>감성캠프 사이트 통계</strong></h3>

						<div class="row">
							
							<div class="col-md-3">
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
													<h4 class="title">예약자 수</h4>
													<div class="info">
														<strong class="amount">${reservationStatistics.dayCount} 건</strong>
													</div>
												</div>
												<div class="summary-footer">
													<a class="text-muted text-uppercase">금일 총 예약자 수</a>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
							
							<div class="col-md-3">
								<section class="panel panel-featured-left panel-featured-primary">
									<div class="panel-body">
										<div class="widget-summary">
											<div class="widget-summary-col widget-summary-col-icon">
												<div class="summary-icon bg-primary">
													<i class="fa fa-life-ring"></i>
												</div>
											</div>
											<div class="widget-summary-col">
												<div class="summary">
													<h4 class="title">처리되지 않은 신고 수</h4>
													<div class="info">
														<strong class="amount report-count"></strong>
														<span class="text-primary"></span>
													</div>
												</div>
												<div class="summary-footer">
													<a class="text-muted text-uppercase" href="/servicecenter/listReport">신고 내역 바로가기</a>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
							<div class="col-md-3">
								<section class="panel panel-featured-left panel-featured-secondary">
									<div class="panel-body">
										<div class="widget-summary">
											<div class="widget-summary-col widget-summary-col-icon">
												<div class="summary-icon bg-secondary">
													<i class="fa fa-usd"></i>
												</div>
											</div>
											<div class="widget-summary-col">
												<div class="summary">
													<h4 class="title">미답변 Q&A 수</h4>
													<div class="info">
														<strong class="amount qna-count"></strong>
													</div>
												</div>
												<div class="summary-footer">
													<a class="text-muted text-uppercase" href="/servicecenter/listQna" >Q&A 바로 가기</a>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
							
							
							<div class="col-md-3">
								<section class="panel panel-featured-left panel-featured-secondary">
									<div class="panel-body">
										<div class="widget-summary">
											<div class="widget-summary-col widget-summary-col-icon">
												<div class="summary-icon bg-secondary">
													<i class="fa fa-usd"></i>
												</div>
											</div>
											<div class="widget-summary-col">
												<div class="summary">
													<h4 class="title">사이트수익</h4>
													<div class="info">
														<strong class="amount">${siteProfitStatistics.profitAllPayment} ₩</strong>
													</div>
												</div>
												<div class="summary-footer">
													<a class="text-muted text-uppercase">${siteProfitStatistics.profitRegDate}</a>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
							
						</div>


					
						<div class="row">
							<div class="col-md-6">
								<h3><strong>전년 대비 예약자 수</strong></h3>
								<!--차트가 그려질 부분-->
								<canvas id="reservation_chart"></canvas>
								<div style="text-align: center; padding: 10px;">
									<span>일/주/월/년 예약자수 비교</span>
								</div>
								<input type="hidden" id="reservation_statistics_data" 
										day="${reservationStatistics.dayCount}" 
										week="${reservationStatistics.weekCount}" 
										month="${reservationStatistics.monthCount}" 
										year="${reservationStatistics.yearCount}" 
										beforeday="${reservationStatistics.beforeYearDayCount}" 
										beforeweek="${reservationStatistics.beforeYearWeekCount}" 
										beforemonth= "${reservationStatistics.beforeYearMonthCount}" 
										beforeyear="${reservationStatistics.beforeYearYearCount}">

							</div>
							
							<div class="col-md-6">
								<h3><strong>사이트 거래액</strong></h3>
								<!--차트가 그려질 부분-->
								<canvas id="siteProfit_chart"></canvas>
								<div style="text-align: center; padding: 10px;">
									<span>${siteProfitStatistics.profitRegDate}</span>
								</div>
							</div>
						</div>

					</section>
				</div>
				
		</section>

		<jsp:include page="/resources/commonScriptAdmin.jsp"/>
	

		<script type="text/javascript">

			$(document).ready(function () {
				$.ajax({
					url : "/servicecenter/rest/adminMain" ,
					method : "GET" ,
					dataType : "json" ,
					success : function(JSONData , status) {
					console.log(JSONData);
					console.log(JSONData.qnaCount);
					$(".qna-count").text(JSONData.qnaCount);
					$(".report-count").text(JSONData.reportCount);
					}
				})
			});

			let day = $('#reservation_statistics_data').attr("day"),
				week = $('#reservation_statistics_data').attr("week"),
				month = $('#reservation_statistics_data').attr("month"),
				year = $('#reservation_statistics_data').attr("year"),
				beforeday = $('#reservation_statistics_data').attr("beforeday"),
				beforeweek = $('#reservation_statistics_data').attr("beforeweek"),
				beforemonth = $('#reservation_statistics_data').attr("beforemonth"),
				beforeyear = $('#reservation_statistics_data').attr("beforeyear");


            let reservation_context = document
                .getElementById('reservation_chart')
                .getContext('2d');

            var reservation_chart = new Chart(reservation_context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '일일','주간','월간', '년간'
                    ],
                    datasets: [
                        { //데이터
                            label: '올해', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
								day,week,month,year //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                            ],
                            borderWidth: 1 //경계선 굵기
                        } ,
                        {
                            label: '작년',
                            fill: false,
                            data: [
								8,42,128,832
                            ],
                            backgroundColor: [
								'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
								'rgb(168, 0, 0, 0.2)',
								'rgb(157, 109, 12, 0.2)',
							],
                            borderColor: [
								'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
								'rgb(168, 0, 0, 1)',
								'rgb(157, 109, 12, 1)',
							],
							borderWidth: 1
                        } 
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
            

            let other_context = document
            .getElementById('siteProfit_chart')
            .getContext('2d');

			var siteProfit_chart = new Chart(other_context, {
				type: 'bar', 													// 차트의 형태
                data: { 														// 차트에 들어갈 데이터
		                labels:	['단위 : (원)'], 						//x 축
		                datasets: [
				                	{
				                		type: 'bar', 							// 차트의 형태
					                    label: '포인트 충전',
					                    fill : false,        					// 채우기 없음
					                    lineTension : 0,  						// 0이면 꺾은선 그래프, 숫자가 높을수록 둥글해짐
					                    pointRadius : 0,    					// 각 지점에 포인트 주지 않음
					                    backgroundColor: 'gray',
					                    borderColor: 'gray',
					                    data: [${siteProfitStatistics.profitPointCharge}]
				                	
				                	}, 
				                	{
				                		type: 'bar', 	
					                    label: '포인트 결제',
					                    fill : false,        					
					                    lineTension : 0,  						
					                    pointRadius : 0,    					
					                    backgroundColor: 'green',
					                    borderColor: 'green',
					                    data: [${siteProfitStatistics.profitPointPayment}]
				                	
				                	}, 
				                	{
				                		type: 'bar', 	
					                    label: '일반 결제',
					                    fill : false,        
					                    lineTension : 0, 
					                    pointRadius : 0,    
					                    backgroundColor: 'blue',
					                    borderColor: 'blue',
					                    data: [${siteProfitStatistics.profitRegularPayment}]
				                	}, 
				                	{	
				                		type: 'bar', 
					                    label: '전체 결재',
					                    fill : false,
					                    lineTension : 0,
					                    pointRadius : 0,
					                    backgroundColor: 'orange',
					                    borderColor: 'orange',
					                    data: [${siteProfitStatistics.profitAllPayment}]
				               		}
				                ]
               	},
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });


        </script>
	</body>
</html>