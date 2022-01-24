<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!DOCTYPE html>
      <html lang="en-US" dir="ltr">

      <head>
         <meta charset="utf-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1">
         <!--  
    Document Title
    =============================================
    -->
         <title>감성캠핑 양도목록</title>

         <jsp:include page="/resources/commonLib.jsp" />

         <style>
            .mb-0 {
               color: #333064;
               font-weight: 400;
               font-size: 14px;
               color: #333064;
            }


            * {
               font-family:
                  'Noto Sans KR', sans-serif;
            }

            .table>tbody>tr>td,
            .table>tbody>tr>th,
            .table>tfoot>tr>td,
            .table>tfoot>tr>th,
            .table>thead>tr>td,
            .table>thead>tr>th {
               padding: 18px;
            }




            .layertwo {
               display: none;
            }

            .search-btn {
               position: absolute;
               background: transparent;
               border: none;
               overflow: hidden;
               top: 50%;
               right: 1px;
               width: 23px;
               height: 40px;
               line-height: 38px;
               font-size: 14px;
               outline: none;
               color: #999;
               margin-top: -20px;
            }
         </style>

         <!-- <link id="color-scheme" href="../../../resources/css/serviceCenter.css" rel="stylesheet"> -->
      </head>

      <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" class="myReport">
         <main>
            <!--             <div class="page-loader"> -->
            <!--                <div class="loader">Loading...</div> -->
            <!--             </div> -->

            <!-- header -->
            <jsp:include page="../common/header.jsp" />
            <!-- header End -->

            <div class="main sc-main">
               <section class="module bg-dark-30 about-page-header"
                  data-background="../../uploadfiles/transfer/list.jpg" style="padding-top: 370px;
    padding-bottom: 390px;">
                  <div class="container">
                     <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                           <h1 class="module-title font-alt mb-0"></h1>
                        </div>
                     </div>
                  </div>
               </section>
               <section class="module" style="padding:20px">
                  <div class="container">

                     <section class="panel">
                        <header class="panel-heading">
                           <div class="row">
                              <h4 class="col-sm-7 mb-0"></h4>
                              <div class="col-sm-5 mb-sm-0">
                                 <div class="row">
                                    <form role="form" class="transfer-search" method="post">
                                       <div class="col-sm-4">

                                          <select id="searchCondition" class="form-control" name="searchCondition">
                                             <option value="0" ${ ! empty search.searchCondition &&
                                                search.searchCondition==0 ? "selected" : "" }>금액별</option>
                                             <option value="1" ${ ! empty search.searchCondition &&
                                                search.searchCondition==1 ? "selected" : "" }>기간검색</option>
                                          </select>
                                       </div>


                                       <div class="col-sm-8">





                                          <div class="search-box layer">
                                             <select class='form-control' style="width: 280px;" name='searchKeyword'
                                                id='campNo' style='width: 499px'>
                                                <option selected='selected'>검색하실 금액대를 선택해주세요.</option>
                                                <option value="1">무료양도</option>
                                                <option value="1">1만원~9만원</option>
                                                <option value="2">10만원~19만원</option>
                                                <option value="3">20만원~29만원</option>
                                                <option value="4">30만원~39만원</option>
                                                <option value="5">40만원이상</option>
                                             </select>
                                          </div>





                                          <div class="search-box layertwo">
                                             <div style=" display: flex; ">
                                                <input class="form-control" type="text" placeholder="YYYYMMDD(입실)"
                                                   name="searchKeyword" value="${search.searchKeyword}">
                                                <div>&nbsp;~&nbsp;</div>
                                                <input class="form-control" type="text" placeholder="YYYYMMDD(퇴실)"
                                                   name="searchKeyword" value="${search.searchKeyword}">
                                                <button class="search-btn" type="submit"><i
                                                      class="fa fa-search"></i></button>
                                             </div>
                                          </div>




                                       </div>


                                       <input type="hidden" id="currentPage" name="currentPage"
                                          value="${resultPage.currentPage}" />

                                    </form>
                                 </div>
                              </div>

                           </div>
                        </header>

                        <div class="panel-body transferlist">
                           <div class="table-responsive">
                              <table class="table table-hover mb-none">
                                 <thead>
                                    <tr>



                                       <th class="col-md-1" style="text-align: center;">양도번호</th>

                                       <th style="text-align: center;">[주소]양도캠핑장(숙소)</th>
                                       <th style="text-align: center;">제목</th>
                                       <th class="col-md-1" style="text-align: center;">양도금액</th>
                                       <th style="text-align: center;">이용일자(입/퇴실)</th>

                                       <th style="text-align: center;">양도자</th>

                                    </tr>
                                 </thead>

                                 <tbody>

                                    <c:set var="i" value="0" />
                                    <c:forEach var="transfer" items="${list}">
                                       <c:set var="i" value="${ i+1 }" />

                                       <tr class="transfer" style="cursor: pointer; text-align: center;">

                                          <!--no-->

                                          <td class="center transferno" id="${transfer.transferNo}">
                                             ${transfer.transferNo}</td>

                                          <!--양도캠핑장(숙소)-->
                                          <td class="" id="campName">
                                             [<span>${transfer.transferArea}</span>]${transfer.transferCampname}
                                          </td>

                                          <!--제목-->
                                          <td class="">${transfer.transferTitle}</td>

                                          <!--양도금액-->
                                          <td class="" id="date">${transfer.transferPrice}</td>

                                          <!--이용일자(입/퇴실)-->
                                          <td class="" name="price">${transfer.transferStartDate}
                                             ㅡ
                                             ${transfer.transferEndDate}</td>

                                          <!-- 양도자닉네임 -->
                                          <td class=""><span
                                                style="color: rgb(20, 35, 55);">${transfer.transferOr.nickName}</span>
                                          </td>


                                       </tr>



                                    </c:forEach>
                                 </tbody>
                              </table>
                           </div>

                           <jsp:include page="../common/pageNavigator.jsp" />

                        </div>
                     </section>




                  </div>
               </section>

               <jsp:include page="../common/footer.jsp" />

         </main>

         <!-- <script src="../../../resources/js/servicecenter/report.js"></script> -->

         <script>

            $(document).ready(function () {

               /*$("#report-condition").on("change" , ()=>{
                    // console.log("변경");
                    $(".rerport-search").attr("method", "post").submit();
                }) */

               $(".transferlist tbody tr").on("click", (e) => {
                  const transferNo = $(e.currentTarget).find(".transferno").attr('id');
                  console.log(transferNo);
                  self.location = "/transfer/getTransfer?transferNo=" + transferNo;
               });


               fncGetList = (currentPage) => {
                  $("#currentPage").val(currentPage);
                  $(".transfer-search").attr("method", "post").submit();
               };




               jQuery('#searchCondition').change(function () {//$는 jQuery로도 사용 가능하다.       
                  var state = jQuery('#searchCondition option:selected').val();

                  console.log(state);

                  //현재 금액별 검색입력창이 있다. 
                  //숨겨져있는건 기간별 검색입력창             
                  //기간별을 선택하면 기간별 검색입력창이 떠야한다. 

                  if (state == '1') {
                     jQuery('.layer').hide();
                     jQuery('.layertwo').show();
                  } else {
                     jQuery('.layertwo').hide();
                     jQuery('.layer').show();

                  }

               });



            });





         </script>

      </body>

      </html>