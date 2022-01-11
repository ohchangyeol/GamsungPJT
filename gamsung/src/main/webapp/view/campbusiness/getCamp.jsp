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
	
	<!-- JavaScript -->
	<script type="text/javascript">

		// 버튼
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#confirm").on("click" , function() {
				window.self.location = "/campBusiness/goSubMainCampBusiness";
			});
			
			$("#update").on("click" , function() {
				alert("수정화면으로 전환합니다.")
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateCampView").submit();
			});
			
			$("#delete").on("click" , function() {
				if (confirm("'확인'을 누르시면 삭제가 됩니다 \n삭제 후에는 복구가 불가능합니다.") == true){    
					$("form").attr("method" , "POST").attr("action" , "/campBusiness/deleteCamp").submit();
				} else {
				    return;
				}			
			});
		
		});	

</script>		
	    
</head>

<body>

	<!-- headerCampBusiness -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />

	<!-- Page Start -->
	<form>	
	<div class="container">		
		
	    <input type="hidden" name="campNo" value="${camp.campNo}">	
	    		
	    <br>
	    <br>	
		<div class="page-header">
	       <h3 class=" text-info">캠핑장 상세정보</h3>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 control-label"><strong>사업자회원ID</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.id}</div>
		</div>
		
		<hr/>
		    	
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>등록번호</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campNo}</div>
		</div>
		
		<br>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campRegDate}</div>
		</div>
		
		<hr/>
					
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>캠핑장 이름</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.campName}</div>
		</div>
		
		<br>			
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>주소</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.addr}</div>
		</div>
		
		<br>
	
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>전화번호</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.campCall}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>테마</strong></div>
			<div class="col-xs-2 col-md-2">${camp.campTheme1}</div>				
			<div class="col-xs-2 col-md-2">${camp.campTheme2}</div>
		</div>
					
		<br>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>자연경관</strong></div>
			<div class="col-xs-2 col-md-2">${camp.campNature1}</div>
			<div class="col-xs-2 col-md-2">${camp.campNature2}</div>
		</div>
		
		<br>
					
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>첫번째 운영유형</strong></div>
			<div class="col-xs-2 col-md-2">
				<c:choose>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '상시'}"> 
						상시
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '봄'}"> 
						봄 (3월~5월)
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '여름'}"> 
						여름 (6월~8월)
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '가을'}"> 
						가을 (9월~11월)
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '겨울'}"> 
						겨울 (12월~2월)
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '주중'}"> 
						주중
					</c:when>
					<c:otherwise>
						주말
					</c:otherwise>
				</c:choose>	
			</div>
			<div class="col-xs-4 control-label">
				<c:choose>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '상시'}"> 
						상시
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '봄'}"> 
						봄 (3월~5월)
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '여름'}"> 
						여름 (6월~8월)
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '가을'}"> 
						가을 (9월~11월)
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '겨울'}"> 
						겨울 (12월~2월)
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '주중'}"> 
						주중
					</c:when>
					<c:otherwise>
						주말
					</c:otherwise>
				</c:choose>	
			</div>
		</div>
		
		<hr/>				
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>평점</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campRate}</div>
		</div>
		
		<br>			
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>예약수</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campReservationCount}</div>
		</div>
		
		<br>
					
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>현월 조회수</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campViewCountCurrentMonth}</div>
		</div>
	
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>요약정보</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campSummery}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">	
			<div class="form-group">
		        <label for="campMapFile" class="col-xs-4 control-label">캠핑장 지도이미지 </label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campMapImg}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">           
		    <div class="form-group">
		        <label for="campImgFile1" class="col-xs-4 control-label">캠핑장 전경이미지(1/5)</label>
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg1}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">		    
		    <div class="form-group">
		        <label for="campImgFile2" class="col-xs-4 control-label">캠핑장 전경이미지(2/5)</label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg2}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">    
		    <div class="form-group">
		        <label for="campImgFile3" class="col-xs-4 control-label">캠핑장 전경이미지(3/5)</label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg3}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">
		    <div class="form-group">
		        <label for="campImgFile4" class="col-xs-4 control-label">캠핑장 전경이미지(4/5)</label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg4}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">   
		    <div class="form-group">
		        <label for="campImgFile5" class="col-xs-4 control-label">캠핑장 전경이미지(5/5)</label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg5}" />
		            </div>
		    </div>	
		</div>
					
		<br>
		<br>
		
		<div class="row">	
	        <div class="col-xs-2">
	            <button id="delete" type="button" class="btn btn-danger">삭제</button>
	        </div>
	        
	        <div class="col-xs-1">
	           	<button id="update"type="button" class="btn btn-warning">수정</button>
	        </div>
	        
	        <div class="col-xs-1 col-xs-offset-7">
	            <button id="confirm" type="button" class="btn btn-primary">확인</button>
		    </div>										  		  	
		</div>	

	</div>			
	</form>

</body>

</html>