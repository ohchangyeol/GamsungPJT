<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/resources/commonCssMypage.jsp"/>


<style type="text/css">
	.sidebar-left {
		background-color: #171717 !important;
	}
	
	aside {
		margin-top: -55px;
	}
</style>

<!-- sidebar Start -->
<aside id="sidebar-left" class="sidebar-left">

	<div class="sidebar-header">
		<div class="sidebar-title" aria-hidden="true">마이페이지</div>
		<div class="sidebar-toggle hidden-xs"
			data-toggle-class="sidebar-left-collapsed" data-target="html"
			data-fire-event="sidebar-left-toggle">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>
	
	<div class="nano">
		<div class="nano-content">
			<nav id="menu" class="nav-main" role="navigation">
				
				<hr class="separator" />
				
				<!-- 메뉴 Start -->
				<ul class="nav nav-main">
				
					<li class="nav-parent">
						<a> 
							<i class="fa fa-user"varia-hidden="true"></i> 
							<span>내 정보</span>
						</a>
						<ul class="nav nav-children">
							<li>
								<a href="/view/common/myPage.jsp">
									내정보 조회/수정
								</a>
							</li>
							<li id="Secession">
								<a href="#" data-toggle="modal" data-target="#addSecessionModal">
									회원탈퇴
								</a>
							</li>
						</ul>
					</li>
					
					<hr class="separator" />
					
					<li class="nav-parent">
						<a> 
							<i class="fa fa-camera"	aria-hidden="true"></i>
							<span>캠핑</span>
						</a>
						<ul class="nav nav-children">
							<li><a id="my_reservation" style="cursor: pointer;"> 예약 내역</a></li>
							<li><a id="my_camp_qna" style="cursor: pointer;"> 등록한 Q&A </a></li>
							<li><a id="my_camp_review" style="cursor: pointer;"> 등록한 리뷰 </a></li>
						</ul>
					</li>
					
					<hr class="separator" />
					
					<li class="nav-parent">
						<a> 
							<i class="fa fa-gavel" aria-hidden="true"></i> 
							<span>중고경매</span>
						</a>						
						<ul class="nav nav-children">
							<li><a id="auctionAdd"> 내가 등록한 상품 </a></li>
							<li><a id="auctionHistory"> 경매 내역 </a></li>
							<li><a id="auctionBid"> 응찰 관심 내역 </a></li>
							<li><a id="auctionReview"> 리뷰 </a></li>
						</ul>
					</li>
					
					<hr class="separator" />
					
					<li class="nav-parent">
						<a>
							<i class="fa fa-quote-left"	aria-hidden="true"></i> 
							<span>커뮤니티</span>
						</a>
						<ul class="nav nav-children">
							<li><a href="forms-basic.html"> 샬라샬라 </a></li>
							<li><a href="forms-advanced.html"> 샬라샬라 </a></li>
						</ul>
					</li>
					
					<hr class="separator" />
					
					<li class="nav-parent">
						<a>
							<i class="fa  fa-refresh" aria-hidden="true"></i>
							<span>예약양도</span>
						</a>
						<ul class="nav nav-children">
							<li><a href="/transfer/listMyTransfer"> 나의 예약 양도내역 </a></li>
							<li><a href="/transfer/managePoint"> 나의 예약 양수내역 </a></li>
						</ul>
					</li>
					
					
					<hr class="separator" />
					
					<li class="nav-parent">
						<a> 
							<i class="fa fa-money" aria-hidden="true"></i> 
							<span>결제</span>
						</a>
						<ul class="nav nav-children">
							<li><a href="/payment/managePoint"> 포인트 충전/출금 </a></li>
							<li><a href="/payment/listPayment"> 내 결제/포인트 내역 </a></li>
						</ul>
					</li>
					
					<hr class="separator" />
					<hr class="separator" />
					
					<li>
						<a href="/user/logout" target="_blank">
							<i class="fa fa-sign-out" aria-hidden="true"></i>
							<span>로그아웃</span>
						</a>
					</li>
					
					<hr class="separator" />
					<hr class="separator" />
					<hr class="separator" />
					<hr class="separator" />
					<hr class="separator" />
					
					<li>
						<span class="text-center">회원틸퇴</span>
					</li>					
					
				</ul>
				<!-- 메뉴 End -->

			</nav>
		</div>
	</div>
	
</aside>
<!-- sidebar End -->

<jsp:include page="/resources/commonScriptMypage.jsp"/>

	<script>
		$(function(){

			$('#my_reservation').on('click',function(){
			window.location = "/campGeneral/listMyReservation";
			});

			$('#my_camp_review').on('click',function(){
			window.location = "/campGeneral/listMyCampRatingReview";
			});

			$('#auctionAdd').on('click',function(){
			window.location = "/auction/listMyAuctionProduct/add?currentPage=1";
			});
				
			$('#auctionHistory').on('click',function(){
				window.location = "/auction/listMyAuctionProduct/history?currentPage=1";
			});
			
			$('#auctionBid').on('click',function(){
				window.location = "/auction/listMyAuctionProduct/bid?currentPage=1";
			});
				
			$('#auctionReview').on('click',function(){
				window.location = "/auction/listMyAuctionProduct/review?currentPage=1";
			});
		});
	</script>