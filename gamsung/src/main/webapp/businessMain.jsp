<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Document Title -->
    <title>GamsungCamp</title>
    
    <script src="/resources/lib/jquery/jquery.js"></script>
    
    <!-- Favicons -->
    <meta name="msapplication-TileImage" content="/resources/images/favicons/ms-icon-144x144.png">    
    <meta name="msapplication-TileColor" content="#ffffff">  
    <meta name="theme-color" content="#ffffff">
   
    <!-- Stylesheets -->
    
    <!-- Default stylesheets-->
    <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template specific stylesheets-->
    <link href="/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="/resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">       
    
    <!-- Main stylesheet and color -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="/resources/css/colors/default.css" rel="stylesheet">  
    
    <!-- fullcalender -->
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">


	<script>
		
	    document.addEventListener('DOMContentLoaded', function() {
	    	
	    	let campNo = $("#campNo").val();
			console.log("campNo : " +campNo);
	  	  
			var calendarEl = document.getElementById('calendar');
			
			var calendar = new FullCalendar.Calendar(calendarEl, {
				
				headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,listWeek'
				},
				locale: 'ko', 													// 한국어 설정
				initialView: 'dayGridMonth',
			  	height: '750px',
			  	expandRows: true, 												// 화면에 맞게 높이 재설정
			  	dayMaxEvents: true, 											// 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			  	nowIndicator: true, 											// 현재 시간 마크
			  	contentHeight: 'auto',
			  	editable: false,
			    droppable: false,
			  	events: function(info, successCallback, failureCallback) {
					$.ajax({
						url: '/campBusiness/rest/listCampReservationJSON?campNo='+campNo,
						type: 'GET',
						dataType: 'json',
						success: 
							function(result) {
					          
								console.log(result);
								
								 var events = [];
								
								 if(result != null){
									 
									 $.each(result, function(index, element) {
		                                 
		                                 events.push({
                                             title: element.title,
                                             start: element.start,
                                             end: element.end,
                                             url: element.url,
                                             color: element.color,
                                             textColor : element.textColor,
                                             allday : element.allday
                                          }); 									//.push()
											
									 }); 										//.each()
									 console.log(events);

								 }												//if end   
					
		                 successCallback(events);  
					     }														//success: function end 
					
					}); 														//ajax end
					
			  	},																//events:function end 
					
			});																	//new FullCalendar end
			calendar.render();
			
	    });
	    
 </script>
	
	<style>
	    body > div.container{
	        margin-top: 60px;
	    }
	    
	    .form-horizontal .control-label{
	        text-align: left;
	    	
	</style>

</head>
	  
<body>

	<!-- header -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />
	<!-- header End -->
	
	<div class="container">
	
		<div class="row">
			<div class="sub-title">
				<h3>${user.campName} [${user.id}] 예약현황</h3>			
			</div>
		</div>
		
		<div class="row">	
			<div id='calendar'></div>	
		</div>
		

	</div>

	


	     
    <!-- JavaScripts -->
    <script src="/resources/lib/jquery/jquery.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/lib/wow/wow.js"></script>
    <script src="/resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="/resources/lib/isotope/isotope.pkgd.js"></script>
    <script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="/resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="/resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="/resources/lib/smoothscroll.js"></script>
    <script src="/resources/lib/magnific-popup/magnific-popup.js"></script>
    <script src="/resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="/resources/js/plugins.js"></script>
    <script src="/resources/js/main.js"></script>
      
</body>

</html>