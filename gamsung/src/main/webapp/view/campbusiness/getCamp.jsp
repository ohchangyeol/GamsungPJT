<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- Bootstrap, jQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
	<!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!-- CSS -->
	<style>
		body > div.container{
			margin-top: 90px;
		}
    </style>

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

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />

	<!-- Page Start -->
	<form>	
	<div class="container">	
	
	    <input type="hidden" name="campNo" value="${camp.campNo}">	
	    	
	 
	    <br>
	    <br>
	    <br>	
		<div class="page-header">
	       <h3 class=" text-info">캠핑장 상세정보</h3>
	    </div>
		    	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 등록번호</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>사업자회원ID</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.id}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 이름</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.campName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 주소</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.addr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 전화번호</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.campCall}</div>
		</div>
		
		<hr/>							
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 평점</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campRate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>예약수</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campReservationCount}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 이번달 조회수</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campViewCountCurrentMonth}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 지난달 조회수</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campViewCountPreviousMonth}</div>
		</div>
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 요약정보</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campSummery}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campRegDate}</div>
		</div>
		
		<hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 테마1</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campTheme1}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 테마2</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campTheme2}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 자연1</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campNature1}</div>
		</div>
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 자연2</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campNature2}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 운영1</strong></div>
			<div class="col-xs-8 col-md-4">
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
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 운영2</strong></div>
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
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 지도이미지</strong></div>
			<img src="/uploadFiles/campimg/campbusiness/camp/${camp.campMapImg}" />
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 전경1</strong></div>
			<img src="/uploadFiles/campimg/campbusiness/camp/${camp.campImg1}" />
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 전경2</strong></div>
			<img src="/uploadFiles/campimg/campbusiness/camp/${camp.campImg2}" />
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 전경3</strong></div>
			<img src="/uploadFiles/campimg/campbusiness/camp/${camp.campImg3}" />
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 전경4</strong></div>
			<img src="/uploadFiles/campimg/campbusiness/camp/${camp.campImg4}" />
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>캠핑장 전경5</strong></div>
			<img src="/uploadFiles/campimg/campbusiness/camp/${camp.campImg5}" />
		</div>	
					
		<br>
		<br>			
								  		  
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button id="delete" type="button" class="btn btn-primary">삭제</button>
				<button id="update"type="button" class="btn btn-primary">수정</button>
				<button id="confirm" type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
		
		
		</div>
	</form>  
</body>

</html>