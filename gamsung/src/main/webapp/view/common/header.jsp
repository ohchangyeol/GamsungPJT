<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start header -->
<head>
	<meta charset="euc-kr">
</head>
	<header class="top-header">
		<nav class="navbar header-nav navbar-expand-lg">
            <div class="container">
				<a class="navbar-brand" href="/main.jsp"><img src="/resources/images/감성캠핑.png" alt="image" width="100px" height="10	0px"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
					<span></span>
					<span></span>
					<span></span>
				</button>
                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                    <ul class="navbar-nav">
                        <li><a class="nav-link" href="#home">캠핑</a></li>
                        <li></li>
                        <li><a id="auction-header" class="nav-link" href="view/common/subMainCampBusiness.jsp">캠핑 사업자</a></li>
                        <li></li>
                        <li><a id="auction-header" class="nav-link" href="/auction/listAuctionProduct">경매</a></li>
                        <li></li>
                        <li><a class="nav-link" href="#b-deals">예약양도</a></li>
                        <li></li>
						<li><a class="nav-link" href="#donate">커뮤니티</a></li>
						<li></li>
                        <li><a class="nav-link" href="#testi">고객센터</a></li>
                        <li></li>
						<li><a class="nav-link" href="#contact">채팅</a></li>
						<li></li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                    <ul class="navbar-nav">
                    <c:if test="${sessionScope.user.role != null}">
	                <li><a href="#">로그아웃</a></li>
	                </c:if>
	                <c:if test="${sessionScope.user.role == null}">
	                <li><a class="nav-link active" href="/user/login">로 그 인</a></li>
	                 </c:if>
                    </ul>
                </div>
            </div>
        </nav>
	</header>
<!-- End header -->