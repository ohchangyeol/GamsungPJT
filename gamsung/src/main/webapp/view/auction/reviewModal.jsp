<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="/resources/commonLib.jsp"></jsp:include>

<style type="text/css">
.flexbox {
	overflow-y: hidden !important;
	background-color: #ffff;
}

.kindnessRating>.input, .kindnessRating>.input>label:hover,
	.kindnessRating>.input>input:focus+label, .kindnessRating>.input>input:checked+label
	{
	display: inline-block;
	vertical-align: top;
	background:
		url(https://hsecode.github.io/images_codepen/codepen_sp_star.png)
		no-repeat;
}

.kindnessRating {
	white-space: nowrap;
}

.kindnessRating>.input {
	display: inline-block;
	width: 100px;
	background-size: 100px;
	height: 19px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.kindnessRating>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

.kindnessRating>.input.focus {
	outline: 1px dotted #ddd;
}

.kindnessRating>.input>label {
	width: 10px;
	height: 0;
	padding: 19px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.kindnessRating>.input>label:hover, .kindnessRating>.input>input:focus+label,
	.kindnessRating>.input>input:checked+label {
	background-size: 100px;
	background-position: 0 bottom;
}

.kindnessRating>.input>label:hover ~label {
	background-image: none;
}

.kindnessRating>.input>label[for="p10"] {
	width: 10px;
	z-index: 10;
}

.kindnessRating>.input>label[for="p11"] {
	width: 20px;
	z-index: 9;
}

.kindnessRating>.input>label[for="p12"] {
	width: 30px;
	z-index: 8;
}

.kindnessRating>.input>label[for="p13"] {
	width: 40px;
	z-index: 7;
}

.kindnessRating>.input>label[for="p14"] {
	width: 50px;
	z-index: 6;
}

.kindnessRating>.input>label[for="p15"] {
	width: 60px;
	z-index: 5;
}

.kindnessRating>.input>label[for="p16"] {
	width: 70px;
	z-index: 4;
}

.kindnessRating>.input>label[for="p17"] {
	width: 80px;
	z-index: 3;
}

.kindnessRating>.input>label[for="p18"] {
	width: 90px;
	z-index: 2;
}

.kindnessRating>.input>label[for="p19"] {
	width: 100px;
	z-index: 1;
}

.kindnessRating>output {
	display: inline-block;
	width: 36px;
	text-align: right;
}

.kindnessRating>output>b {
	font: bold 18px Helvetica, Arial, sans-serif;
	vertical-align: middle;
}

/* /////////////////////////////////////////////////////////////////////////// */
.statusRating>.input, .statusRating>.input>label:hover, .statusRating>.input>input:focus+label,
	.statusRating>.input>input:checked+label {
	display: inline-block;
	vertical-align: top;
	background:
		url(https://hsecode.github.io/images_codepen/codepen_sp_star.png)
		no-repeat;
}

.statusRating {
	white-space: nowrap;
}

.statusRating>.input {
	display: inline-block;
	width: 100px;
	background-size: 100px;
	height: 19px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.statusRating>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

.statusRating>.input.focus {
	outline: 1px dotted #ddd;
}

.statusRating>.input>label {
	width: 10px;
	height: 0;
	padding: 19px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.statusRating>.input>label:hover, .statusRating>.input>input:focus+label,
	.statusRating>.input>input:checked+label {
	background-size: 100px;
	background-position: 0 bottom;
}

.statusRating>.input>label:hover ~label {
	background-image: none;
}

.statusRating>.input>label[for="p20"] {
	width: 10px;
	z-index: 10;
}

.statusRating>.input>label[for="p21"] {
	width: 20px;
	z-index: 9;
}

.statusRating>.input>label[for="p22"] {
	width: 30px;
	z-index: 8;
}

.statusRating>.input>label[for="p23"] {
	width: 40px;
	z-index: 7;
}

.statusRating>.input>label[for="p24"] {
	width: 50px;
	z-index: 6;
}

.statusRating>.input>label[for="p25"] {
	width: 60px;
	z-index: 5;
}

.statusRating>.input>label[for="p26"] {
	width: 70px;
	z-index: 4;
}

.statusRating>.input>label[for="p27"] {
	width: 80px;
	z-index: 3;
}

.statusRating>.input>label[for="p28"] {
	width: 90px;
	z-index: 2;
}

.statusRating>.input>label[for="p29"] {
	width: 100px;
	z-index: 1;
}

.statusRating>output {
	display: inline-block;
	width: 36px;
	text-align: right;
}

.statusRating>output>b {
	font: bold 18px Helvetica, Arial, sans-serif;
	vertical-align: middle;
}

/* /////////////////////////////////////////////////////////////////////////// */
.priceRating>.input, .priceRating>.input>label:hover, .priceRating>.input>input:focus+label,
	.priceRating>.input>input:checked+label {
	display: inline-block;
	vertical-align: top;
	background:
		url(https://hsecode.github.io/images_codepen/codepen_sp_star.png)
		no-repeat;
}

.priceRating {
	white-space: nowrap;
}

.priceRating>.input {
	display: inline-block;
	width: 100px;
	background-size: 100px;
	height: 19px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.priceRating>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

.priceRating>.input.focus {
	outline: 1px dotted #ddd;
}

.priceRating>.input>label {
	width: 10px;
	height: 0;
	padding: 19px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.priceRating>.input>label:hover, .priceRating>.input>input:focus+label,
	.priceRating>.input>input:checked+label {
	background-size: 100px;
	background-position: 0 bottom;
}

.priceRating>.input>label:hover ~label {
	background-image: none;
}

.priceRating>.input>label[for="p30"] {
	width: 10px;
	z-index: 10;
}

.priceRating>.input>label[for="p31"] {
	width: 20px;
	z-index: 9;
}

.priceRating>.input>label[for="p32"] {
	width: 30px;
	z-index: 8;
}

.priceRating>.input>label[for="p33"] {
	width: 40px;
	z-index: 7;
}

.priceRating>.input>label[for="p34"] {
	width: 50px;
	z-index: 6;
}

.priceRating>.input>label[for="p35"] {
	width: 60px;
	z-index: 5;
}

.priceRating>.input>label[for="p36"] {
	width: 70px;
	z-index: 4;
}

.priceRating>.input>label[for="p37"] {
	width: 80px;
	z-index: 3;
}

.priceRating>.input>label[for="p38"] {
	width: 90px;
	z-index: 2;
}

.priceRating>.input>label[for="p39"] {
	width: 100px;
	z-index: 1;
}

.priceRating>output {
	display: inline-block;
	width: 36px;
	text-align: right;
}

.priceRating>output>b {
	font: bold 18px Helvetica, Arial, sans-serif;
	vertical-align: middle;
}
</style>

<title>Insert title here</title>
</head>
<body>
<div class="container">
<div id="reviewForm" class="comment-form mt-30">
		<h4 class="comment-form-title font-alt">리뷰작성</h4>
		<div class="container">
			<div class="col-sm-4">
				<div class="form-group">
					<label class="sr-only" for="name"></label> 
					<input class="form-control" id="name" type="text" name="name" value="${sessionScope.user.nickName}" readonly="readonly" />
				</div>
			</div>
		</div>
		<div class="container">
			<div class="col-sm-4">
				<div>친절함 평점</div>
				<span class="kindnessRating">
					<span class="input">
						<input type="radio" name="kindnessRating" id="p10" value="0.5"><label for="p10">0.5</label>
						<input type="radio" name="kindnessRating" id="p11" value="1"><label for="p11">1</label>
						<input type="radio" name="kindnessRating" id="p12" value="1.5"><label for="p12">1.5</label>
						<input type="radio" name="kindnessRating" id="p13" value="2"><label for="p13">2</label>
						<input type="radio" name="kindnessRating" id="p14" value="2.5"><label for="p14">2.5</label>
						<input type="radio" name="kindnessRating" id="p15" value="3"><label for="p15">3</label>
						<input type="radio" name="kindnessRating" id="p16" value="3.5"><label for="p16">3.5</label>
						<input type="radio" name="kindnessRating" id="p17" value="4"><label for="p17">4</label>
						<input type="radio" name="kindnessRating" id="p18" value="4.5"><label for="p18">4.5</label>
						<input type="radio" name="kindnessRating" id="p19" value="5"><label for="p19">5</label>
					</span>
					<output for="kindnessRating"><b id="kind">0</b>점</output>
				</span>
			</div>
			<div class="col-sm-4">
				<div>상태 평점</div>
				<span class="statusRating">
					<span class="input">
						<input type="radio" name="statusRating" id="p20" value="0.5"><label for="p20">0.5</label>
						<input type="radio" name="statusRating" id="p21" value="1"><label for="p21">1</label>
						<input type="radio" name="statusRating" id="p22" value="1.5"><label for="p22">1.5</label>
						<input type="radio" name="statusRating" id="p23" value="2"><label for="p23">2</label>
						<input type="radio" name="statusRating" id="p24" value="2.5"><label for="p24">2.5</label>
						<input type="radio" name="statusRating" id="p25" value="3"><label for="p25">3</label>
						<input type="radio" name="statusRating" id="p26" value="3.5"><label for="p26">3.5</label>
						<input type="radio" name="statusRating" id="p27" value="4"><label for="p27">4</label>
						<input type="radio" name="statusRating" id="p28" value="4.5"><label for="p28">4.5</label>
						<input type="radio" name="statusRating" id="p29" value="5"><label for="p29">5</label>
					</span>
					<output for="statusRating"><b id="status">0</b>점</output>
				</span>
			</div>
			<div class="col-sm-4">
				<div>가격 평점</div>
				<span class="priceRating">
					<span class="input">
						<input type="radio" name="priceRating" id="p30" value="0.5"><label for="p30">0.5</label>
						<input type="radio" name="priceRating" id="p31" value="1"><label for="p31">1</label>
						<input type="radio" name="priceRating" id="p32" value="1.5"><label for="p32">1.5</label>
						<input type="radio" name="priceRating" id="p33" value="2"><label for="p33">2</label>
						<input type="radio" name="priceRating" id="p34" value="2.5"><label for="p34">2.5</label>
						<input type="radio" name="priceRating" id="p35" value="3"><label for="p35">3</label>
						<input type="radio" name="priceRating" id="p36" value="3.5"><label for="p36">3.5</label>
						<input type="radio" name="priceRating" id="p37" value="4"><label for="p37">4</label>
						<input type="radio" name="priceRating" id="p38" value="4.5"><label for="p38">4.5</label>
						<input type="radio" name="priceRating" id="p39" value="5"><label for="p39">5</label>
					</span>
					<output for="priceRating"><b id="price">0</b>점</output>
				</span>
			</div>
		</div>
		<form>
			<div class="col-sm-12">
				<div class="form-group">
					<textarea class="form-control" id="ratingReviewContent" name="ratingReviewContent" rows="15" placeholder="Review"></textarea>
				</div>
			</div>
			<input type="hidden" id="kindnessRating" name="kindnessRating">
			<input type="hidden" id="statusRating" name="statusRating">
			<input type="hidden" id="priceRating" name="priceRating">
			<input type="hidden" id="auctionProductNo" name="auctionInfo.auctionProductNo" value="${auctionProductNo}">
			<div class="col-sm-12">
				<button id="reviewBtn" class="btn btn-round btn-d" type="button">작성 완료</button>
			</div>
		</form>
	</div>
</div>
	
	<script type="text/javascript">
	
	
	$(function(){
		$('#reviewBtn').on('click',function(e){
			
			$('#kindnessRating').val( $('#kind').text() )
			$('#statusRating').val( $('#status').text() )
			$('#priceRating').val( $('#price').text() )
		
			$.ajax({
  						url : "/auction/rest/addReview/${auctionProductNo}",
  						method : "POST",
  						data : JSON.stringify({
  							kindnessRating : $('#kind').text(),
  							statusRating : $('#status').text(),
  							priceRating : $('#price').text(),
  							ratingReviewContent : $('#ratingReviewContent').val()
  						}),
  						headers : {
  							"Accept" : "application/json",
  							"Content-Type" : "application/json"
  						},
  						dataType : "json",
  						success : function(JSONData, status) {						
  						}
					});
			
			setTimeout(function() {
				parent.opener=self
				parent.window.open('/auction/getAuctionProduct?auctionProductNo=${auctionProductNo}','_self').close()
				self.close()
			}, 500);

			
			
			
		});
	});

	var starRating1 = function(){
	  var $star = $(".kindnessRating"),
	      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".kindnessRating>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".kindnessRating>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", ".kindnessRating :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".kindnessRating label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".kindnessRating>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	  
	var starRating2 = function(){	 
	  var $star = $(".priceRating"),
      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".priceRating>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".priceRating>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", ".priceRating :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".priceRating label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".priceRating>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	var starRating3 = function(){
	  var $star = $(".statusRating"),
      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".statusRating>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".statusRating>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", ".statusRating :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".statusRating label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".statusRating>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	
	starRating1();
	starRating2();
	starRating3();
	</script>
</body>
	</html>