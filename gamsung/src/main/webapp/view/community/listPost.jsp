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
          transform: translateY(-1px);
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

        .tags a {
          background: #b3c2d170;
          display: inline-block;
          font-size: 12px;
          color: #666;
          padding: 4px 13px 4px 12px;
          margin: 0 1px 4px;
          border-radius: 2px;

        }

        .widget {
          color: #666;
        }

        .tooltip-arrow,
        .red-tooltip+.tooltip>.tooltip-inner {
          background-color: #b3c2d1;
        }

        .red-tooltip+.tooltip.top>.tooltip-arrow {
          background-color: #b3c2d1;
        }


        .tooltip-arrow,
        .red-tooltip+.tooltip>.tooltip-inner {

          background-color: #1110;
        }

        .tooltip-arrow {

          background-color: #1110;
        }

        .tooltip-inner {

          color: #666666;
          background-color: #1110;
        }

        .tooltip.right .tooltip-arrow {
          border-right-color: #1110;
        }

        a {
          color: #666;
        }

        .widget .widget-title {
          color: #666;
          letter-spacing: 3px;
        }



        .form-control {
          color: #666;
        }
      </style>








    </head>


    <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60"
      style="overflow-y:initial !important; overflow-x: initial !important;" data-userid="${user.id}">

      <main class="community">

        <!-- <div class="page-loader">
          <div class="loader">Loading...</div>
        </div> -->

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

                  <c:forEach var="post" items="${list}">
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
                        <button type="button" class="happy" data-concerntype="insert">
                          <!-- <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-suit-heart" viewBox="0 0 16 16">
                            <path
                              d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                          </svg> -->
                          <i class="fa fa-fw"></i>
                        </button>
                        <span style="color: #2d2d2d;" class="post-concern">${post.postConcernCount}&nbsp;</span>

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
                  </c:forEach>
                </div>
                <!--Comment End-->

              </div>
          </section>
        </div>


        
        <jsp:include page="../common/footer.jsp" />

        
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
            <!-- <<<<<<< HEAD
            <button type="button" class="happy" data-concerntype="insert">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                class="bi bi-suit-heart" viewBox="0 0 16 16">
                <path
                  d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
              </svg></button>
            <span style="color: #2d2d2d;" class="post-concern">${post.postConcernCount}&nbsp;</span>
======= -->
            <button type="button" class="happy" data-concerntype="insert">
              <i class="fa fa-fw"></i>
            </button>
            <span style="color: #2d2d2d;" class="post-concern">${post.postConcernCount}&nbsp;</span>
            <!-- >>>>>>> refs/remotes/origin/developer -->

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

        // 좋아요 버튼
        $(function () {



          $(document).on("click", ".happy", function (e) {
            const postNo = $(e.currentTarget).closest(".post").data("postno");
            const concernType = $(e.currentTarget).data("concerntype");
            const target = $(e.currentTarget);

            console.log(postNo);
            console.log(concernType);

            $.ajax({
              url: "/community/rest/concern/" + postNo + "/" + concernType,
              type: "GET",
              dataType: "json",
              // data: {
              //   "postNo" : postNo ,
              //   "concernType":concernType},
              success: function (data) {
                console.log(data);
                console.log(e.currentTarget);
                console.log(target);
                const concernCount = target.next();
                if (concernType == "insert") {
                  target.data("concerntype", "delete");
                  target.html("");
                  target.append("<i class='fa fa-fw'></i>");
                  concernCount.text(data);
                } else {
                  target.data("concerntype", "insert");
                  target.html("");
                  target.append("<i class='fa fa-fw'></i>");
                  concernCount.text(data);
                }
              },
              error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
              }
            });

          }); // end of Event

        }); // end of 좋아요


        //  무한 스크롤...
        $(function () {
          var userId = $("body").data("userid");

          let isFlag = false;
          let ajaxToggle = false;
          const pageEl = $("#currentPage");


          $(window).scroll(function () {
            let currentPage = pageEl.val();

            if (window.innerHeight + window.scrollY >= Math.floor($(document).height() - ($(document).height() / 10)) && !isFlag && !ajaxToggle) {
              pageEl.val(++currentPage);
              $.ajax({
                url: "/community/rest/listPost",
                method: "GET",
                data: $("#community-search-form").serialize(),
                dataType: "json",
                success: function (JSONData, status) {
                  console.log(JSONData);

                  const list = JSONData.list;

                  if (list.length == 0) {
                    isFlag = true;
                  }
                  // const imgUrl = "/uploadfiles/community/img/";
                  // // ui
                  // const appendElement = $("div.col-sm-8.col-sm-offset-1");

                  // const postList = $(".format .post").clone();
                  // const u_d_box = $(".post-updatedelete").clone();
                  // const postHeader = postList.find(".post-header"); // append

                  // const postNo = postList.find(".post-number");
                  // const postType = postList.find(".post-postType");
                  // const postWriter = postList.find(".post-writer");
                  // const postRegDate = postList.find(".post-regDate");
                  // const postTitle = postList.find(".post-title");
                  // const postTitle = postList.find(".post-title");
                  // const postImgBox = postList.find(".post-thumbnail");
                  // const postContent = postList.find(".post-content");
                  // const postHashtag = postList.find(".hashtag");
                  // const postConcern = postList.find(".post-concern");
                  // const postrReply  = postList.find(".reply"); // val(postNo)
                  // const postrComment  = postList.find(".post-comment-count");
                  // const commentsBox = postList.find(".comments "); // class add ;
                  console.log(list);

                  list.forEach((el, index) => {

                    const imgUrl = "/uploadfiles/community/img/";
                    // ui
                    const appendElement = $("div.col-sm-8.col-sm-offset-1");

                    const postList = $(".format .post").clone();
                    const u_d_box = $(".post-updatedelete").clone();
                    const postHeader = postList.find(".post-header"); // append

                    const postNo = postList.find(".post-number");
                    const postType = postList.find(".post-postType");
                    const postWriter = postList.find(".post-writer");
                    const postRegDate = postList.find(".post-regDate");
                    const postTitle = postList.find(".post-title");
                    // const postTitle = postList.find(".post-title");
                    const postImgBox = postList.find(".post-thumbnail");
                    const postContent = postList.find(".post-content");
                    const postHashtag = postList.find(".hashtag");
                    const postConcern = postList.find(".post-concern");
                    const postrReply = postList.find(".reply"); // val(postNo)
                    const postrComment = postList.find(".post-comment-count").addClass("commentTotalCount" + el.postNo);
                    const commentsBox = postList.find(".comments"); // class add ;

                    postList.attr("data-postno", el.postNo);

                    postNo.text(el.postNo);
                    if (postType == 1) {
                      postType.text("캠핑리포트");
                    } else if (postType == 2) {
                      postType.text("캠핑노하우");
                    } else if (postType == 3) {
                      postType.text("추억 한 컷");
                    } else if (postType == 4) {
                      postType.text("캠핑 기록");
                    } else {
                      postType.text("캠핑 지식인");
                    }
                    postWriter.text(el.writer.id);
                    postRegDate.text(el.postRegdate);


                    postTitle.text(el.postTitle);

                    if (el.postImg1 != null) {
                      postImgBox.append("<img src=" + imgUrl + el.postImg1 + ">");
                    }
                    if (el.postImg2 != null) {
                      postImgBox.append("<img src=" + imgUrl + el.postImg2 + ">");
                    }
                    if (el.postImg3 != null) {
                      postImgBox.append("<img src=" + imgUrl + el.postImg3 + ">");
                    }

                    postContent.text(el.postContent);

                    // postHashtag

                    postConcern.text(el.postConcernCount);
                    postrReply.val(el.postNo);

                    const className = "post" + el.postNo;
                    postrComment.text("총 댓글 수 " + el.commentTotalCount);

                    // console.log(commentsBox);

                    commentsBox.addClass(className);

                    appendElement.append(postList);
                  })









                  // console.log(li);
                  // console.log(answer);
                  // qnas.forEach( (qna, index) => {
                  // // for(let index = 0 ; index < qnas.length ; index++ ){
                  //   const layoutLeft = $(".qna-left");
                  //   const layoutRight = $(".qna-right");
                  //   let li = $(".format #accordion").clone();
                  //   let answer = $(".format .answer").clone();
                  //   // const qna = qnas[index];
                  //   console.log(index);
                  //   const title = li.find("a.collapsed");// 제목
                  //   const collapse = li.find("div.collapse");
                  //   const content = li.find("div.question"); // 내용
                  //   const answerContent = answer.find("span"); // 답변 내용

                  //   title.attr("href" , "#support"+qna.qnaNo).text(qna.questionTitle);
                  //   collapse.attr("id" , "support"+qna.qnaNo);
                  //   content.text(qna.questionContent);

                  //   console.log(qna.answerContent);
                  //   if(qna.answerContent != null){
                  //     title.append("<div class='check'>확인</div>");
                  //     answerContent.text(qna.answerContent);
                  //     content.append(answer);
                  //   }else{
                  //     title.append("<div class='unCheck'>미답변</div>");

                  //   }

                  //   if(index % 2 == 0 ){
                  //     layoutLeft.append(li);
                  //   }else{
                  //     layoutRight.append(li);
                  //   }
                  // });
                }
              }).done(function () {
                ajaxToggle = false;
              });
            }
          })

        });

        $(function () {
          $(document).on("click", "button:button[name='reply']", listComment);
          //name이 reply인 button을 click했을때  listComment는 param값이 없다.
          // 그렇지만 클릭시 버튼에 걸린 event값이 event object 객체로 전달됨. 


          function listComment(paramiter) {

            // var postNo = $(this).val(); //그 button의 val값을 가지고와서 담는다. 
            // var userId = $(this).attr('id');
            // var postNo = 0;
            console.log("paramiter은 object인가?" + paramiter); //Object가 찍힌다. 

            // if( paramiter instanceof Object ){ // paramiter가 object이면 
            //   var parent = $(paramiter.currentTarget).closest("div[data-postno]"); //그 button의 val값을 가지고와서 담는다. 
            //   postNo = parent.data("postno");
            //   console.log("if in ::",postNo);
            // }else{
            //   postNo = paramiter;
            //   console.log("else in ::",postNo);
            // }

            var parent = $(paramiter.currentTarget).closest("div[data-postno]"); //그 button의 val값을 가지고와서 담는다. 
            var postNo = parent.data("postno");
            console.log("if in ::", postNo);


            console.log("들어온 post nunber :: ", postNo);

            // var parent = $(this).closest("div[data-postno]"); //그 button의 val값을 가지고와서 담는다. 
            // var  postNo = parent.data("postno");

            var userId = $("body").data("userid");

            // console.log("this = > " , $(this)) ;
            // console.log("t", typeof postNo, postNo ,userId);

            var params = { "postNo": postNo }; //담은 value값을 json형식으로 object에 담아 보낸다. 
            var listHtml = "";
            // var userid = ${ userId };
            // console.log(userid);

            if ("${userId}" == "" || "${userId}" == null) {
              console.log("ㅠㅠ")
              listHtml += " <div> ";
              listHtml += " 세션이 만료되었습니다. 재로그인해주세요";
              listHtml += " <div> ";
              $(".post" + postNo).html(listHtml);

            } else {

              $.ajax({
                type: "post", //데이터를 보낼 방식
                url: "/community/rest/listComment", //데이터를 보낼 url
                data: params, //보낼 데이터


                success: function (list) {// 받은 data를 list라는 변수로 생성한다. 받은 data는 { list = [{~~~} , {~~~},] } 
                  // 변수생성
                  // var => 안에 있는 값이 변할수도 있음 1 => "가나다"
                  // let => var
                  // const => 값이 변하지않아.

                  console.log("list \n", list);

                  for (const i in list) { //받은 data는 list = { [{~~~},{~~~} ] } 


                    // 1개의 list가 날아올때 object에 감싸져서  { [{~~~},{~~~} ] }
                    // 여러개의 list가 날아올때는 object에 감싸져서 json형태의 key:value로 { a:[{~~~},{~~~} ], b:c, d:f }

                    //console.log("인덱스 => ", i);
                    //console.log("인덱스의 값 => ", list[i]);
                    //console.log(" => ", list[i].postNo.postNo);

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

                          //console.log("${userId}");
                          //console.log(commentWriter);




                          // listHtml += "<a href='#' class='update-comment' id='" + commentNo + "' >&nbsp;댓글수정</a>";
                          listHtml += "<a href='#' class='delete-comment' id='" + commentNo + "' >&nbsp;댓글삭제</a>";

                        }
                        // console.log("userId::::::::" + "${userId}");
                        // console.log(commentWriter);

                        listHtml += "</div>";
                        listHtml += "</div>";
                        listHtml += "</div>";
                        listHtml += "<div class='updatecomment" + commentNo + "'></div>";

                      };
                      // console.log("1", listHtml)


                    };
                    // console.log("2", listHtml) //이 안에서 commentno를 뽑아야한다.. 
                    // console.log("댓글 번호 !! ㅎㅎ ",commentNo);

                    // console.log(" 내 댓글 ㅎㅎ!! ",  $(".update-comment"+commentNo );
                    // $('.update-comment'+commentNo).on('click', updateClickComment); 
                  };

                  listHtml += "<div class='comment-form'>";
                  listHtml += "<div class='form-group'>";
                  listHtml += "<textarea class='form-control' style='border-style: dashed' id='comment' value='' name='comment' data-postno='" + postNo + "' data-userid='" + userId + "' rows='4'placeholder='댓글을 등록해주세요'>";
                  listHtml += "</textarea>";
                  listHtml += "</div>";
                  listHtml += "<p class='help-block text-danger'></p>";
                  listHtml += "<button class='btn btn-round btn-d add-comment' type='submit'>댓글 등록</button>";
                  listHtml += "</div>";



                  $(".post" + postNo).html(listHtml); //html이 완성된 다음에 function 호출 

                  $('.add-comment').on('click', addClickComment); // 호출은 안에서하고 함수는 바깥에 있는 이유?? 


                  $('.delete-comment').on('click', deleteClickComment);
                  // $(".up-btn").on("click", updateClickComment);
                  $('.update-comment').on('click', updateClickComment);



                }

              });//ajax END 비동기 처리
              // console.log("3", listHtml)
            }

          };//button END

          function addClickComment(e) { //여기에 event를 써야 이 함수를 호출한 click 이벤트에대한 정보를 객체로 받을 수 있다. 

            // console.log($(this).closest(".comment-form")); //가장 가까운 상위요소를 클래스로 잡고
            // console.log($(this).closest(".comment-form").find("textarea")); //하위요소를 잡고 
            var el = $(this).closest(".comment-form").find("textarea"); // 변수에 저장하고

            // console.log(el.data("postno"));// 그 변수의 데이타옵션의 postno 이름을 가진 속성의 값을 가져온다.  
            // console.log(el.data("userid"));
            // console.log(el.val()); //value 뽑아온다. 

            // var elData = el.data(); <- data로 뽑아오면 {} object형식이다.
            // console.log(elData);


            var postno = el.data("postno");
            var userid = el.data("userid");
            var val = el.val();

            val = val.trim(); // 공백을 제거합니다.

            if (val == "") {
              alert("글을 입력하세요");
            } else {

              $(this).closest(".comment-form").find("textarea").val("");

              addComment(postno, userid, val);

              function addComment(postno, userid, val) {//  const addComment = function (postno, userid, val) {  으로 사용하면 addComment가 밑에 있으므로 위에  addComment(postno,userid,val);가 실행될 수 없다.

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
                    // listComment(postno); // 이렇게 호출했을때 this는 없다. 이벤트가 걸리지않았기때문에 ! 

                  },
                  error: function () {
                    console.log("error::::");
                  }
                });
              }
            }

          };//add commenet END

          function updateClickComment(e) {

            e.preventDefault();

            var commentno = $(this).attr('id');

            listComment(commentno)


          }

          function deleteClickComment(e) {

            e.preventDefault();//기본값 방지 a링크 눌렀을때 새로고침이 되지않도록 방지하는 ()

            //.delete-comment을 click시 이벤트값이 object값이 e로 넘어온다. 

            var commentno = $(this).attr('id');

            console.log("id::" + commentno);

            $.ajax({
              type: "get",
              url: "/community/rest/deleteComment",
              data: {

                commentno: commentno,

              },

              success: function (post) {   //{post:(~~~~~~~~~)}


                listComment(e); //.delete-comment 클릭시 넘어온 event object를 넘긴다.          

                let commentTotalCount = post.commentTotalCount;
                let postNo = post.postNo;
                let commentText = "총 댓글 수 " + commentTotalCount;

                // console.log(commentText);
                $('.commentTotalCount' + postNo).html(commentText);

              },
              error: function () {

                console.log("deleteComment error::::");

              }

            });


          } //deleteClickComment END 





          $(function () {
            $('[data-toggle="tooltip"]').tooltip()
          })


        }); //function END





      </script>

    </body>

    </html>