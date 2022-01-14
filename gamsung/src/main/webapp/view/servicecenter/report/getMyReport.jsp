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
    <link href="/resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">

    <link href="../../../resources/css/serviceCenter.css" rel="stylesheet">


    <title>신고상세조회</title>
   
</head>
<body class="get-report" data-reportno="${report.reportNo}">
    <div class="report-main white-popup-block">
        <main>
            <div class="report-header">
                <h3>신고 상세 조회</h3>
            </div>
            <div class="report-body">
                <div>
                    <label for="report-type">유형 선택</label>
                    <select name="reportType" id="report-type" class="form-control" disabled>
                        <option value="1" ${report.reportType == 1 ? "selected" : "" } >캠핑장 신고</option>
                        <option value="2" ${report.reportType == 2 ? "selected" : "" }>경매 신고</option>
                        <option value="3" ${report.reportType == 3 ? "selected" : "" }>커뮤니티 신고</option>
                        <option value="4" ${report.reportType == 4 ? "selected" : "" }>예약양도 신고</option>
                        <option value="5" ${report.reportType == 5 ? "selected" : "" }>고객 신고</option>
                    </select>
                </div>
                <div>
                    <label id="receiver-name" for="report-receiver">
                        ${report.reportType == 1 ? "캠핑장 명 *" : "상대방 닉네임 *" } 
                    </label>
                    <input id="report-receiver" type="text" class="form-control" value="${report.receiver.nickName}${report.receiver.campName}" disabled/> 
                </div>
                <div>
                    <label for="report-content">신고 내용 *</label>
                    <textarea name="reportContent" id="report-content" cols="30" rows="10"class="form-control" disabled>${report.reportContent}</textarea>
                </div>
                <div >
                    <p>사진첨부</p>
                    <div class="img-content"> 
                        <div>
                            <c:if test="${!empty report.reportImgFile1}">
                                <a href="/uploadfiles/servicecenter/${report.reportImgFile1}" class="image-link" data-id="file1"><img class="upload" src="/uploadfiles/servicecenter/${report.reportImgFile1}"></a>
                            </c:if>
                            <c:if test="${empty report.reportImgFile1}">
                                <img class="upload" data-src="holder.js/96x90" alt="">
                            </c:if>
                        </div>
                        <div>
                            <c:if test="${!empty report.reportImgFile2}">
                                <a href="/uploadfiles/servicecenter/${report.reportImgFile2}" class="image-link" data-id="file1"><img class="upload" src="/uploadfiles/servicecenter/${report.reportImgFile2}"></a>
                            </c:if>
                            <c:if test="${empty report.reportImgFile2}">
                                <img class="upload" data-src="holder.js/96x90" alt="">
                            </c:if>
                        </div>
                        <div>
                            <c:if test="${!empty report.reportImgFile3}">
                                <a href="/uploadfiles/servicecenter/${report.reportImgFile3}" class="image-link" data-id="file1"><img class="upload" src="/uploadfiles/servicecenter/${report.reportImgFile3}"></a>
                            </c:if>
                            <c:if test="${empty report.reportImgFile3}">
                                <img class="upload" data-src="holder.js/96x90" alt="">
                            </c:if>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="report-footer">
                <button type="button" class="btn btn-danger report-cancel">취소하기</button>
            </div>
        </main>
    </div>


    <script src="../../../resources/lib/jquery/jquery.min.js"></script>
    <script src="/resources//lib/bootstrap/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.8/holder.min.js" integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="/resources/lib/magnific-popup/magnific-popup.js"></script>
    <script src="../../../resources/js/addReportEvent.js"></script>
    <script src="../../../resources/js/servicecenter/report.js"></script>
    
    
    
    
</body>
</html>