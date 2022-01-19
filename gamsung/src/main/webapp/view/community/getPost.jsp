<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en-US" dir="ltr">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <title>COMMUNITY</title>

      <jsp:include page="../../resources/commonLib.jsp" />

      <meta name="msapplication-TileColor" content="#ffffff">
      <meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
      <meta name="theme-color" content="#ffffff">



      <style>
        .post-meta {
          display: flex;
          justify-content: space-between;
          font-size: 13px
        }

        .post-thumbnail img {
          width: 100%;
        }

        .community .main .module-small .container .row {
          position: relative;
        }

        .community .main .module-small .container .row .sidebar {
          position: sticky;
          top: 120px;
          left: 0;
          right: 0;
          bottom: 0;
        }

        .reply {
          background-color: white;
          border: 0;
          padding: opx;
          padding-left: inherit;
          padding-right: inherit;
          color: cornflowerblue;
          transform: translateY(2px);
        }


        .happy {
          background-color: white;
          border: 0;
          padding: opx;
          padding-left: inherit;
          padding-right: inherit;
          color: #ff1008;
          transform: translateY(3px);
        }


        .post-addition {
          border-top: 1px dotted #c2c2c2;
          padding-top: 5px;
          margin-top: 5px;
        }

        .comment-content {
          padding-top: 0px;
          margin-left: 0px;
          margin-bottom: 0px;
        }

        .comment-name {
          font: -webkit-mini-control;
          margin-bottom: 0px;
          border-top: 1px dotted #c2c2c2;
          padding-top: 5px;
          margin-top: 5px;
        }

        .comment-body {
          margin-bottom: 0px;
        }


        .comment-meta {
          font-size: xx-small;
          color: silver;
        }

        .comment-form {
          margin-top: 15px;
        }

        .comments {
          margin: 0 !important;
        }

        textarea.form-control {
          resize: none;
        }

        .format {
          display: none;
        }

        .post-entry {
          border-top: 0px;
          padding-top: 0px;
          margin-top: 0px;
        }

        .post-updatedelete {
          border-top: 1px dotted #c2c2c2;
          padding-top: 5px;
          margin-top: 0px;
          text-align: right;
        }
      </style>








    </head>


    <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60"
      style="overflow-y:initial !important; overflow-x: initial !important;" data-userid="${user.id}">

      <main class="community">

        <div class="page-loader">
          <div class="loader">Loading...</div>
        </div>

        <!-- header -->
        <jsp:include page="../common/header.jsp" />
        <!-- headerEnd -->


        <div class="main">
          <section class="module-small">
            <div class="container">
              <div class="row">

                <!-- sidebar Start -->
                <jsp:include page="leftCommunity.jsp" />
                <!-- sidebar End -->

                <!--Post Start-->
                <!-- 			<form name="commentForm" id="commentForm" role="form" > -->

                <div class="col-sm-8 col-sm-offset-1">


                  <div class="post" data-postno="${post.postNo}">

                    <div class="post-header">
                      <div class="post-meta">
                        <div>
                          <span>number </span>
                          <span style="color: #2d2d2d;">${post.postNo} </span>

                          <span>category </span>
                          <span style="color: #2d2d2d;">

                            <c:if test="${post.postType eq 1}">캠핑리포트</c:if>
                            <c:if test="${post.postType eq 2}">캠핑노하우</c:if>
                            <c:if test="${post.postType eq 3}">추억 한 컷</c:if>
                            <c:if test="${post.postType eq 4}">캠핑 기록</c:if>
                            <c:if test="${post.postType eq 5}">캠핑 지식인</c:if>
                          </span>

                        </div>


                        <div>
                          <span>writer </span>
                          <span style="color: #2d2d2d"> ${post.writer.id}</span>
                          <span>time </span>
                          <span style="color: #2d2d2d"> ${post.postRegdate}</span>
                        </div>
                      </div> <!-- post-meta end -->

                      <c:if test="${user.id == post.writer.id}">
                        <div class="post-updatedelete">
                          <a href='/community/updatePost?postNo=${post.postNo}' style="color: #2d2d2d">게시물 수정 /</a>
                          <a href='/community/deletePost?postNo=${post.postNo}' style="color: #2d2d2d">삭제</a>
                        </div>
                      </c:if>




                      <div class="post-entry">
                        <h3 class="post-title" style="text-align: inherit">${post.postTitle}</h3>
                      </div>
                    </div><!-- post-header end -->

                    <div class="post-thumbnail"><img src="/uploadfiles/community/img/${post.postImg1}" /></div>
                    <!-- src 해석필요함.. 절대경로 상대경로 공부가 필요함.. ㅠ_ㅠ.. 완벽한 이해가 되질않음..  -->

                    <div> ${post.postContent}</div>
                    <p class="help-block text-danger"></p>

                    <div class="hashtag">
                      <span
                        style="font-size: 16px;color: #2D2D2D;font-kerning: none;">#HashTag</span>&emsp;${post.hashtag1}&emsp;${post.hashtag2}&emsp;${post.hashtag3}
                    </div>
                    <p class="help-block text-danger"></p>

                    <div class="post-addition">

                      <span>좋아요</span>
                      <button type="button" class="happy">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                          class="bi bi-suit-heart" viewBox="0 0 16 16">
                          <path
                            d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                        </svg></button>
                      <span style="color: #2d2d2d;">${post.postConcernCount}&nbsp;</span>

                      <span>댓글</span>
                      <button type="button" class="reply" name="reply" id="${userId}" value="${post.postNo}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                          class="bi bi-chat-dots" viewBox="0 0 16 16">
                          <path
                            d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
                          <path
                            d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
                        </svg></button>&nbsp;

                      <span class="commentTotalCount${post.postNo}">총 댓글 수&nbsp;${post.commentTotalCount}</span>
                    </div>
                    <!-- post-meta end -->

                    <div class="comments post${post.postNo}">
                      <!--댓글 list 들어가는 부분-->
                    </div>
                    <!--Post End-->
                  </div>

                </div>
                <!--Comment End-->

              </div>
          </section>
        </div>


        <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Titan</h5>
                  <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                  <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                  <p>Email:<a href="#">somecompany@example.com</a></p>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-1.jpg"
                            alt="Post Thumbnail" /></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../../resources/images/rp-2.jpg"
                            alt="Post Thumbnail" /></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
                      class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i
                      class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
        </div>
        <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
      </main>

      <!-- <div class="format"> -->









      <div class="format">
        <div class="post" data-postno="${post.postNo}">

          <div class="post-header">
            <div class="post-meta">
              <div>
                <span>number </span>
                <span style="color: #2d2d2d;" class="post-number"></span>

                <span>category </span>
                <span style="color: #2d2d2d;" class="post-postType">

                </span>

              </div>


              <div>
                <span>writer </span>
                <span style="color: #2d2d2d" class="post-writer"></span>
                <span>time </span>
                <span style="color: #2d2d2d" class="post-regDate"></span>
              </div>
            </div> <!-- post-meta end -->




            <div class="post-entry">
              <h3 class="post-title" style="text-align: inherit"></h3>
            </div>
          </div><!-- post-header end -->

          <div class="post-thumbnail"></div>
          <!-- src 해석필요함.. 절대경로 상대경로 공부가 필요함.. ㅠ_ㅠ.. 완벽한 이해가 되질않음..  -->

          <div class="post-content"> ${post.postContent}</div>
          <p class="help-block text-danger"></p>

          <div class="hashtag">
            <span style="font-size: 16px;color: #2D2D2D;font-kerning: none;">#HashTag</span>

          </div>
          <p class="help-block text-danger"></p>

          <div class="post-addition">

            <span>좋아요</span>

            <button type="button" class="happy">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                class="bi bi-suit-heart" viewBox="0 0 16 16">
                <path
                  d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
              </svg></button>
            <span style="color: #2d2d2d;" class="post-concern">${post.postConcernCount}&nbsp;</span>

            <span>댓글</span>

            <button type="button" class="reply" name="reply" id="${user.id}" value="${post.postNo}">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-chat-dots"
                viewBox="0 0 16 16">
                <path
                  d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
                <path
                  d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
              </svg></button>&nbsp;

            <span class="post-comment-count">총 댓글 수&nbsp;${post.commentTotalCount}</span>
          </div>
          <!-- post-meta end -->

          <div class="comments">
            <!--댓글 list 들어가는 부분-->
          </div>
          <!--Post End-->
        </div>

        <div class="post-updatedelete">
          <a href='/community/updatePost?postNo=${post.postNo}' style="color: #2d2d2d" class="post-update-btn">게시물 수정
            /</a>
          <a href='/community/deletePost?postNo=${post.postNo}' style="color: #2d2d2d" class="post-delete-btn">삭제</a>
        </div>
      </div>


      <script src="../../resources//js/community.js"></script>

      <script>

        //   $(function () {
        //     var userId = $("body").data("userid");

        //     let isFlag = false;
        //     let ajaxToggle = false;
        //     const pageEl = $("#currentPage");


        //     $(window).scroll(function(){
        //       let currentPage = pageEl.val();

        //       if(window.innerHeight+ window.scrollY >= Math.floor( $(document).height()-($(document).height() / 10) ) && !isFlag && !ajaxToggle ){
        //         pageEl.val(++currentPage); 
        //         $.ajax({
        //           url : "/community/rest/listPost" ,
        //           method : "GET" ,
        //           data:$("#community-search-form").serialize(),
        //           dataType : "json" ,
        //           success : function(JSONData , status) {
        //             console.log(JSONData);

        //             const list = JSONData.list;

        //             if(list.length == 0){
        //               isFlag = true;
        //             }

        //             console.log(list);

        //             list.forEach( (el, index) => {

        //               const imgUrl = "/uploadfiles/community/img/";
        //               // ui
        //               const appendElement = $("div.col-sm-8.col-sm-offset-1");

        //               const postList = $(".format .post").clone();
        //               const u_d_box = $(".post-updatedelete").clone();
        //               const postHeader = postList.find(".post-header"); // append

        //               const postNo = postList.find(".post-number");
        //               const postType = postList.find(".post-postType");
        //               const postWriter = postList.find(".post-writer");
        //               const postRegDate = postList.find(".post-regDate");
        //               const postTitle = postList.find(".post-title");
        //               // const postTitle = postList.find(".post-title");
        //               const postImgBox = postList.find(".post-thumbnail");
        //               const postContent = postList.find(".post-content");
        //               const postHashtag = postList.find(".hashtag");
        //               const postConcern = postList.find(".post-concern");
        //               const postrReply  = postList.find(".reply"); // val(postNo)
        //               const postrComment  = postList.find(".post-comment-count").addClass("commentTotalCount"+el.postNo);
        //               const commentsBox = postList.find(".comments"); // class add ;

        //               postList.attr("data-postno",el.postNo);

        //               postNo.text(el.postNo);
        //               if(postType == 1){
        //                 postType.text("캠핑리포트");
        //               }else if (postType == 2){
        //                 postType.text("캠핑노하우");
        //               }else if(postType == 3){
        //                 postType.text("추억 한 컷");
        //               }else if(postType == 4){
        //                 postType.text("캠핑 기록");
        //               }else{
        //                 postType.text("캠핑 지식인");
        //               }
        //               postWriter.text(el.writer.id);
        //               postRegDate.text(el.postRegdate);


        //               postTitle.text(el.postTitle);

        //               if(el.postImg1 != null){
        //                 postImgBox.append("<img src="+imgUrl+el.postImg1+">");
        //               }
        //               if(el.postImg2 != null){
        //                 postImgBox.append("<img src="+imgUrl+el.postImg2+">");
        //               }
        //               if(el.postImg3 != null){
        //                 postImgBox.append("<img src="+imgUrl+el.postImg3+">");
        //               }

        //               postContent.text(el.postContent);

        //               // postHashtag

        //               postConcern.text(el.postConcernCount);
        //               postrReply.val(el.postNo);

        //               const className = "post"+el.postNo;
        //               postrComment.text("총 댓글 수 "+el.commentTotalCount);

        //               // console.log(commentsBox);

        //               commentsBox.addClass(className);

        //               appendElement.append(postList);
        //             })









        //           }
        //         }).done(function () {
        //           ajaxToggle = false;
        //         });
        //       }
        //     })

        // });

        $(function () {
          $("button:button[name='reply']").on("click", listComment);

          function listComment(paramiter) {


            console.log("paramiter은 object인가?" + paramiter);



            var parent = $(paramiter.currentTarget).closest("div[data-postno]");
            var postNo = parent.data("postno");
            console.log("if in ::", postNo);


            console.log("들어온 post nunber :: ", postNo);



            var userId = $("body").data("userid");


            var params = { "postNo": postNo };
            var listHtml = "";


            if ("${userId}" == "" || "${userId}" == null) {
              console.log("ㅠㅠ")
              listHtml += " <div> ";
              listHtml += " 세션이 만료되었습니다. 재로그인해주세요";
              listHtml += " <div> ";
              $(".post" + postNo).html(listHtml);

            } else {

              $.ajax({
                type: "post",
                url: "/community/rest/listComment",
                data: params,


                success: function (list) {

                  console.log("list \n", list);

                  for (const i in list) {



                    let postNoo = list[i].postNo.postNo;
                    let commentNo = list[i].commentNo;
                    let commentContent = list[i].commentContent;
                    let commentWriter = list[i].commentWriter.id;
                    let commentRegdate = list[i].commentRegdate;
                    let deleteFlag = list[i].deleteFlag;

                    console.log(postNoo, commentNo, commentContent, commentWriter, commentRegdate, deleteFlag);

                    if (!commentNo) {

                      listHtml += " <div> ";
                      listHtml += " 등록된 댓글이 없습니다";
                      listHtml += " <div> ";

                    } else {

                      if (deleteFlag != 'N') {


                        listHtml += " <div> ";
                        listHtml += " 삭제된 댓글입니다";
                        listHtml += " <div> ";

                      } else {

                        listHtml += "<div class='comment clearfix'>";
                        listHtml += "<div class='comment-content clearfix'>";
                        listHtml += "<div class='comment-name'>" + commentWriter + "</div>";
                        listHtml += "<div class='comment-body+" + commentNo + "'>";
                        listHtml += "<p style='margin-bottom:0px; padding-top: 5px;'>" + commentContent + "</p>";
                        listHtml += "</div>";
                        listHtml += "<div class='comment-meta'>" + commentRegdate + "";

                        if ("${userId}" == commentWriter) {

                          listHtml += "<a href='#' class='delete-comment' id='" + commentNo + "' >&nbsp;댓글삭제</a>";

                        }

                        listHtml += "</div>";
                        listHtml += "</div>";
                        listHtml += "</div>";
                        listHtml += "<div class='updatecomment" + commentNo + "'></div>";

                      };


                    };
                  };

                  listHtml += "<div class='comment-form'>";
                  listHtml += "<div class='form-group'>";
                  listHtml += "<textarea class='form-control' style='border-style: dashed' id='comment' value='' name='comment' data-postno='" + postNo + "' data-userid='" + userId + "' rows='4'placeholder='댓글을 등록해주세요'>";
                  listHtml += "</textarea>";
                  listHtml += "</div>";
                  listHtml += "<p class='help-block text-danger'></p>";
                  listHtml += "<button class='btn btn-round btn-d add-comment' type='submit'>댓글 등록</button>";
                  listHtml += "</div>";



                  $(".post" + postNo).html(listHtml);

                  $('.add-comment').on('click', addClickComment);


                  $('.delete-comment').on('click', deleteClickComment);
                  $('.update-comment').on('click', updateClickComment);



                }

              });
            }

          };

          function addClickComment(e) {

            var el = $(this).closest(".comment-form").find("textarea");




            var postno = el.data("postno");
            var userid = el.data("userid");
            var val = el.val();

            val = val.trim();
            if (val == "") {
              alert("글을 입력하세요");
            } else {

              $(this).closest(".comment-form").find("textarea").val("");

              addComment(postno, userid, val);

              function addComment(postno, userid, val) {

                console.log("1::" + postno, typeof postno);
                console.log("2::" + userid);
                console.log("2::" + val);

                $.ajax({
                  type: "post",
                  url: "/community/rest/addComment",
                  data: {

                    postno: postno,
                    userid: userid,
                    val: val

                  },

                  success: function (post) {

                    console.log("get::::" + post);

                    let commentTotalCount = post.commentTotalCount;
                    let postNo = post.postNo;
                    let commentText = "총 댓글 수 " + commentTotalCount;

                    $('.commentTotalCount' + postNo).text(commentText);



                    listComment(e); // 

                  },
                  error: function () {
                    console.log("error::::");
                  }
                });
              }
            }

          };

          function updateClickComment(e) {

            e.preventDefault();

            var commentno = $(this).attr('id');

            listComment(commentno)


          }

          function deleteClickComment(e) {

            e.preventDefault();
            var commentno = $(this).attr('id');

            console.log("id::" + commentno);

            $.ajax({
              type: "get",
              url: "/community/rest/deleteComment",
              data: {

                commentno: commentno,

              },

              success: function (post) {


                listComment(e);
                let commentTotalCount = post.commentTotalCount;
                let postNo = post.postNo;
                let commentText = "총 댓글 수 " + commentTotalCount;


                $('.commentTotalCount' + postNo).html(commentText);

              },
              error: function () {

                console.log("deleteComment error::::");

              }

            });


          } //deleteClickComment END 



        }); //function END





      </script>

    </body>

    </html>