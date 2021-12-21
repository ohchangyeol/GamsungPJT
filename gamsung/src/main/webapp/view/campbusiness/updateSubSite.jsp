<%@ page contentType="text/html; charset=EUC-KR" %>

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
			margin-top: 70px;
		}
    </style>

	<!-- JavaScript -->
	<script type="text/javascript">
	
	// 버튼
	$(function() {
		
		$("#update").on("click" , function() {
			alert("캠핑장정보를 수정합니다.");
			$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateSubSite").submit();
		});
		
		$("#cancle").on("click" , function() {
			alert("수정이 취소 되었습니다.");
			history.go(-1);
		});			

	});

</script>		

</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />

	<!-- Page Start -->
	<div class="container">

		<div class="page-header">
	       <h1 class=" text-info">부가시설 수정</h1>
	    </div>

		<!-- Form Start -->
		<form class="form-horizontal" >
		 	
		<input type="hidden" name="campNo" id="campNo" value="${subSite.campNo}">
		<input type="hidden" name="subSiteNo" id="subSiteNo" value="${subSite.subSiteNo}">
			
		<div class="form-group">
			<label for="subSiteType" class="col-sm-offset-1 col-sm-3 control-label">부가시설 유형</label>
			<div class="col-sm-4">
				<select name="subSiteType" class="form-control" >
					<option value="전기" ${! empty subSite.subSiteType && subSite.subSiteType eq '전기' ? "selected" : "" }>전기</option>
					<option value="온수" ${! empty subSite.subSiteType && subSite.subSiteType eq '온수' ? "selected" : "" }>온수</option>
					<option value="매점" ${! empty subSite.subSiteType && subSite.subSiteType eq '매점' ? "selected" : "" }>매점</option>
					<option value="화장실" ${! empty subSite.subSiteType && subSite.subSiteType eq '화장실' ? "selected" : "" }>화장실</option>
					<option value="물놀이장" ${! empty subSite.subSiteType && subSite.subSiteType eq '물놀이장' ? "selected" : "" }>물놀이장</option>
					<option value="트램폴린" ${! empty subSite.subSiteType && subSite.subSiteType eq '트램폴린' ? "selected" : "" }>트램폴린</option>
					<option value="무선인터넷" ${! empty subSite.subSiteType && subSite.subSiteType eq '무선인터넷' ? "selected" : "" }>무선인터넷</option>
					<option value="산책로" ${! empty subSite.subSiteType && subSite.subSiteType eq '산책로' ? "selected" : "" }>산책로</option>
				</select>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="subSiteName" class="col-sm-offset-1 col-sm-3 control-label">부가시설 이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="subSiteName" name="subSiteName" value="${subSite.subSiteName}">
				</div>
		</div>

		
		<!-- 
		<div class="form-group">
			<label for="subSiteImg" class="col-sm-offset-1 col-sm-3 control-label">부가시설 사진</label>
				<div class="col-sm-4">
					<input type="file"  id="subSiteImg" name="subSiteImg">
				</div>
		</div>
			
		-->
		
		<div class="form-group">
			<label for="subSiteInfo" class="col-sm-offset-1 col-sm-3 control-label">부가시설 설명</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="subSiteInfo" name="subSiteInfo" value="${subSite.subSiteInfo}">
				</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button id="cancle" type="button" class="btn btn-primary">취소</button>
				<button id="update" type="button" class="btn btn-primary">수정</button>
			</div>
		</div> 

		</form>
		<!-- Form End -->
		
 	</div>
	<!-- Page End -->

</body>

</html>