<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">

            <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

            <link rel="apple-touch-icon" sizes="57x57" href="../../resources/images/favicons/apple-icon-57x57.png">
            <link rel="apple-touch-icon" sizes="60x60" href="../../resources/images/favicons/apple-icon-60x60.png">
            <link rel="apple-touch-icon" sizes="72x72" href="../../resources/images/favicons/apple-icon-72x72.png">
            <link rel="apple-touch-icon" sizes="76x76" href="../../resources/images/favicons/apple-icon-76x76.png">
            <link rel="apple-touch-icon" sizes="114x114" href="../../resources/images/favicons/apple-icon-114x114.png">
            <link rel="apple-touch-icon" sizes="120x120" href="../../resources/images/favicons/apple-icon-120x120.png">
            <link rel="apple-touch-icon" sizes="144x144" href="../../resources/images/favicons/apple-icon-144x144.png">
            <link rel="apple-touch-icon" sizes="152x152" href="../../resources/images/favicons/apple-icon-152x152.png">
            <link rel="apple-touch-icon" sizes="180x180" href="../../resources/images/favicons/apple-icon-180x180.png">
            <link rel="icon" type="image/png" sizes="192x192"
                href="../../resources/images/favicons/android-icon-192x192.png">
            <link rel="icon" type="image/png" sizes="32x32" href="../../resources/images/favicons/favicon-32x32.png">
            <link rel="icon" type="image/png" sizes="96x96" href="../../resources/images/favicons/favicon-96x96.png">
            <link rel="icon" type="image/png" sizes="16x16" href="../../resources/images/favicons/favicon-16x16.png">
            <meta name="msapplication-TileColor" content="#ffffff">
            <meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
            <meta name="theme-color" content="#ffffff">

            <link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <!-- Template specific stylesheets-->
            <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
            <link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
            <link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
            <link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
            <link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
            <link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
            <link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
            <link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
            <link href="../../resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
            <!-- Main stylesheet and color file-->
            <link href="../../resources/css/style.css" rel="stylesheet">
            <link id="color-scheme" href="../../resources/css/colors/default.css" rel="stylesheet">

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

                #checkMailAuthNum {
                    margin: 14px;
                }

                #checkPhoneAuthNum {
                    margin: 14px;
                }
            </style>

            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


        </head>

        <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
            <main>
                <div class="page-loader">
                    <div class="loader">Loading...</div>
                </div>
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
                                <h5 class="font-alt mb-0">회원 이용정지 등록</h5>
                                <hr class="divider-w mt-10 mb-20">
                                <form class="form" role="form">
                                    <div id="" class="form-group row">

                                        <label for=""
                                            class="col-sm-offset-1 col-sm-3 control-label"><strong>아이디</strong></label>
                                        <div class="col-sm-6">
                                            <input id="addSuspention-id" name="id" class="form-control " type="text"
                                                value="" placeholder="아이디를 입력하세요." style="border-radius:50%;" />
                                        </div>

                                    </div>
                                    <div id="" class="form-group row">

                                        <label for="message-text"
                                            class="col-sm-offset-1 col-sm-3 col-form-label"><strong>이용정지
                                                사유</strong></label>
                                        <div class="col-sm-6">
                                            <textarea class="form-control" id="message-text" name="suspensionContent"
                                                placeholder="이용정지 사유를 입력하세요."></textarea>
                                        </div>
                                    </div>

                                </form>

                            </div>

                            <br />
                            <div class="col-sm-3 col-sm-offset-2"></div>
                            <div class="col-sm-3 col-sm-offset-2">
                                <div class="row">
                                    <button id="cancel" class="btn btn-border-d btn-circle" type="button">취소</button>
                                    <button id="" class="btn btn-border-d btn-circle" type="submit">확인</button>

                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </main>


            <script src="../../resources/lib/jquery/jquery.js"></script>
            <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
            <script src="../../resources/lib/wow/wow.js"></script>
            <script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
            <script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
            <script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
            <script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
            <script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
            <script src="../../resources/lib/smoothscroll.js"></script>
            <script src="../../resources/lib/magnific-popup/jquery.magnific-popup.js"></script>
            <script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
            <script src="../../resources/js/plugins.js"></script>

            <script type="text/javascript">

            </script>
        </body>

        </html>