<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="table-list-padding">
  <div class="col-xs-12">
    <div class="row">
      <h4 class="col-sm-7 mb-0">공지 사항</h4>
      <div class="col-sm-5 mb-sm-0">
        <div class="row">
          <form role="form" class="notice-search">
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
    <hr class="divider-w mt-10 mb-20">
    <div class="notice-list">
      <ul>
        <!-- list Start -->
        <c:forEach var ="notice" items="${wrapper.notices}">
        <li>
          <div class="row">
            <div class="col-sm-2 notice-no">${notice.noticeNo}</div>
            <div class="col-sm-6 notice-title">${notice.noticeTitle}</div>
            <div class="col-sm-2 notice-view-count"><i class="fa fa-fw"></i> ${notice.viewCount}</div>
            <div class="col-sm-2 notice-reg-date">${notice.regDate}</div>
          </div>
        </li>
      </c:forEach>
        
      </ul>
    </div>
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