<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

         <!DOCTYPE html>
         <html>

         <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <!-- Document Title -->
            <title>내가 쓴 댓글</title>


            <jsp:include page="/resources/commonLib.jsp"></jsp:include>
	
            <jsp:include page="/resources/commonCssMypage.jsp" />


            <style>
               .panel-body.table-responsive.table.table-hover.mb-none.tr {
                  color: #2d2d2d;
               }
            </style>

         </head>

         <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60"
            data-userid="${user.id}">

            <section class="body">
               <div class="inner-wrapper">
               <jsp:include page="../common/userSideBar.jsp"></jsp:include>
                  <section role="main" class="content-body mypage-body">
                     
                     <!-- start: page -->
                        <div class="row">
                           <div class="col-md-12">
                              <section class="panel">
                                 <div class="panel-body">
                                    <div class="mypage-search-container">
                                       <div style="font-weight: 500; font-size:28px; margin-bottom: 30px;">내가 쓴 댓글</div>
                                       <div class="mypage-search-box">
                                          <form role="form" class="post-search" method="post" style="display: flex;gap: 5px;">
                                             
                                            <input type="hidden" id="currentPage" name="currentPage" value="0" />
                                         </form>
                                       </div>
                                    </div>
                                    <div class="table-responsive">
                                       <table class="table table-hover mb-none listMyPost">
                                          <thead>
                                             <tr>
                                                <th style="text-align: center;">게시글번호</th>
                                                <th style="text-align: center;">카테고리</th>
                                                <th style="text-align: center;">게시글제목</th>
                                                <th style="text-align: center;">내 댓글내용</th>                                                   
                                                <th style="text-align: center;">등록날짜</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:forEach var="post" items="${list}">
                                                <tr class="post"   style="cursor: pointer; text-align: center; color: #0c0c4f">

                                                   <!--게시물번호-->
                                                   <td class="postNo" id="${post.postNo}">${post.postNo} </td>

                                                   <!-- 카테고리 -->
                                                   <td >
                                                      <span style="color: rgb(20, 35, 55);">
                                                         <c:if  test="${post.postType == 1}"> 캠핑 리포트 </c:if>
                                                         <c:if  test="${post.postType == 2}"> 캠핑 노하우 </c:if>
                                                         <c:if  test="${post.postType == 3}"> 추억 한 컷 </c:if>
                                                         <c:if  test="${post.postType == 4}"> 캠핑 기록 </c:if>
                                                         <c:if  test="${post.postType == 5}"> 캠핑 지식인 </c:if>
                                                      </span>
                                                   </td>
                                                   
                                                   <!--게시물제목-->
                                                   <td  id="postTitle">
                                                      ${post.postTitle}</td>
                                                      
                                                   <!--내 댓글 내용-->
                                                   <td  id="commentcontent">
                                                      ${post.commentContent}</td>
                                                   
                                                   <!-- 등록일자 -->
                                                   <td  name="postRegdate">
                                                      ${post.postRegdate}</td>

                                                   
                                                </tr>
                                             </c:forEach>
                                             
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </section>
                              <div class="row">
                                   <jsp:include page="../common/pageNavigator.jsp"/>
                                </div>
                           </div>
                        </div>
                     <!-- end: page -->
                  </section>
               </div>
            
            </section>

            <jsp:include page="/resources/commonScriptMypage.jsp" />
            <!-- Examples -->
            <script src="../../resources/js/examples.lightbox.js"></script>

            <script type="text/javascript">
            
            $(document).ready(function(){
			   	    
            	
 			    $(".listMyPost tbody tr").on("click" , (e)=>{
 			        const postNo = $(e.currentTarget).find(".postNo").attr('id');
 			        console.log(postNo);
 			        self.location ="/community/getPost?postNo="+postNo;
 			    });
 			    
 			    
 			    fncGetList = (currentPage)=>{
 			    $("#currentPage").val(currentPage);
 			    $(".post-search").attr("method", "post").submit();
 			    };
 			    
 			});
 			
       
            </script>

         </body>

         </html>