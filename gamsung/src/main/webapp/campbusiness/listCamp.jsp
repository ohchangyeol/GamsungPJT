<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://Java.sun.com/jsp/jstl/core" %>	

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

	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  	<style>
		body {
			padding-top : 50px;
		}
    </style>

	<script type="text/javascript">
	
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetProductList(currentPage) {
		$("#currentPage").val(currentPage)
		var menu = $("input[name='menu']").val();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+menu).submit();
	}

	$(function() {

		var menu = $('#menu').val();

		$( "button.btn.btn-default"  ).on("click" , function() {
			fncGetProductList(1);
		}); 
		 
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		
		$( "td:nth-child(3)" ).on("click" , function() {
		var prodNo = $(this).attr("data-prodNo");
			
			console.log(menu);
			if(menu == "manage"){
				self.location ="/product/updateProductView?prodNo="+prodNo+"&menu="+$(this).attr("data-menu");
			}
			
			if(menu == "search"){
				self.location ="/product/getProduct?prodNo="+prodNo+"&menu="+$(this).attr("data-menu");	
			}			
		});
					
		//==> LINK Event End User 에게 보일수 있도록 
		$( "td:nth-child(3)" ).css("color" , "red");		
			
	
		$("#ship").on("click" , function() {
			//Debug..
			//alert(  $( this ).text().trim() );
			self.location ="/purchase/updateTranCodeByProd?prodNo=" + $(this).attr("data-prodNo")+"&tranCode=" +$(this).attr("data-tranCode");
		}); 	 
	});	
    
	//============= Event  처리 (double Click)=============
	$(function() {
			 console.log($(  "td:nth-child(8)" ));
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(  "td:nth-child(8) > i" ).on("mouseover" , function() {
			
			var prodNo =  $(this).next().val();

		$.ajax( 
				{
					url : "/product/json/getProduct/"+prodNo,
					method : "GET" ,
					dataType : "json" ,
					headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {

						var displayValue = "<h6>"
									+" 정&nbsp;보 : "+JSONData.prodDetail+"<br/>"
									+" 제조일 : "+JSONData.manuDate+"<br/>"
									+" 가&nbsp;격 : "+JSONData.price+"<br/>"
									+"</h6>";
								
						$("h6").remove();
						
						$( "#"+prodNo+"" ).html(displayValue);
					}
				});
		});		
    	
		//==> userId LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> 아래와 같이 정의한 이유는 ??				
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");		
	});
	
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/campbusiness/zTestToolBar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<input type="hidden" name="menu" id="menu" value="${param.menu}">
		<div class="page-header text-info">
			<c:choose>
				<c:when test="${ empty param.menu || param.menu == 'manage'}"> 
					<h3>상품 관리</h3>
				</c:when>
				<c:otherwise>
					<h3>상품 목록조회</h3>
				</c:otherwise>
			</c:choose>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
	    <div class="col-md-6 text-left">
			<p class="text-primary">
		    	전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    </p>
		</div>
		
		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
			    
			<div class="form-group">
				<select class="form-control" name="searchCondition" >
					<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>도서번호</option>
					<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>도서명</option>
					<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>도서가격</option>
				</select>
			</div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text"  class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
			</form>
	    </div>
	    
	    </div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		      <!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped" >
      
			<thead>
				<tr>
            		<th align="center">No</th>
            		<th align="center">도서번호</th>
          			<th align="left" >도서명</th>
            		<th align="left">도서가격</th>
           			<th align="left">도서등록일</th>
          			<th align="left">현재상태</th>
          			<th align="left">간략정보</th>
         		 </tr>
       		</thead>
       		
       		<tbody>      		
      
				<c:set var="i" value="0" />
		  		<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
			  			<td align="left">${ i }</td>
			  			<td align="left">${product.prodNo}</td>
			  			<td align="left" data-prodNo="${product.prodNo}" data-menu="${param.menu}">${product.prodName}
			  				<span id= "${product.prodNo}" ></span>
			  			</td>
			  			<input type="hidden" name="prodNo" value="${product.prodNo}">
		
						<td align="left">${product.price}</td>
						<td align="left">${product.regDate}</td>
			 			<td align="left">
			 			
			 			<c:choose>	
							<c:when test="${ empty product.proTranCode || product.proTranCode == '0' }"> 
								판매중
							</c:when>				
							<c:when test="${ product.proTranCode == '1' }"> 
								<c:choose>
    								<c:when test="${ param.menu == 'manage' }"> 	
    									구매완료&nbsp;&nbsp;
    									<span id="ship" data-prodNo="${product.prodNo}" data-tranCode="2"> [ 배송하기 ]</span>
    								</c:when>
    								<c:otherwise> 
    									구매완료
    								</c:otherwise>
    							</c:choose>
							</c:when>
							<c:when test="${ product.proTranCode == '2' }"> 
								배송중
							</c:when>							
							<c:otherwise>
								배송완료
							</c:otherwise> 
						</c:choose>	
						</td> 
			 			<td>
			  				<i class="glyphicon glyphicon-ok" ></i>
			  				<input type="hidden" value="${product.prodNo}">
			  			</td>
					</tr>
          		</c:forEach>
        	</tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_newProduct.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
	