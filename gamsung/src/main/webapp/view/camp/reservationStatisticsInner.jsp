<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>

<html lang="ko">

<head>
   <meta charset="utf-8">

   <!-- Bootstrap, jQuery CDN -->
   <meta name="viewport" content="width=device-width, initial-scale=1">   
   <script src="/resources/lib/jquery/jquery.js"></script>
   <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
   <link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css"></link>     
     
     
     <!-- ### headerCampBusiness resources Start ### -->     
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
    
    <!-- Main stylesheet and color file-->
   <link href="/resources/css/style.css" rel="stylesheet">
   <link id="color-scheme" href="/resources/css/colors/default.css" rel="stylesheet">       
     <!-- ### headerCampBusiness resources End ### -->
     
      
      <!-- ### list resources Start ### -->
   <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
   <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

     <!-- Design CDN -->
   <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
   <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.11.3/js/dataTables.semanticui.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" rel="stylesheet">
   <link href="https://cdn.datatables.net/1.11.3/css/dataTables.semanticui.min.css" rel="stylesheet">
     
     <script type="text/javascript">
              
      $(document).ready(function(){
         
         $.extend( $.fn.dataTable.defaults, { 
                  language: {
                     url: "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Korean.json"
                  } 
           }); 
         
          $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
              $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
          });

         
         $("#myTable").DataTable({
            "columnDefs": [{
                 "defaultContent": "-",
                 "targets": "_all"
               }],
            pageLength: 10,
            bPaginate: true,
            bLengthChange: true,
            lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],            
            processing: true,
            serverSide: false,
            scrollY: true,
            ordering: true,            
            searching: true,  
            ajax : {
                url :"/campGeneral/json/listMyReservationTable",
                type :"POST",
                dataSrc :''       
            },
            columns : [
                {data: "reservationNo"},
                {data: "camp.user.campName"},
                {data: "mainSite.mainSiteType"},
                {data: "totalPaymentPrice"},
                {data: "reservationStatus"},
                {data: "reservationRegDate"},
            ]
         
         });
      
      });
      
      
   </script>
  
   <style>
       body > div.container-fluid{
           margin-top: 70px;
       }
       
       .form-horizontal .control-label{
           text-align: left;
       }

       .sidebar-left {
         background-color: #171717 !important;
        }

   
   </style>   


</head>

<body id = "statisticschange" data-spy="scroll" data-target=".onpage-navigation" data-offset="60" style="overflow: hidden; width: 100%; height: 100%;">
         
            <!-- 화면 시작 -->
            <div class="container-fluid">   
               <div class="col-xs-1">
               </div>
               <div class="col-xs-10">
                  <form role="form">
               
            <!-- 상단 Start -->
            <div class="row">  
               <h3 class="col-sm-2 mb-0">&nbsp;&nbsp;&nbsp;&nbsp;예약내역</h3>           
            </div>
            <!-- 상단 End -->
               
            <hr class="divider-w mt-10 mb-20">
            
            <!-- 목록 Start -->            
            <div class="row">

            <table id="myTable" style="width: 100%;">
               <thead>
                  <tr>             
                     <th>예약번호</th>
                     <th>캠핑장</th>
                     <th>이용시설</th>
                     <th>이용금액</th>
                     <th>예약상황</th>
                     <th>예약날짜</th>
                  </tr>
               </thead>
            </table>
                     
            </div>
            <!-- 목록 End -->   

         </form>
      </div>
   <div class="col-xs-1">
   </div>         
</div>

</body>
</html>