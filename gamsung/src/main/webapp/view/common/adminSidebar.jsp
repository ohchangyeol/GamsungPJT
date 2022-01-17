<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!-- admin Sidebar -->
<aside id="sidebar-left" class="sidebar-left">

	<!-- 상단 Start -->
    <div class="sidebar-header">
        <div class="sidebar-title">
            감성캠핑
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

		                    
                    <hr class="separator" />
                    
                     <li class="nav-parent">
                        <a>
                            <i class="fa fa-money" aria-hidden="true"></i>
                            <span>캠핑장관리</span>
                        </a>
                        <ul class="nav nav-children">
                        
                        
                        
                        
                        
                        <!-- 
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
		
   					<hr class="separator" />
                    
                    <li class="nav-parent">
                        <a>
                            <i class="fa fa-money" aria-hidden="true"></i>
                            <span>결제관리</span>
                        </a>
                        <ul class="nav nav-children">
                            <li>
                                <a href="/payment/listSiteProfit">
                                    사이트수익
                                </a>
                            </li>
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
                    
                </ul>
            </nav>
			<!-- 메뉴 End -->

            <hr class="separator" />
            <hr class="separator" />
            
			<!-- 하단 Start -->
            <div class="sidebar-widget widget-stats">          
                <div class="widget-content">                
                    <ul>
                        <li>
                            <span class="stats-title">Stat 1</span>
                            <span class="stats-complete">85%</span>
                            <div class="progress">
                                <div class="progress-bar progress-bar-primary progress-without-number"
                                    role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"
                                    style="width: 85%;">
                                    <span class="sr-only">85% Complete</span>
                                </div>
                            </div>
                        </li>
                        
                        <li>
                            <span class="stats-title">Stat 2</span>
                            <span class="stats-complete">70%</span>
                            <div class="progress">
                                <div class="progress-bar progress-bar-primary progress-without-number"
                                    role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
                                    style="width: 70%;">
                                    <span class="sr-only">70% Complete</span>
                                </div>
                            </div>
                        </li>
                        
                        <li>
                            <span class="stats-title">Stat 3</span>
                            <span class="stats-complete">2%</span>
                            <div class="progress">
                                <div class="progress-bar progress-bar-primary progress-without-number"
                                    role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"
                                    style="width: 2%;">
                                    <span class="sr-only">2% Complete</span>
                                </div>
                            </div>
                        </li>
                    </ul>                    
                </div>
            </div>
            <!-- 하단 End -->
            
        </div>
    </div>
	<!-- 사이드 End -->
	
</aside>