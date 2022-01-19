<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<title>상품 수정</title>
	
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
 	<jsp:include page="/resources/commonLib.jsp"></jsp:include>
 	
 	<style>
 	
		.filebox label { 
		display: inline-block; 
		padding: 60px 60px; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
		} 
			 
		 #file{
		 	display: flex;
		 	flex-direction: row;
		 	justify-content: space-between;
		 }
		 .form-group{
		 	display: flex;
		 }
		 .time{
		 	display: flex;
		 }
		 
		  input[type=file] {
            display: none;
        }

        .imgsWrap {

            border: 2px solid #A8A8A8;
            margin-top: 30px;
            margin-bottom: 30px;
            padding-top: 10px;
            padding-bottom: 10px;

        }
        .imgsWrap img {
            max-width: 150px;
            margin-left: 10px;
            margin-right: 10px;
        }
		 
	</style>
	
</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
		<!-- <div class="page-loader">
       		<div class="loader">Loading...</div>
     	</div> -->
  		<jsp:include page="../common/header.jsp"></jsp:include>
		<section class="module">
          <div class="container">
            <div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<h4 class="font-alt mb-0">상품 수정</h4>
						<hr class="divider-w mt-10 mb-20">
						<form class="form" role="form">
							<div class="form-group">
								<label for="auctionProductName" class="col-sm-3 control-label">상품명</label> 
								<input id="auctionProductName" name="auctionProductName" class="form-control" type="text" value="${auctionProduct.auctionProductName}" />
							</div>
							<div class="form-group">
								<label for="startBidPrice" class="col-sm-3 control-label">경매 시작가</label>
								<input id="startBidPrice" name="startBidPrice" class="form-control" type="text" value="${auctionProduct.startBidPrice}"  />
							</div>
							<div class="form-group">
								<label for="hopefulBidPrice" class="col-sm-3 control-label">희망 낙찰가</label>
								<input id="hopefulBidPrice" name="hopefulBidPrice" class="form-control" type="text" value="${auctionProduct.hopefulBidPrice}"  />
							</div>
							<div class="form-group">
								<label for="bidUnit" class="col-sm-3 control-label">입찰 단위</label> 
								<input id="bidUnit" name="bidUnit" class="form-control" type="text"	value="${auctionProduct.bidUnit}"  />
							</div>
							<div class="form-group">
								<label for="bidUnit" class="col-sm-3 control-label">경매 시작 시간</label> 
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</span>
									<input id="startDate" type="text" class="form-control" value="${fn:split(auctionProduct.auctionStartTime,' ')[0]}">
									<span class="input-group-addon">
										<i class="fa fa-clock-o"></i>
									</span>
									<input id="startTime" type="text" class="form-control" value="${fn:split(auctionProduct.auctionStartTime,' ')[1]}">
								</div>
							</div>
							<div class="form-group">
								<label for="bidUnit" class="col-sm-3 control-label">경매 종료 시간</label> 
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</span>
									<input id="endDate" type="text" class="form-control" value="${fn:split(auctionProduct.auctionEndTime,' ')[0]}">
									<span class="input-group-addon">
										<i class="fa fa-clock-o"></i>
									</span>
									<input id="endTime" type="text" class="form-control" value="${fn:split(auctionProduct.auctionEndTime,' ')[1]}">
								</div>
							</div>
							<div class="form-group">
								<label for="bidableGrade" class="col-sm-3 control-label">입찰 가능 등급</label>
								<input id="bidableGrade" name="bidableGrade" class="form-control" type="text" value="${auctionProduct.bidableGrade}"  />
							</div>
							<div class="inputWrap">
								<button type="button" id="fileUpload" class="btn btn-border-d btn-round">파일 업로드</button>
								 <input type="file" id="inputImgs" name="inputImgs" multiple />
							</div>
							<div id="uploadForm">
							<div>
								<div class="imgsWrap">
								<c:if test="${!empty auctionProduct.productImg1}">
									<a href="javascript:void(0);" onclick="deleteImageAction(0)" id="imgId0">
										<img id="productImg1" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg1}" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg2}">
									<a href="javascript:void(0);" onclick="deleteImageAction(1)" id="imgId1">
										<img id="productImg2" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg2}" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg3}">
									<a href="javascript:void(0);" onclick="deleteImageAction(2)" id="imgId2">
										<img id="productImg3" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg3}" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg4}">
									<a href="javascript:void(0);" onclick="deleteImageAction(3)" id="imgId3">
										<img id="productImg4" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg4}" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg5}">
									<a href="javascript:void(0);" onclick="deleteImageAction(4)" id="imgId4">
										<img id="productImg5" src="/uploadfiles/auctionimg/product/${auctionProduct.productImg5}" class='selProductFile' title='Click to remove'>
									</a>
								</c:if>
								</div>
							</div>
							</div>				
							<textarea id="auctionProductDetail" name="auctionProductDetail" class="form-control" rows="20">${auctionProduct.auctionProductDetail}</textarea>
							<input id="allhashtag" name="allhashtag" class="form-control" type="text" value="${auctionProduct.hashtag1} ${auctionProduct.hashtag2} ${auctionProduct.hashtag3}" placeholder="해시태그를 #을 포함하여 입력하세요." />
							<input type="hidden" id="auctionProductNo" name="auctionProductNo" value="${auctionProduct.auctionProductNo}">
							<input type="hidden" id="inputImg1" name="productImg1" value="${auctionProduct.productImg1}">
						  	<input type="hidden" id="inputImg2" name="productImg2" value="${auctionProduct.productImg2}">
						  	<input type="hidden" id="inputImg3" name="productImg3" value="${auctionProduct.productImg3}">
						  	<input type="hidden" id="inputImg4" name="productImg4" value="${auctionProduct.productImg4}">
							<input type="hidden" id="inputImg5" name="productImg5" value="${auctionProduct.productImg5}"> 
							<input type="hidden" id="hashtag1" name="hashtag1" value="${auctionProduct.hashtag1}">
						  	<input type="hidden" id="hashtag2" name="hashtag2" value="${auctionProduct.hashtag2}">
							<input type="hidden" id="hashtag3" name="hashtag3" value="${auctionProduct.hashtag3}">  
							<input type="hidden" id="auctionStartTime" name="auctionStartTime">
							<input type="hidden" id="auctionEndTime" name="auctionEndTime">
		                </form>
                <div class="col-sm-4"></div>
	                <div class="container">
					<div class=".col-md-3 .col-md-offset-3">
		                <div class="row">
				            <button id="cancel" class="btn btn-border-d btn-circle" type="button">취소</button>
				            <button id="update" class="btn btn-border-d btn-circle" type="button">수정</button>                
		            	</div>           
                	</div>
             	</div>
           </div>
         </div>
       </div>
     </section>
	 <jsp:include page="../common/footer.jsp"></jsp:include>
		
	<script src="../../resources/lib/bootstrap-maxlength/bootstrap-maxlength.js"></script>
	<script src="../../resources/lib/ios7-switch/ios7-switch.js"></script>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>  
	<script>
	
	var today = new Date();
		var mindate = today.setDate(today.getDate() - 1);
		var maxdate = today.setDate(today.getDate() + 7);
		$(function(){
			
			
			$('#startDate').datetimepicker({
			    format: 'YYYY-MM-DD',
			    useCurrent: false,
			    minDate: mindate
			});
			
			
			$('#startTime').datetimepicker({
				format: 'HH:mm:ss'
			});
			
			$('#endDate').datetimepicker({
			    format: 'YYYY-MM-DD',
			    useCurrent: false,
				minDate : mindate
			});
			
			
			$('#endTime').datetimepicker({
				format: 'HH:mm:ss'
			});
		
			var auctionProduct = "${auctionProduct.auctionProductNo}";
			var imgCount = $('.selProductFile').length;
			
			$("#cancel").on('click', function(){
				window.location.href = "/auction/listAuctionProduct";
			});
			
			$("#update").on('click',function(){
				
				if($('#auctionProductName').val().length == 0){
					Swal.fire({
				    	text: '상품명을 입력하세요.',
				    	icon: 'warning'
				    })
					$('#auctionProductName').focus();
					return;
				}
				
				if( !$.isNumeric( $('#startBidPrice').val() ) ){
					$('#startBidPrice').focus();
					return;
				}
				
				if( !$.isNumeric( $('#hopefulBidPrice').val() ) ){
					$('#hopefulBidPrice').focus();
					return;
				}
				
				if( Number($('#startBidPrice').val() ) >= Number( $('#hopefulBidPrice').val() ) ){
					Swal.fire({
				    	text: '입찰 희망가는 시작가보다 작을 수 없습니다.',
				    	icon: 'warning'
				    })
					$('#startBidPrice').focus();
					return
				}
				
				if( !$.isNumeric( $('#bidUnit').val() ) ){
					$('#bidUnit').focus();
					return;
				}
				
				if( Number($('#bidUnit').val() ) > ( Number( $('#hopefulBidPrice').val() ) - Number( $('#startBidPrice').val() ) ) ){
					Swal.fire({
				    	text: '입찰 단위는 희망낙찰가 시작가 차보다 작아야 합니다.',
				    	icon: 'warning'
				    })
					$('#bidUnit').focus();
					return;
				}
				
			 	if($('#startDate').val().length != 10){
			 		Swal.fire({
				    	text: '시작 날짜를 확인해 주세요.',
				    	icon: 'warning'
				    })
			 		$('#startDate').focus();
			 		return;
			 	}
			 	
			 	if($('#startTime').val().length != 8){
			 		Swal.fire({
				    	text: '시작 시간를 확인해 주세요.',
				    	icon: 'warning'
				    })
			 		$('#startTime').focus();
			 		return;
			 	}
			 	
			 	if($('#endDate').val().length != 10){
			 		Swal.fire({
				    	text: '종료 날짜를 확인해 주세요.',
				    	icon: 'warning'
				    })
			 		$('#endDate').focus();
			 		return;
			 	}
			 	
			 	if($('#endTime').val().length != 8){
			 		Swal.fire({
				    	text: '시작 시간를 확인해 주세요.',
				    	icon: 'warning'
				    })
			 		$('#endTime').focus();
			 		return;
			 	}
			 	
			 	if($('#startDate').val() == $('#endDate').val()){
			 		if($('#startTime').val() == $('#endTime').val()){
			 			Swal.fire({
					    	text: '시작 시간과 종료 시간이 같을 수 없습니다.',
					    	icon: 'warning'
					    })
			 			return;
			 		}
			 	}
				
			 	if(dateCompare($('#startDate').val()+' '+$('#startTime').val(),$('#endDate').val()+' '+$('#endTime').val())){
			 		Swal.fire({
				    	text: '진행 시간이 10분 보다 짧을 수 없습니다.',
				    	icon: 'warning'
				    })
			 		$('#endTime').focus();
			 		return;
			 	}
				
				 
				if($('.selProductFile').length == 0){
					Swal.fire({
				    	text: '1~5장의 사진이 필요합니다.',
				    	icon: 'warning'
				    })
					$('#fileUpload').click();
					$('#uploadForm').attr('hidden',true);
					return;
				}
				
				var hashtags = $('#allhashtag').val().split('#');
				var tagCount = hashtags.length;
				
				if(hashtags.length >  4){
					Swal.fire({
				    	text: '해시태그는 최대 3개 까지 등록 가능합니다.',
				    	icon: 'warning'
				    })
					$('#allhashtag').focus();
					return;
				}else{
					
					dataSet(imgCount, tagCount, hashtags);
				}

				$('#auctionStartTime').val($('#startDate').val()+' '+$('#startTime').val());
				$('#auctionEndTime').val($('#endDate').val()+' '+$('#endTime').val());

				$('form').attr('method','post').attr('action','/auction/updateAuctionProduct').attr("enctype","multipart/form-data").submit();
			});
			
			$('#fileUpload').on('click',fileUploadAction);
			$("#inputImgs").on("change",handleImgFileSelect);
			
		});
		
		function dateCompare(time1,time2) {
			
			var time1_pojo = new Date(time1);
			var time2_pojo = new Date(time2);
			
			var time_compare = time1_pojo.setMinutes(time1_pojo.getMinutes()+10);
			if(time2_pojo < time_compare){
				return true;
			}else{
				return false;				
			}
		}
		
		function dataSet(imgCount, tagCount, hashtags){
			
			/* switch (imgCount) {
			  case 1 :
			      $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
			      break;
			  case 2:
				  $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
				  $('#inputImg2').val($($('.selProductFile')[1]).attr('data-file'));
				  break;
			  case 3:
				  $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
				  $('#inputImg2').val($($('.selProductFile')[1]).attr('data-file'));
				  $('#inputImg3').val($($('.selProductFile')[2]).attr('data-file'));
			      break;
			  case 4:
				  $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
				  $('#inputImg2').val($($('.selProductFile')[1]).attr('data-file'));
				  $('#inputImg3').val($($('.selProductFile')[2]).attr('data-file'));
				  $('#inputImg4').val($($('.selProductFile')[3]).attr('data-file'));
				  break;
			  case 5:
				  $('#inputImg1').val($($('.selProductFile')[0]).attr('data-file'));
				  $('#inputImg2').val($($('.selProductFile')[1]).attr('data-file'));
				  $('#inputImg3').val($($('.selProductFile')[2]).attr('data-file'));
				  $('#inputImg4').val($($('.selProductFile')[3]).attr('data-file'));
				  $('#inputImg5').val($($('.selProductFile')[4]).attr('data-file'));
				  break;
			} */
			
			switch(tagCount){
				case 2 :
					$('#hashtag1').val("#"+hashtags[1]);
			      break;
			  	case 3:
				  	$('#hashtag1').val("#"+hashtags[1]);
				  	$('#hashtag2').val("#"+hashtags[2]);
				  break;
			 	case 4:
				  	$('#hashtag1').val("#"+hashtags[1]);
					$('#hashtag2').val("#"+hashtags[2]);
					$('#hashtag3').val("#"+hashtags[3]);
			      break;
			}
			
		}
		
		var sel_files = [];
		
		function fileUploadAction() {
            $("#inputImgs").trigger('click');
        }
		
		function handleImgFileSelect(e){
			
			$('#uploadForm').attr('hidden',false);
			
			sel_files = [];
			$(".imgsWrap").empty();
			
			$('#inputImg1').remove();
			$('#inputImg2').remove();
			$('#inputImg3').remove();
			$('#inputImg4').remove();
			$('#inputImg5').remove();
						
			
			var files = e.target.files;
			var filesArray = Array.prototype.slice.call(files);
			
			var index = 0;
			
			if(filesArray.length > 5){
				Swal.fire({
			    	text: '사진은 최대 5장까지 입니다.',
			    	icon: 'warning'
			    })
				return;
			}
			
			filesArray.forEach(function(f){
				
				$('#uploadForm').attr('hidden',false);
				
				if(!f.type.match("image.*")){
					Swal.fire({
				    	text: '이미지만 업로드 가능합니다.',
				    	icon: 'warning'
				    })
					$('#uploadForm').attr('hidden',true);
					return;
				}
			
				sel_files.push(f);
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					 var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"imgId"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
					$('.imgsWrap').append(html);
					index++;
				}
				reader.readAsDataURL(f);
			});
		}
		
		function deleteImageAction(index) {
			if(sel_files.length != 0){
	            sel_files.splice(index, 1);
			}

            var imgId = "#imgId"+index;
            var inputImg = "#inputImg"+(1*index+1)
            
            $(imgId).remove();
            $(inputImg).val("");
            
            var selProductFile = document.getElementsByClassName('selProductFile');
            console.log(selProductFile.length)
            if(selProductFile.length == 0 ){
            	$('#uploadForm').attr('hidden',true);
            }
            
            switch(selProductFile){
            case 1:
            	$('#inputImg1').val(selProductFile[0].getAttribute('data-file'));
            	break;
            case 2:
            	$('#inputImg1').val(selProductFile[0].getAttribute('data-file'));
				$('#inputImg2').val(selProductFile[1].getAttribute('data-file'));
            	break;
            case 3:
            	$('#inputImg1').val(selProductFile[0].getAttribute('data-file'));
				$('#inputImg2').val(selProductFile[1].getAttribute('data-file'));
				$('#inputImg3').val(selProductFile[2].getAttribute('data-file'));
            	break;
            case 4:
            	$('#inputImg1').val(selProductFile[0].getAttribute('data-file'));
				$('#inputImg2').val(selProductFile[1].getAttribute('data-file'));
				$('#inputImg3').val(selProductFile[2].getAttribute('data-file'));
				$('#inputImg4').val(selProductFile[3].getAttribute('data-file'));
            	break;           	
            }
        }
		
		
		
		
		
	</script>
</body>
</html>