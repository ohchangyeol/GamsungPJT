<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row getNotice" data-noticeno="${notice.noticeNo}">
  <div class="col-xs-12">
    <div class="row">
      <h4 class="col-sm-7 mb-0">공지 사항</h4>
      <div class="col-sm-5 mb-sm-0">
        <div class="row">
          <button class="btn btn-d btn-round notice-back" type="button"">목록가기</button>
        </div>
      </div>
    </div>
    <hr class="divider-w mt-10 mb-20">

    <!-- 여기 -->
    <div class="notice-content">
      <div class="n-header">
        <h3 class="title">▶ ${notice.noticeTitle} </h3>
        <div class="date-view">
          <span class="date">${notice.regDate} </span>
          <span class="view">${notice.writer.nickName} | 조회수 ${notice.viewCount}</span>
        </div>
        <hr class="divider-w mt-10 mb-20">
      </div>

      <div class="n-body">
        

        <div class="content">
          ${notice.noticeContent}
        </div>
        <hr class="divider-w mt-10 mb-20">

        <c:choose>
        <c:when test="${empty notice.noticeFile1 and empty notice.noticeFile2 and empty notice.noticeFile3 and empty notice.noticeFile4 and empty notice.noticeFile5}">

        </c:when>
        <c:otherwise>
          <div class="row">
            <div class="files col-sm-6">
              <div class="title">첨부파일</div>
              <div class="file-content">
                <ul>
                  <c:if test="${!empty notice.noticeFile1}">
                    <li><a href="/servicecenter/fileDownLoad?fileName=${notice.noticeFile1}"><i class="bi bi-file-earmark-medical"></i>&nbsp;<span>${notice.noticeFile1}</span></a></li>
                  </c:if>
                  <c:if test="${!empty notice.noticeFile2}">
                    <li><a href="/servicecenter/fileDownLoad?fileName=${notice.noticeFile2}"><i class="bi bi-file-earmark-medical"></i>&nbsp;<span>${notice.noticeFile2}</span></a></li>
                  </c:if>
                  <c:if test="${!empty notice.noticeFile3}">
                    <li><a href="/servicecenter/fileDownLoad?fileName=${notice.noticeFile3}"><i class="bi bi-file-earmark-medical"></i>&nbsp;<span>${notice.noticeFile3}</span></a></li>
                  </c:if>
                  <c:if test="${!empty notice.noticeFile4}">
                    <li><a href="/servicecenter/fileDownLoad?fileName=${notice.noticeFile4}"><i class="bi bi-file-earmark-medical"></i>&nbsp;<span>${notice.noticeFile4}</span></a></li>
                  </c:if>
                  <c:if test="${!empty notice.noticeFile5}">
                    <li><a href="/servicecenter/fileDownLoad?fileName=${notice.noticeFile5}"><i class="bi bi-file-earmark-medical"></i>&nbsp;<span>${notice.noticeFile5}</span></a></li>
                  </c:if>
                  
                </ul>
              </div>
            </div>
          </div>
        </c:otherwise>
        </c:choose>

        <hr class="divider-w mt-10 mb-20">
        
        <c:if test="${user.role == 'ADMIN'}">
        <div class="u-d-button-box">
          <button id="notice-update-btn" class="btn btn-warning btn-round" type="button">수정</button>
          <button id="notice-delete-btn" class="btn btn-danger btn-round" type="button">삭제</button>
        </div>
        </c:if>
      </div>
    </div>
  </div>
</div>