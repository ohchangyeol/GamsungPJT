<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <div id="findIdPwdModal" style="display:none;">
        <div class="modal-block white-popup-block mfp find">
            <section class="panel">
                <div role="tabpanel">
                    <ul class="nav nav-tabs font-alt" role="tablist">
                        <li class="active"><a href="#findId-modal" data-toggle="tab" aria-expanded="true">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">아이디 찾기</font>
                                </font>
                            </a></li>
                        <li class=""><a href="#findPwd-modal" data-toggle="tab" aria-expanded="false">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">비밀번호 찾기</font>
                                </font>
                            </a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="findId-modal">
                            <div class="panel-body row">
                                <form action="" class="was-validated" id="ModalFindId">
                                    <div class="col-sm-8">
                                        <div class="form-group row">
                                            <input type="text" class="form-control" id="findIdName"
                                                placeholder="이름을 입력하세요." name="name" required>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="col-sm-8">
                                            <div class="form-group row" style="margin-top: 15px;">
                                                <input id="findIdPhone" name="phone" class="form-control " type="text"
                                                    placeholder="휴대폰 번호를 숫자만 입력해주세요." maxlength="11" />
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <button id="findIdPhoneAuthNum" class="btn btn-circle btn-xs" type="button"
                                                style="margin-top: 15px; padding: 9px 17px;">인증번호 받기</button>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">

                                        <div class="form-group row" id="findIdCheckPhoneAuth"
                                            style="display:none; margin-top: 15px;">
                                            <input id="findIdCheckPhoneAuthNum" name="checkPhoneAuthNum"
                                                class="form-control " type="text" placeholder="인증번호를 입력하세요."
                                                maxlength="4" />
                                        </div>
                                        <div id="findId-check-phone" class='col-sm-offset-3 col-sm-6'></div>
                                        <div id="findId-check-phone-auth" class='col-sm-offset-3 col-sm-6'></div>
                                    </div>

                                    <div class="find-btn">
                                        <div align="right"><button type="button" class="btn btn-circle btn-sm" style="background-color: #3974d9;
                                            color: #fff;" id="findId">아이디찾기</button></div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="tab-pane" id="findPwd-modal">
                            <div class="panel-body">
                                <form action="" class="was-validated" id="ModalFindPwdId">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="findPwdId" placeholder="아이디를 입력하세요."
                                            name="id" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="findPwdName"
                                            placeholder="이름을 입력하세요." name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="findPwdPhone"
                                            placeholder="휴대폰 번호를 숫자만 입력해주세요." name="phone" required>
                                    </div>
                                    <div align="right" class="find-btn"><button type="button" style="background-color: #3974d9;
                                        color: #fff;" class="btn btn-circle btn-sm" id="findPwd">비밀번호찾기</button></div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>

    </div>