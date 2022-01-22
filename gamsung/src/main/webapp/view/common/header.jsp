<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

         <!-- 상단해더 Start -->
         <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
            <div class="container">

               <!-- 로고 Start -->
               <div class="navbar-header">
                  <button class="navbar-toggle" type="button" data-toggle="collapse"
                     data-target="#custom-collapse">
                     <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="/">Gamsung</a>
               </div>
               <!-- 로고 End -->


               <!-- 메뉴 Start -->
               <div class="collapse navbar-collapse" id="custom-collapse">
                  <ul class="nav navbar-nav navbar-right">

                     <!-- 중고경매 Start -->
                     <li class="dropdown"><a class="dropdown-toggle" href="" data-toggle="dropdown">중고상품</a>
                        <ul class="dropdown-menu">
                           <li><a id="addProduct">상품 등록</a></li>
                           <li><a id="adminProduct">경매 관리자 상품</a></li>
                           <li><a id="listWait">경매 진행 전 상품</a></li>
                           <li><a id="listProduct">경매 진행 중 상품</a></li>
                        </ul>
                     </li>
                     <!-- 중고경매 End -->


                     <!-- 커뮤니티 Start -->
                  <li class="">
                     <a id="commut" class="" data-toggle="">커뮤니티</a>
                     <!-- <ul class="dropdown-menu">
                        <li><a href="/community/listPost">커뮤니티</a></li>
                     </ul> -->
                  </li>
                  <!-- 커뮤니티 End -->

                  <!-- 양도양수 Start -->
                  <li class="dropdown"><a class="dropdown-toggle" href=""
                        data-toggle="dropdown">예약양도양수</a>
                     <ul class="dropdown-menu">
                        <li><a href="/transfer/listTransfer">예약양도 목록</a></li>
                        <li><a href="/transfer/addTransfer">예약양도 등록 </a></li>
                        <li><a href="/transfer/listMyTransfer">양도양수 현황 </a></li>
                     </ul>
                  </li>
                  <!-- 양도양수 End -->



                  <!-- 고객센터 Start -->
                  <li class="dropdown"><a class="dropdown-toggle" href="/servicecenter/home"
                        data-toggle="dropdown">고객센터</a>
                     <ul class="dropdown-menu">
                        <li><a href="/servicecenter/listNotice">공지사항</a></li>
                        <li><a href="/servicecenter/listQna"> Q&A </a></li>
                        <c:if test="${sessionScope.user.role!=null}">
                           <li><a href="/servicecenter/listReport?id=${user.id}">내   신고 내역</a></li>
                        </c:if>
                     </ul>
                  </li>
                  <!-- 고객센터 End -->



                  <!-- GENERAL / BUSINESS / Admin  Start -->
                  <c:if test="${sessionScope.user != null}">
                     <li class="dropdown">
                     
                     
                        <c:if test="${user.role=='ADMIN'}">
                           <a class="dropdown-toggle" href="/admin" data-toggle="dropdown">${user.nickName} 님</a>
                        </c:if>
                        
                        <c:if test="${user.role == 'BUSINESS'}">
                           <a class="dropdown-toggle" href="/campBusiness/goSubMainCampBusiness" data-toggle="dropdown">${user.campName} 님 [사업자]</a>
                        </c:if>
                        
                        <c:if test="${user.role == 'GENERAL'}">
                           <a class="dropdown-toggle" href="/user/mypage" data-toggle="dropdown">${user.nickName} 님</a>
                        </c:if>
                        
                        <ul class="dropdown-menu login-dropdown">
                           
                           <c:if test="${user.role != 'BUSINESS'}">
                              <li><p style="padding-bottom: 10px;">경매 등급 <span class="badge rounded-pill bg-info text-dark auction-lv">${user.auctionGrade}LV</span>   </p></li>
                           </c:if>
                           
                           <li><p>보유 포인트</p><p style="padding-bottom: 10px; border-bottom: 1px #ddd solid;">
                                 <span id="havingPoint" class="main-color" style="font-weight: 700;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${user.havingPoint}" /> </span>p</p></li>
                     
                           <c:if test="${user.role == 'ADMIN' }">
                              <li><a href="/admin">AdminPage</a></li>
                           </c:if>
                     
                           <c:if test="${user.role == 'BUSINESS'}">
                              <li><a href="/campBusiness/goSubMainCampBusiness">BusinessPage</a>
                           </c:if>   
                     
                           <c:if test="${user.role == 'GENERAL'}">
                              <li><a href="/user/mypage" style="border-bottom: none !important;"><i class="bi bi-person-circle"></i>&nbsp;내정보</a></li>
                              <li><a href="/community/listMyPost" style="border-bottom: none !important;"><i class="bi bi-filter-square"></i>&nbsp;커뮤니티</a></li>
                              <li><a href="" style="border-bottom: none !important;"><i class="bi bi-truck">&nbsp;</i>캠핑장</a></li>
                              <li><a id="auctionAdd" style="border-bottom: none !important;"><i class="fa fa-gavel" aria-hidden="true"></i>&nbsp;중고경매</a></li>
                              <!-- <li><a href="" style="border-bottom: none !important;"><i class="fa  fa-refresh" aria-hidden="true"></i>&nbsp;예약양도</a></li> -->
                              <li><a href="/payment/listPayment" style="border-bottom: none !important;"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;결제 내역</a></li>
                              <li><a href="/payment/managePoint" style="border-bottom: none !important;"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;포인트 관리</a></li>
                           </c:if>
                           
                           <li><a href="/user/logout"><button class="btn btn-border-w btn-round btn-xs" type="button"id="logout"style="border: none;padding: 5px 0 5px 0;width: 100%;font-size: 13px;text-align: left;color: #999; border-top:1px #ddd solid"><i class="bi bi-box-arrow-right" style="font-size: 20px;
                              "></i>&nbsp;로그아웃</button></a></li>

                           </ul>
                        </li>
                     </c:if>
                     <!-- My / Business / Admin  End -->


                     <!-- 로그인/로그아웃 Start -->
                     <li>
                        <c:if test="${sessionScope.user.role==null}">
                           <a class="modal-basic" href="#modalBasic" id="header-login"><button
                                 class="btn btn-border-w btn-round btn-xs main-login-btn"
                                 type="button">LOGIN</button></a>
                        </c:if>
                     </li>
                     <!-- 로그인/로그아웃 End -->


                  </ul>
               </div>
               <!-- 메뉴 End -->

            </div>
         </nav>
         <!-- 상단해더 End -->

         <!-- loginModal -->
         <jsp:include page="../user/loginModal.jsp" />

         <!-- findIdPwdModal -->
         <jsp:include page="/view/user/findIdPwdModal.jsp" />

         <script>
            $(function () {
               $("#commut").on("click", function(){
                  if (${empty sessionScope.user }){
                     Swal.fire({
                        text: '로그인 후 이용 가능합니다.',
                        icon: 'warning'
                     })
                     return;
                  } else{
                     window.location="/community/listPost"; 
                  }
               });

               $('#addProduct').on('click', function () {
                 if (${empty sessionScope.user }){
                   Swal.fire({
                      text: '로그인 후 이용 가능합니다.',
                      icon: 'warning'
                    })
                 return;
               } else if (${ sessionScope.user.role eq 'BUSINESS' }){
                 Swal.fire({
                    text: '사업자 회원은 이용 불가능합니다.',
                    icon: 'warning'
                  })
               return;
            } else if (${ sessionScope.user.auctionSuspension != null }) {

               Swal.fire({
                  text: '경매 이용 정지되었습니다. 관리자에게 문의하세요.',
                  icon: 'warning'
               })
               return;
            }
            window.location = '/auction/addAuctionProduct';
          });
   
            $('#adminProduct').on('click', function () {

               if (${ sessionScope.user.auctionSuspension != null }){
                 Swal.fire({
                    text: '경매 이용 정지되었습니다. 관리자에게 문의하세요.',
                    icon: 'warning'
                  })
               return;
            }
            window.location = "/auction/listAdminAuctionProduct";
          });
   
            $('#listWait').on('click', function () {

               if (${ sessionScope.user.auctionSuspension != null }){
                 Swal.fire({
                    text: '경매 이용 정지되었습니다. 관리자에게 문의하세요.',
                    icon: 'warning'
                  })
               return;
            }
            window.location = "/auction/listWaitAuctionProduct";
          });
   
            $('#listProduct').on('click', function () {

               if (${ sessionScope.user.auctionSuspension != null }){
                 Swal.fire({
                    text: '경매 이용 정지되었습니다. 관리자에게 문의하세요.',
                    icon: 'warning'
                  })
               return;
            }
            window.location = "/auction/listAuctionProduct";
   
          });
   
            $('#auctionAdd').on('click', function () {
               window.location = "/auction/listMyAuctionProduct/add?currentPage=1";
            });
        });
   
         //  $(function () {
         //     $('#havingPoint').text(comma($('#havingPoint').text()));
         //  });
   
         //  // 금액 "," 추가
         //  function comma(str) {
         //     str = String(str);
         //     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
         //  }
   
   
          </script>