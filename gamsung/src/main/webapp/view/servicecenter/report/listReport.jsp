<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="panel">
  <header class="panel-heading" style="background-color: transparent;border-bottom: none;">
    <div class="row">
      <h4 class="col-sm-7 mb-0">신고 내역 조회</h4>
      <div class="col-sm-5 mb-sm-0">
        <div class="row">
        <form role="form" class="rerport-search">
          <div class="col-sm-4">
          <select class="form-control">
            <option selected="selected">제목+내용</option>
            <option>제목</option>
            <option>내용</option>
          </select>
          </div>
          <div class="col-sm-8">
          <div class="search-box">
            <input class="form-control" type="text" placeholder="Search...">
            <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
          </div>
          </div>
          
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
    <div class="pagination font-alt page-nav">
      <a href="#">
        <i class="fa fa-angle-left"></i>
      </a>
      <a class="active" href="#">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">
        <i class="fa fa-angle-right"></i>
      </a>
      </div>
  </div>
</section>
