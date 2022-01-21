<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    

    <div class="mailbox-compose" style="margin-top: -29px; position: relative;">
        <div class="inner-toolbar clearfix">
            <ul>
                <li class="notice-btn" data-no="3">
                    <i class="fa fa-send-o mr-sm"></i>수정
                </li>
                <li class="notice-btn" data-no="4">
                    <i class="fa fa-times mr-sm"></i> 취소
                </li>
            </ul>
        </div>
        <form id="notice-form" name="notice-form" class="form-horizontal form-bordered form-bordered notice-form" action="" method="" >

            <input type="hidden" name="noticeNo" value="${notice.noticeNo}">
            <div class="form-group form-group-invisible">
                <h2>공지사항 수정</h2>
            </div>

            <div class="form-group form-group-invisible">
                <label for="n_title" class="control-label-invisible">제목</label>
                <div class="col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-10">
                    <input  name="noticeTitle" id="n-title" type="text" class="form-control form-control-invisible"  value="${notice.noticeTitle}">
                </div>
            </div>

            <div class="form-group form-group-invisible">
                <label for="n-files" class="control-label-invisible">첨부파일</label>
                <div id="dropZone" class="col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-6 file-box">
                    <div id="fileDragDesc"> 파일을 드래그 해주세요. </div>
                    <table id="fileListTable" width="100%" border="0px">
                        <tbody id="fileTableTbody">
        
                        </tbody>
                    </table>
                    <input name="files" id="n-files" type="file" class="form-control form-control-invisible" multiple>
                </div>
            </div>
            <c:if test="${!empty notice.noticeFile1}">
                <div class="form-group form-group-invisible registered">
                    <label for="" class="control-label-invisible">등록된 파일</label>
                    <div id="" class="col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-6 file-box">
                        <c:if test="${!empty notice.noticeFile1}">
                            <div><i class="bi bi-file-earmark-medical"></i>&nbsp; ${notice.noticeFile1} </div>
                        </c:if>
                        <c:if test="${!empty notice.noticeFile2}">
                            <div><i class="bi bi-file-earmark-medical"></i>&nbsp; ${notice.noticeFile2} </div>
                        </c:if>
                        <c:if test="${!empty notice.noticeFile3}">
                            <div><i class="bi bi-file-earmark-medical"></i>&nbsp; ${notice.noticeFile3} </div>
                        </c:if>
                        <c:if test="${!empty notice.noticeFile4}">
                            <div><i class="bi bi-file-earmark-medical"></i>&nbsp; ${notice.noticeFile4} </div>
                        </c:if>
                        <c:if test="${!empty notice.noticeFile5}">
                            <div><i class="bi bi-file-earmark-medical"></i>&nbsp; ${notice.noticeFile5} </div>
                        </c:if>
                    </div>
                    <div class="col-sm-offset-1 col-sm-9">※수정시 파일을 다시 등록해주세요.※</div>
                </div>
            </c:if>
            <div class="form-group">
                <div class="compose">
                    <div id="compose-field" class="compose-control">
                    </div>
                </div>
                <input name="noticeContent" id="n-content" type="hidden" value="">
            </div>
        </form>

        <div class="format update-content" style="display: none;">
            ${notice.noticeContent}
        </div>
    </div>