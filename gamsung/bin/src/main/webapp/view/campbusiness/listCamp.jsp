<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>

<html lang="ko">

<head>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  	<style>
	  body {
            padding-top : 50px;
        }
    </style>

	<script type="text/javascript">
	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/campBusiness/listCamp").submit();
	}

	$(function() {
		 
		$( "button.btn.btn-default"  ).on("click" , function() {
			fncGetList(1);
		}); 
		 
		$( "td:nth-child(2)" ).on("click" , function() {
			self.location ="/campBusiness/getCamp?campNo="+$(this).attr("data-campNo");
		});
					
		//==> LINK Event End User 에게 보일수 있도록 
		$( "td:nth-child(2)" ).css("color" , "red");		
	
	});	
    
</script>
</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />
   	
   	<!-- Page Start -->
	<div class="container">
		<div class="page-header text-info">
			<h3>캠핑장 전체 목록</h3>
	    </div>
	    
	    <!-- 상단 -->
	    <div class="row">
	    
	    	<div class="col-md-6 text-left">
				<p class="text-primary">
		    		전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
			</div>
		
			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">
			    
					<div class="form-group">
						<select class="form-control" name="searchCondition" >
							<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>캠핑장명</option>
							<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>캠핑장명</option>
							<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>도서가격</option>
						</select>
					</div>
					  
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
					    <input type="text"  class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>
					  
					<button type="button" class="btn btn-default">검색</button>
					  
					<!-- PageNavigation Page value -->
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    
	    </div>
	    
		<!-- 하단 -->
		<table class="table table-hover table-striped" >
      
			<thead>
				<tr>
            		<th align="left">No</th>
            		<th align="left">캠핑장명</th>
          			<th align="left">평점</th>
          			<th align="left">전월 예약수</th>
          			<th align="left">전월 조회수</th>          			
          			<th align="left">당월 조회수</th>
           			<th align="left">등록일</th>          	
           			<th align="left">Blind</th>          			
				</tr>
       		</thead>
       		
       		<tbody>     
				<c:set var="i" value="0" />
		  		<c:forEach var="camp" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
			  			<td align="left">${ i }</td>				
			  			<td align="left" data-campNo="${camp.campNo}">${camp.user.campName}</td>
          				<td align="left">${camp.campRate}</td>
          				<td align="left">${camp.campReservationCount}</td>
          				<td align="left">${camp.campViewCountCurrentMonth}</td>
          				<td align="left">${camp.campViewCountPreviousMonth}</td>
	           			<td align="left">${camp.campRegDate}</td>
	           			<td align="left">
	 						<c:if test="${ empty camp.deleteFlag || camp.deleteFlag == 'true'}">		
								T
							</c:if>	
	           			</td> 
					</tr>
          		</c:forEach>
        	</tbody>
      
      </table>
	  
 	</div>
 	
 	<!-- PageNavigation -->
	<jsp:include page="../common/pageNavigator.jsp"/>
	
</body>

</html>
	