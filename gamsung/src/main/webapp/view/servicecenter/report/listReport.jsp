<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="panel">
  <header class="panel-heading" style="background-color: transparent;border-bottom: none;">
    <div class="row">
      <h4 class="col-sm-7 mb-0">신고 내역 조회</h4>
      <div class="col-sm-5 mb-sm-0">
        <div style="position: absolute; right: 0">
        <form role="form" class="rerport-search">
          
          <div>
            <select id="report-condition" class="form-control" name="searchCondition">
              <option value="0" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==0 ? "selected" : "" }>전체</option>
              <option value="1" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==1 ? "selected" : "" }>캠핑장 신고</option>
              <option value="2" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==2 ? "selected" : "" }>경매 신고</option>
              <option value="3" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==3 ? "selected" : "" }>커뮤니티 신고</option>
              <option value="4" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==4 ? "selected" : "" }>예약양도 신고</option>
              <option value="5" ${ ! empty wrapper.search.searchCondition && wrapper.search.searchCondition==5 ? "selected" : "" }>이용고객 신고</option>
            </select>
          </div>
          <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
          
        </form>
        </div>
      </div>

    </div>
  </header>
  <hr class="divider-w mt-10 mb-20">
  <div class="panel-body">
    <div class="table-responsive">
      <table class="table table-hover mb-none">
        <thead>
          <tr>
            <th>신고번호</th>
            <th>신고자 아이디</th>
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
            <td>
              ${report.sender.nickName}
              ${report.sender.campName}
            </td>
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
