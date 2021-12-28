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
			
			//등록일자 현재년월일 받아오기	
			document.getElementById('mainSiteRegDate').value = new Date().toISOString().substring(0, 10);;
			
			$("#save").on("click" , function() {
				alert("주요시설이 등록 되었습니다.");
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateMainSite").attr("enctype","multipart/form-data").submit();
			});
					
			$("#cancle").on("click" , function() {
				alert("취소 되었습니다.");
				window.history.back();
			});
			
			$("#resetform").on("click" , function() {
				alert("초기화 되었습니다.");				
				$("form")[0].reset();				
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
	       <h1 class=" text-info">주요시설 등록</h1>
	    </div>

		<!-- Form Start -->
		<form class="form-horizontal" >
		
		<input type="hidden" name="campNo" id="campNo" value="${campSession.campNo}">
		
		<div class="form-group">
			<label for="mainSiteNo" class="col-sm-offset-1 col-sm-3 control-label">등록 번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mainSiteNo" name="mainSiteNo" value="${mainSite.mainSiteNo}" readonly>
				</div>
		</div>	
		
		<div class="form-group">
			<label for="mainSiteRegDate" class="col-sm-offset-1 col-sm-3 control-label">등록 일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mainSiteRegDate" name="mainSiteRegDate" value="" readonly>
				</div>
		</div>

		<div class="form-group">
			<label for="mainSiteType" class="col-sm-offset-1 col-sm-3 control-label">주요시설 유형</label>
			<div class="col-sm-4">
				<select name="mainSiteType" class="form-control" >
					<option value="오토캠핑" selected="selected">오토캠핑</option>
					<option value="글램핑">글램핑</option>
					<option value="카라반">카라반</option>
					<option value="방갈로">방갈로</option>
					<option value="팬션">팬션</option>
					<option value="자동차야영장">자동차야영장</option>
				</select>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="mainSiteName" class="col-sm-offset-1 col-sm-3 control-label">주요시설 이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mainSiteName" name="mainSiteName" value="" placeholder="이름을 입력하세요">
				</div>
		</div>

		<div class="form-group">
			<label for="mainSiteSize" class="col-sm-offset-1 col-sm-3 control-label">주요시설 크기</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mainSiteSize" name="mainSiteSize" value="" placeholder="크기를 입력하세요">
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteSection" class="col-sm-offset-1 col-sm-3 control-label">주요시설 위치(구역번호)</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mainSiteSection" name="mainSiteSection" value="" placeholder="캠핑장내 구역위치를 입력하세요">
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteMinCapacity" class="col-sm-offset-1 col-sm-3 control-label">기본 사용인원수</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" id="mainSiteMinCapacity" name="mainSiteMinCapacity" value="1" min="0">
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteMaxCapacity" class="col-sm-offset-1 col-sm-3 control-label">최대 사용인원수</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" id="mainSiteMaxCapacity" name="mainSiteMaxCapacity" value="1" min="0">
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteMinPrice" class="col-sm-offset-1 col-sm-3 control-label">기본인원 금액</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" id="mainSiteMinPrice" name="mainSiteMinPrice" value="1" min="0">
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteAddPrice" class="col-sm-offset-1 col-sm-3 control-label">추가인원 금액</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" id="mainSiteAddPrice" name="mainSiteAddPrice" value="1" min="0">
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteParkingSize" class="col-sm-offset-1 col-sm-3 control-label">주차가능 대수</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" id="mainSiteParkingSize" name="mainSiteParkingSize" value="0" min="0">
				</div>
		</div>

		<div class="form-group">
			<label for="mainSiteImgFile1" class="col-sm-offset-1 col-sm-3 control-label">주요시설 이미지(1/3)</label>				
				<div class="col-sm-4">
					<input type="file"  id="mainSiteImgFile1" name="mainSiteImgFile1">	
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteImgFile2" class="col-sm-offset-1 col-sm-3 control-label">주요시설 이미지(2/3)</label>				
				<div class="col-sm-4">
					<input type="file"  id="mainSiteImgFile2" name="mainSiteImgFile2">	
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteImgFile3" class="col-sm-offset-1 col-sm-3 control-label">주요시설 이미지(3/3)</label>				
				<div class="col-sm-4">
					<input type="file"  id="mainSiteImgFile3" name="mainSiteImgFile3">	
				</div>
		</div>
		
		<div class="form-group">
			<label for="mainSiteInfo" class="col-sm-offset-1 col-sm-3 control-label">주요시설 설명</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mainSiteInfo" name="mainSiteInfo" value="" placeholder="주요시설 설명을 입력하세요">
				</div>
		</div>		

		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button id="resetform" type="button" class="btn btn-primary">양식 초기화</button>
				<button id="cancle" type="button" class="btn btn-primary">취소</button>
				<button id="save" type="button" class="btn btn-primary">저장</button>
			</div>
		</div>

		</form>
		<!-- Form End -->
		
 	</div>
	<!-- Page End -->

</body>

</html>