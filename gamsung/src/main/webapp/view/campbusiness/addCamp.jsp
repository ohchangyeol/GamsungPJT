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
	
	<!-- CSS -->
	<style>
		.form-horizontal .control-label{
    		text-align: left;
		}
    </style>

	<!-- JavaScript -->
	<script type="text/javascript">

		// 버튼
		$(function() {
			
			//등록일자 현재년월일 받아오기	
			document.getElementById('campRegDate').value = new Date().toISOString().substring(0, 10);
			
			var addCampTempSave = $("#addCampTempSave").val();			
			if(addCampTempSave != 3){
				alert("미등록된 캠핑장 정보가 있습니다.\n등록을 완료하세요.");
			}
			
			
			$("#save").on("click" , function() {
				alert("캠핑장정보가 등록 되었습니다.");
				$("#addCampTempSave").val("3");
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateCamp").attr("enctype","multipart/form-data").submit();
			});
			
			$("#tempsave").on("click" , function() {
				alert("임시등록 되었습니다.");
				$("#addCampTempSave").val("2");			
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateCamp").attr("enctype","multipart/form-data").submit();
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
		<div class="row">
		 
	<div class="page-header">
       <h1 class=" text-info">캠핑장 등록</h1>
    </div>		    
		   
   	<!-- Form Start -->
	<form class="form-horizontal">
	
		<div class="row">
			
			<input type="hidden" name="campTempSave" id="addCampTempSave" value="${camp.campTempSave}">
			
			<div class="form-group">
				<label for="saveStatus" class="col-sm-offset-1 col-sm-3 control-label">등록 상태</label>	
					<c:if test="${ empty campSession.campTempSave || campSession.campTempSave != '3' }">	
						<div class="col-xs-8 col-md-4"> 미등록 상태입니다. 등록을 완료하세요</div>
					</c:if>
			</div>
		
			<div class="form-group">
				<label for="campNo" class="col-sm-offset-1 col-sm-3 control-label">등록 번호</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="campNo" name="campNo" value="${camp.campNo}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="campRegDate" class="col-sm-offset-1 col-sm-3 control-label">등록 일자</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="campRegDate" name="campRegDate" value="" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="user.id" class="col-sm-offset-1 col-sm-3 control-label">사업자회원ID</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user.id" name="user.id" value="${camp.user.id}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="user.campName" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 이름</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user.campName" name="user.campName" value="${campSession.user.campName}" readonly>
					</div>
			</div>
	
			<div class="form-group">
				<label for="user.campCall" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전화번호</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user.campCall" name="user.campCall" value="${campSession.user.campCall}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="user.addr" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 주소</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user.addr" name="user.addr" value="${campSession.user.addr}" readonly>
					</div>
			</div>
		
			<div class="form-group">
				<label for="campTheme1" class="col-sm-offset-1 col-sm-3 control-label">테마 유형1</label>
				<div class="col-sm-5">
					<select name="campTheme1" class="form-control" >
						<option value="봄" selected="selected">봄</option>
						<option value="여름">여름</option>
						<option value="가을">가을</option>
						<option value="겨울">겨울</option>
						<option value="일출">일출</option>
						<option value="일몰">일몰</option>
						<option value="등산">등산</option>
						<option value="낚시">낚시</option>
						<option value="애완동물동반">애완동물동반</option>	
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="campTheme2" class="col-sm-offset-1 col-sm-3 control-label">테마 유형2</label>
				<div class="col-sm-5">
					<select name="campTheme2" class="form-control" >
						<option value="봄">봄</option>
						<option value="여름">여름</option>
						<option value="가을">가을</option>
						<option value="겨울">겨울</option>
						<option value="일출" selected="selected">일출</option>
						<option value="일몰">일몰</option>
						<option value="등산">등산</option>
						<option value="낚시">낚시</option>
						<option value="애완동물동반">애완동물동반</option>	
					</select>
				</div>
			</div>
	
			<div class="form-group">
				<label for="campNature1" class="col-sm-offset-1 col-sm-3 control-label">주변 환경1</label>
				<div class="col-sm-5">
					<select name="campNature1" class="form-control" >
						<option value="계곡" selected="selected">계곡</option>
						<option value="호수">호수</option>
						<option value="강">강</option>
						<option value="바다">바다</option>
						<option value="산">산</option>
						<option value="숲">숲</option>
						<option value="도시">도시</option>
						<option value="섬">섬</option>
					</select>
				</div>
			</div>
	
			<div class="form-group">
				<label for="campNature2" class="col-sm-offset-1 col-sm-3 control-label">주변 환경2</label>
				<div class="col-sm-5">
					<select name="campNature2" class="form-control" >
						<option value="계곡">계곡</option>
						<option value="호수">호수</option>
						<option value="강">강</option>
						<option value="바다">바다</option>
						<option value="산" selected="selected">산</option>
						<option value="숲">숲</option>
						<option value="도시">도시</option>
						<option value="섬">섬</option>
					</select>
				</div>
			</div>	
	
			<div class="form-group">
				<label for="campOperation1" class="col-sm-offset-1 col-sm-3 control-label">운영 유형1</label>
				<div class="col-sm-5">
					<select name="campOperation1" class="form-control" >
						<option value="상시" selected="selected">상시</option>
						<option value="봄">봄 (3월~5월)</option>
						<option value="여름">여름 (6월~8월)</option>
						<option value="가을">가을 (9월~11월)</option>
						<option value="겨울">겨울 (12월~2월)</option>
						<option value="주중">주중</option>
						<option value="주말">주말</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="campOperation2" class="col-sm-offset-1 col-sm-3 control-label">운영 유형2</label>
				<div class="col-sm-5">
					<select name="campOperation2" class="form-control" >
						<option value="상시">상시</option>
						<option value="봄">봄 (3월~5월)</option>
						<option value="여름">여름 (6월~8월)</option>
						<option value="가을">가을 (9월~11월)</option>
						<option value="겨울">겨울 (12월~2월)</option>
						<option value="주중" selected="selected">주중</option>
						<option value="주말">주말</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="campMapFile" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 지도이미지</label>				
					<div class="col-sm-5">
						<input type="file"  id="campMapFile" name="campMapFile">	
					</div>
			</div> 
					
			<div class="form-group">
				<label for="campImgFile1" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경이미지(1/5)</label>				
					<div class="col-sm-4">
						<input type="file"  id="campImgFile1" name="campImgFile1">	
					</div>
			</div>
			
			<div class="form-group">
				<label for="campImgFile2" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경이미지(2/5)</label>				
					<div class="col-sm-5">
						<input type="file"  id="campImgFile2" name="campImgFile2">	
					</div>
			</div>
			
			<div class="form-group">
				<label for="campImgFile3" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경이미지(3/5)</label>				
					<div class="col-sm-5">
						<input type="file"  id="campImgFile3" name="campImgFile3">	
					</div>
			</div>
	
			<div class="form-group">
				<label for="campImgFile4" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경이미지(4/5)</label>				
					<div class="col-sm-5">
						<input type="file"  id="campImgFile4" name="campImgFile4">		
					</div>
			</div>	
	
			<div class="form-group">
				<label for="campImgFile5" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경이미지(5/5)</label>				
					<div class="col-sm-5">
						<input type="file"  id="campImgFile5" name="campImgFile5">
					</div>
			</div> 	
				
		    </div>
		    
			<div class="row">
				<div class="form-group">        
			        <label for="campSummery" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 요약소개</label>
				</div> 		   
			</div>
			
			<div class="row">
				<div class="col-sm-8 col-xs-offset-1">
			    	<textarea class="form-control" id="campSummery" rows="3" name="campSummery"></textarea>
			    </div> 		   
			</div>
				
			<div class="row">
				<br>
				<div class="form-group">        
			       <label for="campDetail" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 상세소개</label>
				</div> 		   
			</div>
			
			<div class="row">
				<div class="col-sm-8 col-xs-offset-1">
			    	<textarea class="form-control" id="campDetail" rows="6" name="campDetail"></textarea>	
			    </div> 		   
			</div>
			
	   	</form>
	    <!-- Form End -->	    

		<br>
		<br>
		
		<div class="row">
			<div class="form-group">		
				<div class="col-xs-1 col-xs-offset-1">
					<button id="cancle" type="button" class="btn btn-danger">취소</button>
				</div>
				
				<div class="col-xs-1 col-xs-offset-1">
					<button id="tempsave" type="button" class="btn btn-info">임시저장</button>
				</div>
										
				<div class="col-xs-1 col-xs-offset-4">
					<button id="save" type="button" class="btn btn-primary">저장</button>
				</div>			
			</div>
		</div> 			
		  
		</div>
	</div>
</body>

</html>