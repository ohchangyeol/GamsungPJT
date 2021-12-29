<%@ page contentType="text/html; charset=EUC-KR" %>

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
	
	<!-- CSS -->
	<style>
		body > div.container{
			margin-top: 70px;
		}
    </style>

	<!-- JavaScript -->
	<script type="text/javascript">

		// 버튼
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#confirm").on("click" , function() {
				$("form").attr("method" , "get").attr("action" , "/campBusiness/listMainSite").submit();
			});
			
			$("#update").on("click" , function() {
				alert("수정화면으로 전환합니다.")
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateMainSiteView").submit();
			});
			
			$("#delete").on("click" , function() {
				if (confirm("'확인'을 누르시면 삭제가 됩니다 \n삭제 후에는 복구가 불가능합니다.") == true){    
					$("form").attr("method" , "POST").attr("action" , "/campBusiness/deleteMainSite").submit();
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
	<div class="container">		
	<form>
	
	<input type="hidden" name="campNo" value="${camp.campNo}">
	<input type="hidden" name="mainSiteNo" value="${mainSite.mainSiteNo}">
	
		<div class="page-header">
	       <h3 class=" text-info">주요시설 상세정보</h3>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 등록번호</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteNo}</div>
		</div>
						
		<hr/>
	    	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteRegDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 유형</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteType}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 이름</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 크기</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteSize}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 위치(구역번호)</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteSection}</div>
		</div>
		
		<hr/>							
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>기본 사용인원수</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteMinCapacity}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>최대 사용인원수</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteMaxCapacity}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>기본인원 금액</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteMinPrice}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>추가인원 금액</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteAddPrice}</div>
		</div>
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주차가능 대수</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteParkingSize}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 설명</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteInfo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 사진1</strong></div>
			<img src="../uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg1}" />
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 사진2</strong></div>
			<img src="../uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg2}" />
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주요시설 사진3</strong></div>
			<img src="../uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg3}" />
		</div>
		 							  		  
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button id="delete" type="button" class="btn btn-primary">삭제</button>
				<button id="update"type="button" class="btn btn-primary">수정</button>
				<button id="confirm" type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
		
	</form>	  	
 	</div>

</body>

</html>