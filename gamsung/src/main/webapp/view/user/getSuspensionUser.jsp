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

                #suspension-confirm-btn {
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

        <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

            <main>

                <jsp:include page="../common/header.jsp"></jsp:include>

                <div class="main">
                    <section class="module bg-dark-30 about-page-header" data-background="assets/images/about_bg.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-3">
                                    <h1 class="module-title font-alt mb-0">Forms</h1>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="module">
                        <div class="container">
                            <div class="col-sm-8 col-sm-offset-2">
                                <hr class="divider-w mt-10 mb-20">
                                <form class="form" role="form">
                                    <div id="" class="form-group row">

                                        <label for=""
                                            class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
                                        <div class="col-sm-6">
                                            <input id="suspention-id" name="id" class="form-control " type="text"
                                                value="${user.id}" placeholder="아이디를 입력하세요." style="border-radius:10px;"
                                                readonly />
                                        </div>

                                    </div>
                                    <div id="" class="form-group row">

                                        <label for="message-text"
                                            class="col-sm-offset-1 col-sm-3 col-form-label"><strong>이용정지
                                                사유</strong></label>
                                        <div class="col-sm-6">
                                            <textarea class="form-control" id="suspension-message-text"
                                                name="suspensionContent" value="${user.suspensionContent}"
                                                style="border-radius:10px;" readonly> </textarea>
                                        </div>
                                    </div>

                                </form>

                            </div>
                            <div class="col-sm-3 col-sm-offset-2"></div>
                            <div class="col-sm-3 col-sm-offset-2">
                                <div id="suspension-confirm-btn">
                                    <button id="cancel" class="btn btn-border-d btn-circle" type="button">취소</button>
                                    <button id="ok" class="btn btn-border-d btn-circle" type="button">확인</button>

                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </main>



            <script type="text/javascript">
            </script>
        </body>

        </html>