<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<style>
	
	#title {
		width: 220px;
		height: 100%;
		display: flex;	
	}
	
	
	#frame {
		width: 100%px;
		height: 300px;
		display: flex;	
	}
	
	#text {
		width: 100%;
		height: 50px;
		display: flex;	
	}

</style>

<div id="title"></div>


	
	<iframe id="frame" src="/view/common/userSideBar.jsp" width="220" height="100%"></iframe>
	
	<iframe id="text" src="/payment/listPayment" width="950" height="100%"></iframe>

 





</body>
</html>