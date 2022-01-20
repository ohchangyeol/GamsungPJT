<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    <!-- admin Sidebar -->
    <aside id="sidebar-left" class="sidebar-left">

        <!-- 상단 Start -->
        <div class="sidebar-header">
            <div class="sidebar-title">
                <div class="logo" style="margin-left: 35px;">
                    <svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="70px" viewBox="0 0 200 100"
                        style="enable-background:new 0 0 200 100;" xml:space="preserve">
                        <style type="text/css">
                            .st0 {
                                fill: #FFF;
                                stroke: #FFF;
                                stroke-width: 8;
                                stroke-linecap: round;
                                stroke-linejoin: round;
                                stroke-miterlimit: 10;
                            }

                            .st1 {
                                fill: none;
                                stroke: #FFF;
                                stroke-width: 8;
                                stroke-linecap: round;
                                stroke-linejoin: round;
                                stroke-miterlimit: 10;
                            }

                            .st2 {
                                fill: none;
                                stroke: #FFF;
                                stroke-width: 4;
                                stroke-linecap: round;
                                stroke-linejoin: round;
                                stroke-miterlimit: 10;
                            }
                        </style>
                        <polygon class="st0" points="88.5,13 101.7,31.1 146.9,93 101.7,93 101.7,31.5 " />
                        <line class="st1" x1="114.1" y1="13" x2="57.7" y2="91.9" />
                        <g>
                            <path class="st2" d="M170.5,61.2c0,0-10.3-3.4-10.3-15.4c0,12-10.3,15.4-10.3,15.4" />
                            <path class="st2" d="M170.5,68c0,0-10.3-3.4-10.3-15.4c0,12-10.3,15.4-10.3,15.4" />
                            <path class="st2" d="M170.5,76.6c0,0-10.3-3.4-10.3-15.4c0,12-10.3,15.4-10.3,15.4" />
                            <path class="st2" d="M170.5,85.1c0,0-10.3-3.4-10.3-15.4c0,12-10.3,15.4-10.3,15.4" />
                            <line class="st2" x1="160.3" y1="45.8" x2="160.3" y2="91.9" />
                        </g>
                        <g>
                            <path class="st2" d="M51.6,59.8c0,0-11.3-3.8-11.3-17.1C40.3,56,29,59.8,29,59.8" />
                            <path class="st2" d="M51.6,67.4c0,0-11.3-3.8-11.3-17.1C40.3,63.6,29,67.4,29,67.4" />
                            <path class="st2" d="M51.6,76.9c0,0-11.3-3.8-11.3-17.1C40.3,73.1,29,76.9,29,76.9" />
                            <path class="st2" d="M51.6,86.4c0,0-11.3-3.8-11.3-17.1C40.3,82.6,29,86.4,29,86.4" />
                            <line class="st2" x1="40.3" y1="42.7" x2="40.3" y2="94" />
                        </g>
                        <g>
                            <path class="st2" d="M23.8,66.7c0,0-9.1-3-9.1-13.7c0,10.6-9.1,13.7-9.1,13.7" />
                            <path class="st2" d="M23.8,75.8c0,0-9.1-3-9.1-13.7c0,10.6-9.1,13.7-9.1,13.7" />
                            <path class="st2" d="M23.8,84.9c0,0-9.1-3-9.1-13.7c0,10.6-9.1,13.7-9.1,13.7" />
                            <line class="st2" x1="14.7" y1="53" x2="14.7" y2="94" />
                        </g>
                        <g>
                            <path class="st2" d="M194,64.6c0,0-9.1-3-9.1-13.7c0,10.6-9.1,13.7-9.1,13.7" />
                            <path class="st2" d="M194,73.7c0,0-9.1-3-9.1-13.7c0,10.6-9.1,13.7-9.1,13.7" />
                            <path class="st2" d="M194,82.8c0,0-9.1-3-9.1-13.7c0,10.6-9.1,13.7-9.1,13.7" />
                            <line class="st2" x1="184.9" y1="50.9" x2="184.9" y2="91.9" />
                        </g>
                    </svg>
                </div>
            </div>
            <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html"
                data-fire-event="sidebar-left-toggle">
                <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
            </div>
        </div>
        <!-- 상단 End -->

        <!-- 사이드 Start -->
        <div class="nano">
            <div class="nano-content">

                <!-- 메뉴 Start -->
                <nav id="menu" class="nav-main" role="navigation">
                    <ul class="nav nav-main">

                        <li class="nav-active">
                            <a href="/">
                                <i class="fa fa-home" aria-hidden="true"></i>
                                <span>메인화면</span>
                            </a>
                        </li>

                        <li class="nav-parent">
                            <a>
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>회원관리</span>
                            </a>
                            <ul class="nav nav-children">
                                <li>
                                    <a href="/user/listUser/list">
                                        회원목록
                                    </a>
                                </li>
                                <li>
                                    <a href="/user/listUser/dormant">
                                        휴면회원
                                    </a>
                                </li>
                                <li>
                                    <a href="/user/listUser/reportSuspension">
                                        신고/이용정지 회원
                                    </a>
                                </li>
                                <li>
                                    <a href="/user/listUser/secession">
                                        탈퇴회원
                                    </a>
                                </li>
                            </ul>
                        </li>

		
	                     <li class="nav-parent">
	                        <a>
	                            <i class="fa fa-tree" aria-hidden="true"></i>
	                            <span>캠핑장관리</span>
	                        </a>
	
	                        <ul class="nav nav-children">                    
	                        
	                            <li>
	                                <a href="/campBusiness/listCamp">
	                                    캠핑장 목록
	                                </a>
	                            </li>
	                       
	                            <li>
	                                <a href="/campBusiness/listMainSite">
	                                    캠핑장-주요시설 목록
	                                </a>
	                            </li>
	                             <li>
	                                <a href="/campBusiness/listSubSite">
	                                    캠핑장-부가시설 목록
	                                </a>
	                            </li>
	                       
	                        <!--
	                            <li>
	                                <a href="/campBusiness/listCampQna">
	                                    캠핑장-Q&A 목록
	                                </a>
	                            </li>
	                            <li>
	                                <a href="/campBusiness/listCampNotice">
	                                    캠핑장-공지사항 목록
	                                </a>
	                            </li>
	                        --> 
	                        
	                        </ul>
	                    </li>
	
		            
                    
		                    <li class="nav-parent">
		                        <a>
		                            <i class="fa fa-gavel" aria-hidden="true"></i>
		                            <span>경매관리</span>
		                        </a>
		                        <ul class="nav nav-children">
		                            <li>
		                                <a href="/auction/auctionSuspension?currentPage=1">
		                                   경매 이용정지 회원관리
		                                </a>
		                            </li>
		                             <li>
		                                <a href="/auction/auctionStatistics">
		                                   경매 통계
		                                </a>
		                            </li>
		                        </ul>
		                    </li>
                    
                    
		                    <li class="nav-parent">
		                        <a>
		                            <i class="fa fa-align-left" aria-hidden="true"></i>
		                            <span>고객 센터</span>
		                        </a>
		                        <ul class="nav nav-children">
		                            <li class="nav-parent">
		                                <a>공지사항</a>
		                                <ul class="nav nav-children">
		                                    <li>
		                                        <a href="/servicecenter/addNotice">공지사항 등록</a>
		                                    </li>
		                                    <li>
		                                        <a href="/servicecenter/listNotice">공지사항 목록</a>
		                                    </li>
		                                </ul>
		                            </li>
		                            <li>
		                                <a href="/servicecenter/listQna">Q & A</a>
		                            </li>
		                            <li>
		                                <a href="/servicecenter/listReport">신고 내역</a>
		                            </li>
		                        </ul>
		                    </li>
                    
                    
		                    <li class="nav-parent">
		                        <a>
		                            <i class="fa fa-money" aria-hidden="true"></i>
		                            <span>결제관리</span>
		                        </a>
		                        <ul class="nav nav-children">
		                          
		                        <!--    
		                            <li>
		                                <a href="/payment/listSiteProfit">
		                                    사이트수익
		                                </a>
		                            </li>
		                        -->
		                             
		                            <li>
		                                <a href="/payment/listPayment">
		                                    결제내역
		                                </a>
		                            </li>
		                            <li>
		                                <a href="/payment/listPaymentCode">
		                                    결제코드관리
		                                </a>
		                            </li>
		                        </ul>
		                    </li>
                    
		                </ul>
		            </nav>
		         <!-- 메뉴 End -->


                <hr class="separator" />
                <hr class="separator" />
                <hr class="separator" />
                <hr class="separator" />
                <hr class="separator" />
                <hr class="separator" />


                <!-- 하단 Start -->
                <div class="sidebar-widget widget-stats">
                    <div class="widget-content">
                        <div><a href="https://goai.co.kr/">© 2022 AiA AIACADEMY</a></div>
                        <div>Team : 잘하고있어</div>
                        <div>주소: 서울특별시 종로구 종로 69 YMCA 7층</div>
                        <div>전화: 080 - 861 - 0909</div>


                    </div>
                </div>
                <!-- 하단 End -->

            </div>
        </div>
        <!-- 사이드 End -->

    </aside>