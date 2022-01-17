<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

    

    <div class="mailbox-compose" style="margin-top: -29px; position: relative;">
        <div class="inner-toolbar clearfix">
            <ul>
                <li class="notice-btn" data-no="1">
                    <i class="fa fa-send-o mr-sm"></i>등록
                </li>
                <li class="notice-btn" data-no="2">
                    <i class="fa fa-times mr-sm"></i> 초기화
                </li>
            </ul>
        </div>
        <form id="notice-form" name="notice-form" class="form-horizontal form-bordered form-bordered notice-form" action="" method="" >
            <input type="hidden" name="id" value="${user.id}">
            <div class="form-group form-group-invisible">
                <h2>공지사항 등록</h2>
            </div>

            <div class="form-group form-group-invisible">
                <label for="n_title" class="control-label-invisible">제목</label>
                <div class="col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-10">
                    <input  name="noticeTitle" id="n-title" type="text" class="form-control form-control-invisible"  value="">
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
            <div class="form-group">
                <div class="compose">
                    <div id="compose-field" class="compose-control">
                    </div>
                </div>
                <input name="noticeContent" id="n-content" type="hidden">
            </div>
        </form>
    </div>