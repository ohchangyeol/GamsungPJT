<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>신고 내역</title>
    
    <jsp:include page="/resources/commonLib.jsp"/>

    <link id="color-scheme" href="../../../resources/css/serviceCenter.css" rel="stylesheet">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" class="myReport">
    <main>
      
      <!-- header -->
      <jsp:include page="../../common/header.jsp"/>
      <!-- header End -->

      <div class="main sc-main">
        <section class="module bg-dark-30 about-page-header" data-background="../../../resources/images/report.jpg" style="padding: 200px;">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt mb-0">신고 내역</h1>
              </div>
            </div>
          </div>
        </section>
        <section class="module" style="padding-top: 50px;">
          <div class="container">

            <section class="panel">
              <header class="panel-heading">
                <div class="row">
                  <h4 class="col-sm-7 mb-0 font-jua main-color" style="font-size: 34px;font-weight: 400;">신고 내역 조회</h4>
                  <div class="col-sm-5 mb-sm-0" style="margin-top: 15px;">
                    <div class="row">
                    <form role="form" class="rerport-search" method="post">
                      <div class="col-sm-4">
                      <select class="form-control" name="searchCondition">
                        <option value="0" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==0 ? "selected" : "" }>제목+내용</option>
                        <option value="1" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==1 ? "selected" : "" }>제목</option>
                        <option value="2" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==2 ? "selected" : "" }>내용</option>
                      </select>
                      </div>
                      <div class="col-sm-8">
                      <div class="search-box">
                        <input class="form-control" type="text" placeholder="Search..." name="searchKeyword" value="${wrapper.search.searchKeyword}">
                        <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                      </div>
                      </div>
                      <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
                      
                    </form>
                    </div>
                  </div>
            
                </div>
              </header>
              <hr class="divider-w mt-10 mb-20">
              <div class="panel-body my-report">
                <div class="table-responsive">
                  <table class="table table-hover mb-none">
                    <thead>
                      <tr>
                        <th>신고번호</th>
                        <!-- <th>신고자 아이디</th> -->
                        <th>신고 유형</th>
                        <th>상대방 아이디</th>
                        <th>상태</th>
                        <th>접수일자</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var ="report" items="${wrapper.reports}">
                      <tr>
                        <td class="report-no">${report.reportNo}</td>
                        
                        <td>${report.reportTypeName}</td>
                        <td>
                          ${report.receiver.nickName}
                          ${report.receiver.campName}
                        </td>
                        <td>
                          <c:if test="${report.reportStatus == 0 }">접수완료</c:if>
                          <c:if test="${report.reportStatus == 1 }">처리승인</c:if>
                          <c:if test="${report.reportStatus == 2 }">처리거부</c:if>
                        </td>
                        <td>${report.regDate}</td>
                      </tr>
                    </c:forEach>
                      
            
                    </tbody>
                  </table>
                </div>

                <jsp:include page="../../common/pageNavigator.jsp"/>

              </div>
            </section>

            
            

          </div>
        </section>

        <jsp:include page="../../common/footer.jsp"/>

    </main>
    
    <script src="../../../resources/js/servicecenter/report.js"></script>
    
  </body>
</html>