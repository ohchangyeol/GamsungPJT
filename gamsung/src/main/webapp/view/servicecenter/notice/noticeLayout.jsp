<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    <title>공지사항</title>
    
    <jsp:include page="/resources/commonLib.jsp"/>

    <link id="color-scheme" href="../../../resources/css/serviceCenter.css" rel="stylesheet">
  </head>


  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      
      
      <!-- header -->
      <jsp:include page="../../common/header.jsp"/>
      <!-- header End -->

      <div class="main sc-main">
        <section class="module bg-dark-30 about-page-header" data-background="../../../resources/images/notice.jpg" style="padding: 200px;">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <!-- <h1 class="module-title font-alt mb-0">공지사항입니다</h1> -->
              </div>
            </div>
          </div>
        </section>
        <section class="module" style="padding-top: 50px;">
          <div class="container">

            <c:if test="${!empty noticeType}">
            
              <c:if test='${noticeType == "list"}'>
                <jsp:include page="../notice/listNotice.jsp"/>
              </c:if>
              <c:if test='${noticeType == "get"}'>
                <jsp:include page="../notice/getNotice.jsp"/>
              </c:if>
              
            </c:if>

            
            

          </div>
        </section>
        <jsp:include page="../../common/footer.jsp"/>
        
        
    </main>
    
    <script src="../../../resources/js/servicecenter/notice.js"></script>
  </body>
</html>