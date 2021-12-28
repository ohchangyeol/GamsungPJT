<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>

<html lang="ko">

<head>

	<meta charset="EUC-KR">
	
	<!-- Bootstrap, jQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >	
	
	<script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
  
  	<style>
	  body {
            padding-top : 50px;
        }
    </style>

	<script type="text/javascript">
	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/campBusiness/listMainSite").submit();
	}

	$(function() {
		 
		$( "button.btn.btn-default"  ).on("click" , function() {
			fncGetList(1);
		}); 
		 
		var role = $('input[name=role]').val()
		
		
		if (role == 'ADMIN'){
			
			$( "td:nth-child(3)" ).on("click" , function() {
				self.location ="/campBusiness/getMainSite?mainSiteNo="+$(this).attr("data-mainSiteNo");
			});
			
			$( "td:nth-child(3)" ).css("color" , "red");
			
		} else {
			
			$( "td:nth-child(2)" ).on("click" , function() {
				self.location ="/campBusiness/getMainSite?mainSiteNo="+$(this).attr("data-mainSiteNo");
			});
			
			$( "td:nth-child(2)" ).css("color" , "red");
		}
	
	});	
    
</script>
</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />
   	
   	<!-- Page Start -->
	<div class="container">
		<div class="page-header text-info">
			<h3>주요시설 목록</h3>
	    </div>
	    
	    <input type="hidden" name="campNo" value="${mainSite.campNo}">  
	    	    
	    <!-- 상단 -->
	    <div class="row">
	    
	    	<div class="col-md-6 text-left">
				<p class="text-primary">
		    		전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
			</div>
		
			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">
				<input type="hidden" name="campNo" value="${campSession.campNo}">
				<input type="hidden" name="role" value="${campSession.user.role}">
			    
					<div class="form-group">
						<select class="form-control" name="searchCondition" >
							<c:if test="${ campSession.user.role eq 'ADMIN' }">
            					<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>캠핑장명</option>
            				</c:if> 
							<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>주요시설명</option>
							<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>유형</option>
							<option value="3" ${! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>구역번호</option>
							<option value="4" ${! empty search.searchCondition && search.searchCondition==4 ? "selected" : "" }>예약자명</option>
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
            		<c:if test="${ campSession.user.role eq 'ADMIN' }">
            			<th align="left">캠핑장명</th>
            		</c:if>
            		<th align="left">이름</th>
            		<th align="left">유형</th>
          			<th align="left">구역번호</th>
           			<th align="left">에약시작일</th>          	
           			<th align="left">예약종료일</th>
           			<th align="left">예약자명</th>           			         			
				</tr>
       		</thead>
       		
       		<tbody>      		
				<c:set var="i" value="0" />
		  		<c:forEach var="mainSite" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
			  			<td align="left">${ i }</td>
			  			<c:if test="${ campSession.user.role eq 'ADMIN' }">
			  				<td align="left" data-campNo="${mainSite.campNo}">${mainSite.campName}</td>	
			  			</c:if>  			
			  			<td align="left" data-mainSiteNo="${mainSite.mainSiteNo}">${mainSite.mainSiteName}</td>
			  			<td align="left">${mainSite.mainSiteType}</td>
          				<td align="left">${mainSite.mainSiteSection}</td>
	           			<td align="left">${mainSite.mainSiteReservationStart}</td>
	           			<td align="left">${mainSite.mainSiteReservationEnd}</td>
	           			<td align="left">${mainSite.mainSiteReservationUserName}</td>
					</tr>
          		</c:forEach>
        	</tbody>
      
      </table>
	  
 	</div>
 	
 	<!-- PageNavigation -->
	<jsp:include page="../common/pageNavigator.jsp"/>
	
</body>

</html>
	