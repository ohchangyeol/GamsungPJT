<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

    <title>캠핑장 예약 통계</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
		<meta name="author" content="JSOFT.net">

		<jsp:include page="/resources/commonCssAdmin.jsp"/>

    <style>
        
      #reservationStatistics {
        position: relative; /* absolute는 부모가 relative일 때 부모를 따라간다. */
        width: 100%;
      }
      
      #statistics {
        position: absolute;
        width: 100%; /* 부모에 맞게 꽉 채운다. */
        height: 100%;
      }

  </style>

	</head>
	<body class="admin-page">

    <section class="body">
  
      <jsp:include page="../common/adminHeader.jsp"/>
      
        <div class="inner-wrapper">

          <jsp:include page="../common/adminSidebar.jsp"/>
          
            <section role="main" class="content-body">
                <div class="row" id="reservationStatistics">
                  <iframe src="reservationStatisticsInner.jsp" scrolling="no" id="statistics" style="height: 100%; text-align: center;"></iframe>
                </div>
            </section>
        </div>

    </section>

</body>
</html>


