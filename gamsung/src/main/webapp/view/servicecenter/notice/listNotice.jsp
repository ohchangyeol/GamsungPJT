<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="table-list-padding">
  <div class="col-xs-12">
    <div class="row">
      <h4 class="col-sm-7 mb-0 font-jua main-color"style="font-size: 34px;font-weight:400">공지 사항</h4>
      <div class="col-sm-5 mb-sm-0 search-contents" style="margin-top: 15px;">
        <div class="row">
          <form role="form" class="notice-search">
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
                <button class="search-btn notice-search-btn" type="submit"><i class="fa fa-search"></i></button>
              </div>
            </div>
            <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
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
            <div class="col-sm-2 notice-view-count">
              <div> 
                <i class="fa fa-fw"></i> 
                ${notice.viewCount}
              </div>
              <div>
                <c:if test="${!empty notice.noticeFile1 or !empty notice.noticeFile2 or !empty notice.noticeFile3 or !empty notice.noticeFile4 or !empty notice.noticeFile5}">
                  <i class="bi bi-file-earmark-medical"></i>
                </c:if>
              </div>
            </div>
            <div class="col-sm-2 notice-reg-date">${notice.regDate}</div>
          </div>
        </li>
      </c:forEach>
        
      </ul>
    </div>
  </div>

  <jsp:include page="../../common/pageNavigator.jsp"/>
  

</div>