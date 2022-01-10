<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html class="fixed">

        <head>

            <!-- Basic -->
            <meta charset="UTF-8">

            <title>회원목록</title>
            <meta name="keywords" content="HTML5 Admin Template" />
            <meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
            <meta name="author" content="JSOFT.net">

            <jsp:include page="../../resources/commonCssAdmin.jsp" />

            <!-- Specific Page Vendor CSS -->
            <link rel="stylesheet" href="/resources/lib/select2/select2.css" />
            <link rel="stylesheet" href="/resources/lib/jquery-datatables-bs3/assets/css/datatables.css" />

            <style>
                .list ul li {
                    list-style: none;
                    display: flex;
                }

                .panel-heading {
                    background-color: transparent;
                }

                /* .panel-body .table-responsive .mb-none tbody tr+tr{ margin-top: 13px;} */
                .panel .panel-heading .row h4 {
                    font-size: 20px;
                }

                td:nth-child(2) {
                    cursor: pointer;
                }
            </style>
        </head>

        <body>
            <section class="body">

                <!-- start: header -->
                <jsp:include page="../../view/common/adminHeader.jsp" />

                <!-- end: header -->

                <div class="inner-wrapper">
                    <!-- start: sidebar -->
                    <jsp:include page="../../view/common/adminSidebar.jsp" />
                    <!-- end: sidebar -->

                    <section role="main" class="content-body">

                        <section class="panel">
                            <header class="panel-heading">
                                <div class="row">
                                    <h4 class="col-sm-7 mb-0">회원목록</h4>
                                    <div class="col-sm-5 mb-sm-0">
                                        <div class="row">
                                            <form id="listForm" role="form" class="notice-search">
                                                <div class="col-sm-4">
                                                    <select class="form-control" name="searchCondition">
                                                        <option value="">회원전체</option>
                                                        <option value="1" ${ ! empty search.searchCondition &&
                                                            search.searchCondition==1 ? "selected" : "" }> 일반회원</option>
                                                        <option value="2" ${ ! empty search.searchCondition &&
                                                            search.searchCondition==2 ? "selected" : "" }>사업자회원</option>
                                                        <option value="3" ${ ! empty search.searchCondition &&
                                                            search.searchCondition==3 ? "selected" : "" }>사업자회원 대기
                                                        </option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-8">
                                                    <div class="search-box">
                                                        <input class="form-control" type="text" placeholder="Search...">
                                                        <button class="search-btn" type="submit"><i
                                                                class="fa fa-search"></i></button>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </header>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-hover mb-none">
                                        <thead>
                                            <tr>
                                                <th>회원유형</th>
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>닉네임/캠핑장명</th>
                                                <th>회원가입 일자</th>
                                                <th>최근 로그인 일자</th>
                                                <th>이용정지</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--리스트에 순서 찍는거 <c:set var ="i" value="0" /> -->
                                            <c:forEach var="user" items="${list}">
                                                <c:if
                                                    test="${user.role!='ADMIN' && user.dormantConversionDate == null && user.secessionRegDate == null && user.suspensionDate==null}">
                                                    <tr>
                                                        <td>${user.role}</td>
                                                        <td>${user.id}</td>
                                                        <td>${user.name}</td>
                                                        <td>
                                                            <c:if test="${user.role == 'GENERAL'}">
                                                                ${user.nickName}
                                                            </c:if>
                                                            <c:if test="${user.role == 'BUSINESS'}">
                                                                ${user.campName}
                                                            </c:if>
                                                        </td>
                                                        <td>${user.addUserRegDate}</td>
                                                        <td>${user.currentLoginRegDate}</td>
                                                        <td>
                                                            <button id="list-addSuspension" type="button">이용정지</button>
                                                        </td>

                                                    </tr>
                                                </c:if>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
                                <input type="hidden" id="currentPage" name="currentPage" value="" />
                                <!-- PageNavigation Start... -->
                                <jsp:include page="../common/pageNavigator.jsp" />
                                <!-- PageNavigation End... -->
                            </div>
                        </section>

                        <!-- end: page -->
                    </section>
                </div>


            </section>

            <jsp:include page="/resources/commonScriptAdmin.jsp" />

            <!-- Specific Page Vendor -->
            <script src="/resources/lib/select2/select2.js"></script>
            <script src="/resources/lib/jquery-datatables/media/js/jquery.dataTables.js"></script>
            <script src="/resources/lib/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
            <script src="/resources/lib/jquery-datatables-bs3/assets/js/datatables.js"></script>

        </body>

        <script type="text/javascript">

            //=============    검색 / page 두가지 경우 모두  Event  처리 =============	
            function fncGetUserList(currentPage) {
                $("#currentPage").val(currentPage)
                $("#listForm").attr("method", "POST").attr("action", "/user/listUser").submit();
            }


            //============= "검색"  Event  처리 =============	
            $(function () {
                //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
                //$( "button.btn.btn-default" ).on("click" , function() {
                //	fncGetUserList(1);
                //});
            });


            //============= userId 에 회원정보보기  Event  처리(Click) =============	
            $(function () {

                //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
                $("td:nth-child(2)").on("click", function () {
                    self.location = "/user/getUser?userId=" + $(this).text().trim();
                });

                //==> userId LINK Event End User 에게 보일수 있도록 
                $("td:nth-child(2)").css("color", "blue");

            });


            //============= userId 에 회원정보보기  Event  처리 (double Click)=============
            $(function () {

                //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
                $("td:nth-child(5) > i").on("click", function () {

                    var userId = $(this).next().val();

                    $.ajax(
                        {
                            url: "/user/json/getUser/" + userId,
                            method: "GET",
                            dataType: "json",
                            headers: {
                                "Accept": "application/json",
                                "Content-Type": "application/json"
                            },
                            success: function (JSONData, status) {

                                var displayValue = "<h6>"
                                    + "아이디 : " + JSONData.userId + "<br/>"
                                    + "이  름 : " + JSONData.userName + "<br/>"
                                    + "이메일 : " + JSONData.email + "<br/>"
                                    + "ROLE : " + JSONData.role + "<br/>"
                                    + "등록일 : " + JSONData.regDateString + "<br/>"
                                    + "</h6>";
                                $("h6").remove();
                                $("#" + userId + "").html(displayValue);
                            }
                        });
                    ////////////////////////////////////////////////////////////////////////////////////////////

                });

                //==> userId LINK Event End User 에게 보일수 있도록 
                $(".ct_list_pop td:nth-child(3)").css("color", "red");
                $("h7").css("color", "red");

                //==> 아래와 같이 정의한 이유는 ??
                $(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
            });

        </script>


        </html>