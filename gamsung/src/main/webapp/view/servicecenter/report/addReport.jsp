<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../resources/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link href="../../../resources/css/serviceCenter.css" rel="stylesheet">


    <title>신고하기</title>
   
</head>
<body class="add-report" data-rename="${receiverName}">
    <div class="report-main white-popup-block">
        <main>
            <div class="report-header">
                <h3>신고 하기</h3>
                <!-- <h3>신고상세 보기</h3> -->
            </div>
            <div class="report-body">
                <form id="report-add-form" name="report-add-form" class="form-horizontal form-bordered form-bordered notice-form">
                    <input type="hidden" name="id" value="${user.id}">
                    <input type="hidden" name="role" value="${user.role}">
                    <div>
                        <label for="report-type">유형 선택</label>
                        <select name="reportType" id="report-type" class="form-control">
                            <c:if test="${ ! empty reportType }">
                                <option value="1" ${reportType == 1 ? "selected" : "" } >캠핑장 신고</option>
                                <option value="2" ${reportType == 2 ? "selected" : "" }>경매 신고</option>
                                <option value="3" ${reportType == 3 ? "selected" : "" }>커뮤니티 신고</option>
                                <option value="4" ${reportType == 4 ? "selected" : "" }>예약양도 신고</option>
                                <option value="5" ${reportType == 5 ? "selected" : "" }>고객 신고</option>
                            </c:if>
                            <c:if test="${empty reportType}">
                                <option value="1" selected>캠핑장 신고</option>
                                <option value="2">경매 신고</option>
                                <option value="3">커뮤니티 신고</option>
                                <option value="4">예약양도 신고</option>
                                <c:if test='${user.role == "BUSINESS"}'>
                                    <option value="5">고객 신고</option>
                                </c:if>
                            </c:if>
                        </select>
                    </div>
                    <div>
                        <c:if test="${ ! empty reportType }">
                        <label id="receiver-name" for="report-receiver">
                            ${reportType eq '1' ? "캠핑장 명 *" : "상대방 닉네임 *" } 
                        </label>
                        <input id="report-receiver" name="${reportType eq '1' ? receiverCampName : receiverNickName }" type="text" class="form-control" value="${receiverName}"/> 
                        </c:if>
                        
                        <c:if test="${ empty reportType }">
                        <label id="receiver-name" for="report-receiver">
                            캠핑장 명 *
                        </label>
                        <input id="report-receiver" name="receiverCampName" type="text" class="form-control"/> 
                        </c:if>
                        

                        
                    </div>
                    <div>
                        <label for="report-content">신고 내용 *</label>
                        <textarea name="reportContent" id="report-content" cols="30" rows="10"class="form-control"></textarea>
                    </div>
                    <div >
                        <p>사진첨부</p>
                        <div class="img-content"> 
                            <div>
                                <label for="file1" class="file-list"><i class="bi bi-plus-square-dotted"></i></label>
                                <a href="#" class="delete-btn" data-id="file1"><img src=""></a>
                                <input type="file" name="files" id="file1" style="display: none;">
                            </div>
                            <div>
                                <label for="file2" class="file-list"><i class="bi bi-plus-square-dotted"></i></label>
                                <a href="#" class="delete-btn" data-id="file2"><img src=""></a>
                                <input type="file" name="files" id="file2" style="display: none;">
                            </div>
                            <div>
                                <label for="file3" class="file-list"><i class="bi bi-plus-square-dotted"></i></label>
                                <a href="#" class="delete-btn" data-id="file3"><img src=""></a>
                                <input type="file" name="files" id="file3" style="display: none;">
                            </div>
                        </div>
                    </div>
                </form>
                
            </div>
            <div class="report-footer">
                <button type="button" class="btn btn-danger report-send">신고하기</button>
                <!-- <button type="button" class="btn btn-danger">취소하기</button> -->
            </div>
        </main>
    </div>


    <script src="../../../resources/lib/jquery/jquery.min.js"></script>
    <script src="/resources//lib/bootstrap/js/bootstrap.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="../../../resources/js/addReportEvent.js"></script>
    
    
    
</body>
</html>