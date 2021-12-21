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

		$(function() {
			
			$("#update").on("click" , function() {
				alert("캠핑장정보를 수정합니다.");
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateCamp").submit();
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
	       <h1 class=" text-info">캠핑장 정보수정</h1>
	    </div>

		<!-- Form Start -->
		<form class="form-horizontal" >
		
		<input type="hidden" name="campNo" id="campNo" value="${camp.campNo}">
			
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">사업자회원ID</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userId" name="userId" value="${camp.campNo}" readonly>
				</div>
		</div>

		<div class="form-group">
			<label for="campTheme1" class="col-sm-offset-1 col-sm-3 control-label">테마 유형1</label>
			<div class="col-sm-4">
				<select name="campTheme1" class="form-control" >
					<option value="봄" ${! empty camp.campTheme1 && camp.campTheme1 eq '봄' ? "selected" : "" }>봄</option>
					<option value="여름" ${! empty camp.campTheme1 && camp.campTheme1 eq '여름' ? "selected" : "" }>여름</option>
					<option value="가을" ${! empty camp.campTheme1 && camp.campTheme1 eq '가을' ? "selected" : "" }>가을</option>
					<option value="겨울" ${! empty camp.campTheme1 && camp.campTheme1 eq '겨울' ? "selected" : "" }>겨울</option>
					<option value="일출" ${! empty camp.campTheme1 && camp.campTheme1 eq '일출' ? "selected" : "" }>일출</option>
					<option value="일몰" ${! empty camp.campTheme1 && camp.campTheme1 eq '일몰' ? "selected" : "" }>일몰</option>
					<option value="등산" ${! empty camp.campTheme1 && camp.campTheme1 eq '등산' ? "selected" : "" }>등산</option>
					<option value="낚시" ${! empty camp.campTheme1 && camp.campTheme1 eq '낚시' ? "selected" : "" }>낚시</option>
					<option value="애완동물동반" ${! empty camp.campTheme1 && camp.campTheme1 eq '애완동물동반' ? "selected" : "" }>애완동물동반</option>	
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="campTheme2" class="col-sm-offset-1 col-sm-3 control-label">테마 유형2</label>
			<div class="col-sm-4">
				<select name="campTheme2" class="form-control" >
					<option value="봄" ${! empty camp.campTheme2 && camp.campTheme2 eq '봄' ? "selected" : "" }>봄</option>
					<option value="여름" ${! empty camp.campTheme2 && camp.campTheme2 eq '여름' ? "selected" : "" }>여름</option>
					<option value="가을" ${! empty camp.campTheme2 && camp.campTheme2 eq '가을' ? "selected" : "" }>가을</option>
					<option value="겨울" ${! empty camp.campTheme2 && camp.campTheme2 eq '겨울' ? "selected" : "" }>겨울</option>
					<option value="일출" ${! empty camp.campTheme2 && camp.campTheme2 eq '일출' ? "selected" : "" }>일출</option>
					<option value="일몰" ${! empty camp.campTheme2 && camp.campTheme2 eq '일몰' ? "selected" : "" }>일몰</option>
					<option value="등산" ${! empty camp.campTheme2 && camp.campTheme2 eq '등산' ? "selected" : "" }>등산</option>
					<option value="낚시" ${! empty camp.campTheme2 && camp.campTheme2 eq '낚시' ? "selected" : "" }>낚시</option>
					<option value="애완동물동반" ${! empty camp.campTheme2 && camp.campTheme2 eq '애완동물동반' ? "selected" : "" }>애완동물동반</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="campNature1" class="col-sm-offset-1 col-sm-3 control-label">주변 환경1</label>
			<div class="col-sm-4">
				<select name="campNature1" class="form-control" >
					<option value="계곡" ${! empty camp.campNature1 && camp.campNature1 eq '계곡' ? "selected" : "" }>계곡</option>
					<option value="호수" ${! empty camp.campNature1 && camp.campNature1 eq '호수' ? "selected" : "" }>호수</option>
					<option value="강" ${! empty camp.campNature1 && camp.campNature1 eq '강' ? "selected" : "" }>강</option>
					<option value="바다" ${! empty camp.campNature1 && camp.campNature1 eq '바다' ? "selected" : "" }>바다</option>
					<option value="산" ${! empty camp.campNature1 && camp.campNature1 eq '산' ? "selected" : "" }>산</option>
					<option value="숲" ${! empty camp.campNature1 && camp.campNature1 eq '숲' ? "selected" : "" }>숲</option>
					<option value="도시" ${! empty camp.campNature1 && camp.campNature1 eq '도시' ? "selected" : "" }>도시</option>
					<option value="섬" ${! empty camp.campNature1 && camp.campNature1 eq '섬' ? "selected" : "" }>섬</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="campNature2" class="col-sm-offset-1 col-sm-3 control-label">주변 환경2</label>
			<div class="col-sm-4">
				<select name="campNature2" class="form-control" >
					<option value="계곡" ${! empty camp.campNature2 && camp.campNature2 eq '계곡' ? "selected" : "" }>계곡</option>
					<option value="호수" ${! empty camp.campNature2 && camp.campNature2 eq '호수' ? "selected" : "" }>호수</option>
					<option value="강" ${! empty camp.campNature2 && camp.campNature2 eq '강' ? "selected" : "" }>강</option>
					<option value="바다" ${! empty camp.campNature2 && camp.campNature2 eq '바다' ? "selected" : "" }>바다</option>
					<option value="산" ${! empty camp.campNature2 && camp.campNature2 eq '산' ? "selected" : "" }>산</option>
					<option value="숲" ${! empty camp.campNature2 && camp.campNature2 eq '숲' ? "selected" : "" }>숲</option>
					<option value="도시" ${! empty camp.campNature2 && camp.campNature2 eq '도시' ? "selected" : "" }>도시</option>
					<option value="섬" ${! empty camp.campNature2 && camp.campNature2 eq '섬' ? "selected" : "" }>섬</option>
				</select>
			</div>
		</div>	

		<div class="form-group">
			<label for="campOperation1" class="col-sm-offset-1 col-sm-3 control-label">운영 유형1</label>
			<div class="col-sm-4">
				<select name="campOperation1" class="form-control" >
					<option value="상시" ${! empty camp.campOperation1 && camp.campOperation1 eq '상시' ? "selected" : "" }>상시</option>
					<option value="봄(3월~5월)" ${! empty camp.campOperation1 && camp.campOperation1 eq '봄(3월~5월)' ? "selected" : "" }>봄 (3월~5월)</option>
					<option value="여름(6월~8월)" ${! empty camp.campOperation1 && camp.campOperation1 eq '여름(6월~8월)' ? "selected" : "" }>여름 (6월~8월)</option>
					<option value="가을(9월~11월)" ${! empty camp.campOperation1 && camp.campOperation1 eq '가을(9월~11월)' ? "selected" : "" }>가을 (9월~11월)</option>
					<option value="겨울(12월~2월)" ${! empty camp.campOperation1 && camp.campOperation1 eq '겨울(12월~2월)' ? "selected" : "" }>겨울 (12월~2월)</option>
					<option value="주중" ${! empty camp.campOperation1 && camp.campOperation1 eq '주중' ? "selected" : "" }>주중</option>
					<option value="주말" ${! empty camp.campOperation1 && camp.campOperation1 eq '주말' ? "selected" : "" }>주말</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="campOperation2" class="col-sm-offset-1 col-sm-3 control-label">운영 유형2</label>
			<div class="col-sm-4">
				<select name="campOperation2" class="form-control" >
					<option value="상시" ${! empty camp.campOperation2 && camp.campOperation2 eq '상시' ? "selected" : "" }>상시</option>
					<option value="봄(3월~5월)" ${! empty camp.campOperation2 && camp.campOperation2 eq '봄(3월~5월)' ? "selected" : "" }>봄 (3월~5월)</option>
					<option value="여름(6월~8월)" ${! empty camp.campOperation2 && camp.campOperation2 eq '여름(6월~8월)' ? "selected" : "" }>여름 (6월~8월)</option>
					<option value="가을(9월~11월)" ${! empty camp.campOperation2 && camp.campOperation2 eq '가을(9월~11월)' ? "selected" : "" }>가을 (9월~11월)</option>
					<option value="겨울(12월~2월)" ${! empty camp.campOperation2 && camp.campOperation2 eq '겨울(12월~2월)' ? "selected" : "" }>겨울 (12월~2월)</option>
					<option value="주중" ${! empty camp.campOperation2 && camp.campOperation2 eq '주중' ? "selected" : "" }>주중</option>
					<option value="주말" ${! empty camp.campOperation2 && camp.campOperation2 eq '주말' ? "selected" : "" }>주말</option>
				</select>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="campName" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="campName" name="campName" value="${user.campName}" readonly>
				</div>
		</div>

		<div class="form-group">
			<label for="campCall" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전화번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="campCall" name="campCall" value="${user.campCall}" readonly>
				</div>
		</div>
		
		<div class="form-group">
			<label for="campAddr" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 주소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="campAddr" name="campAddr" value="${user.addr}" readonly>
				</div>
		</div>

		<!-- 
		<div class="form-group">
			<label for="campMapImg" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 지도사진</label>
				<div class="col-sm-4">
					<input type="file"  id="campMapImg" name="campMapImg">
				</div>
		</div>
		
		<div class="form-group">
			<label for="campImg1" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경사진1</label>
				<div class="col-sm-4">
					<input type="campImg1"  id="file" name="campImg1">
				</div>
		</div>
		
		<div class="form-group">
			<label for="campImg2" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경사진2</label>
				<div class="col-sm-4">
					<input type="file"  id="campImg2" name="campImg2">
				</div>
		</div>
		
		<div class="form-group">
			<label for="campImg3" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경사진3</label>
				<div class="col-sm-4">
					<input type="file"  id="campImg3" name="campImg3">
				</div>
		</div>
		
		<div class="form-group">
			<label for="campImg4" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경사진4</label>
				<div class="col-sm-4">
					<input type="file"  id="campImg4" name="campImg4">
				</div>
		</div>
		
		<div class="form-group">
			<label for="campImg5" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 전경사진5</label>
				<div class="col-sm-4">
					<input type="file"  id="campImg5" name="campImg5">
				</div>
		</div>		
		-->
		
		<div class="form-group">
			<label for="campSummery" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 요약소개</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="campSummery" name="campSummery" value="${camp.campSummery}">
				</div>
		</div>
		
		<div class="form-group">
			<label for="campDetail" class="col-sm-offset-1 col-sm-3 control-label">캠핑장 상세소개</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="campDetail" name="campDetail" value="${camp.campDetail}">
				</div>
		</div>
		
		<br>
		<br>
		
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