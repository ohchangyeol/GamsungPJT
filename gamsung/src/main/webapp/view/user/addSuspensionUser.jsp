<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">

            <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
            <jsp:include page="../../resources/commonLib.jsp" />
            <style>
                .time {
                    display: flex;
                }

                .form-group .btn {
                    height: 26px;
                    padding-top: 0;
                    padding-bottom: 0;
                    margin: auto 10px;
                    color: blue;
                }

                .form-group label {
                    width: 140px;
                }

                #suspension-btn {
                    padding-top: 15px;
                    display: flex;
                    justify-content: end;
                    gap: 15px;
                }
            </style>

            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



        </head>

        <body>



            <!-- The Modal -->
            <div class="modal" id="addSuspensionModal">
                <div class="modal-dialog-centered">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h5 class="modal-title">회원 이용정지 등록</h5>
                        </div>

                        <form class="modal-body" role="form">
                            <div id="" class="form-group row">

                                <label for=""
                                    class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
                                <div class="col-sm-6">
                                    <input id="addSuspention_id" name="id" class="form-control " type="text"
                                        placeholder="아이디를 입력하세요." style="border-radius:10px;" />
                                </div>

                            </div>
                            <div id="" class="form-group row">

                                <label for="message-text" class="col-sm-offset-1 col-sm-3 col-form-label"><strong>이용정지
                                        사유</strong></label>
                                <div class="col-sm-6">
                                    <textarea class="form-control" id="message-text" name="suspensionContent"
                                        placeholder="이용정지 사유를 입력하세요." style="border-radius:10px;"
                                        maxlength="200"> </textarea>
                                </div>
                            </div>

                        </form>

                        <div class="col-sm-3 col-sm-offset-2"></div>
                        <div class="col-sm-3 col-sm-offset-2">
                            <div id="suspension-btn">
                                <button id="cancel" class="btn btn-border-d btn-circle" type="button">취소</button>
                                <button id="addSuspension-user" class="btn btn-border-d btn-circle"
                                    type="button">확인</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">

                $(function () {
                    $("#addSuspension-user").on('click', function () {
                        $("form").attr("method", "POST").attr("action", "/user/addSuspensionUser").submit();
                    });
                });
            </script>
        </body>

        </html>