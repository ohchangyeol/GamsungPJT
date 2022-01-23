<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row get-report" data-reportno="${report.reportNo}" data-receiverid="${report.receiver.id}">
    <div class="col-xs-12">
      <div class="row panel-heading" style="background-color: transparent;border-bottom: none;">
        <h4 class="col-sm-7 mb-0">신고 상세 조회</h4>
        <div class="col-sm-5 mb-sm-0">
          <div class="row">
            <button class="btn btn-d btn-round report-back" type="button"">목록가기</button>
          </div>
        </div>
      </div>
      <hr class="divider-w mt-10 mb-20">
  
      <!-- 여기 -->
      <div class="r-content">
        <div class="r-header">
          <h3 class="title">▶ [${report.sender.nickName}${report.sender.campName}] 님의 신고 내역 입니다.</h3>
          <div class="date-view">
            <span class="date">${report.regDate}</span>
          </div>
          <hr class="divider-w mt-10 mb-20">
        </div>
  
        <div class="r-body">
          <div class="content">
            <ul>
                <li>
                    <div class="report-title">신고 유형</div>
                    <div class="report-text">${report.reportTypeName}</div>
                </li>
                <li>
                    <div class="report-title" ">상대방 아이디</div>
                    <div class="report-text">${report.receiver.id}</div>
                </li>
                <li>
                    <div class="report-title" ">상대방 닉네임</div>
                    <div class="report-text">${report.receiver.nickName}${report.receiver.campName}</div>
                </li>
                <li>
                    <div class="report-title">신고 내용</div>
                    <div class="report-text">${report.reportContent}</div>
                </li>
                <li>
                    <div class="report-title">사진 첨부</div>
                    <div class="report-text">
                        <div class="report-img-box">
                            <c:if test="${!empty report.reportImgFile1}">
                                <a href="/uploadfiles/servicecenter/${report.reportImgFile1}" class="image-link" data-id="file1"><img class="upload" src="/uploadfiles/servicecenter/${report.reportImgFile1}"></a>
                            </c:if>
                            <c:if test="${!empty report.reportImgFile2}">
                                <a href="/uploadfiles/servicecenter/${report.reportImgFile2}" class="image-link" data-id="file1"><img class="upload" src="/uploadfiles/servicecenter/${report.reportImgFile2}"></a>
                            </c:if>
                            <c:if test="${!empty report.reportImgFile3}">
                                <a href="/uploadfiles/servicecenter/${report.reportImgFile3}" class="image-link" data-id="file1"><img class="upload" src="/uploadfiles/servicecenter/${report.reportImgFile3}"></a>
                            </c:if>
                            <c:if test="${empty report.reportImgFile1 and empty report.reportImgFile2 and empty report.reportImgFile3}">
                            이미지가 없습니다.
                            </c:if>
                        </div>
                    </div>
                </li>
            </ul>            
          </div>
          <hr class="divider-w mt-10 mb-20">
          <c:if test="${user.role == 'ADMIN'}">
            <c:if test="${report.reportStatus == 0}">
              <div class="u-d-button-box">
                <button class="btn btn-warning btn-round report-updatecode-btn" type="button" data-code= "1">신고 승인</button>
                <button class="btn btn-danger btn-round report-updatecode-btn" type="button" data-code= "2">신고 거절</button>
              </div>
            </c:if>
            <c:if test="${report.reportStatus == 1}">
              <span>승인 된 접수 내용입니다.</span>
            </c:if>
            <c:if test="${report.reportStatus == 2}">
              <span>승인되지 않은 접수내용입니다.</span>
            </c:if>
          </c:if>
        </div>
      </div>
    </div>
  </div>