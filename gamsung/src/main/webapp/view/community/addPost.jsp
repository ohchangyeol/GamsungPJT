<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en-US" dir="ltr">

    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <title>Post Add</title>

      <jsp:include page="../../resources/commonLib.jsp" />

      <meta name="msapplication-TileColor" content="#ffffff">
      <meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
      <meta name="theme-color" content="#ffffff">


      <style>
        .camera-box {
          display: flex;
          /*         justify-content: flex-start; */
          /*         text-align: center; */
          color: #c1c1c1;

          /*         height: 90px; */
          /*         padding-bottom: 10px; */
          flex-direction: column;
        }


        .camera-video .camera-box+.camera-box {
          margin-left: 20px
        }

        .camera-box div svg {
          width: 90%;
          height: 90%;
        }

        .camera-box .video-btn svg {
          transform: translateY(4px);
        }

        .camera-box .camera-btn svg {
          transform: translateY(2px);
        }

        .camera-video {
          display: flex;
          justify-content: flex-start;
          text-align: center;
          color: #c1c1c1;
          padding-bottom: 10px;
        }

        #file {
          display: none;
        }


        .layer {
          display: none;
          margin: 0px;
          width: 100%;
        }

        .camp1 {
          display: flex;
          gap: 15px;
        }

        .camp1 .search-btn {
          right: 3px;
        }

        .starR {
          background: url('http://127.0.0.1:8080/uploadfiles/ico_review.png') no-repeat right 0;
          background-size: auto 100%;
          width: 15px;
          height: 15px;
          display: inline-block;
          text-indent: -9999px;
          cursor: pointer;
        }

        .starR.on {
          background-position: 0 0;
        }

        .starRev {
          transform: scale(1.3) translateX(328px);
        }

        .text-start {
          display: inline-block;
          transform: translateY(-3px);
          font-weight: bolder;
          color: #979797;
        }

        .campsearchadd {
          margin-bottom: 15px;
        }
        
        .form-control.add {
    border-radius: 9px;
    background-color: #b3c2d124;
    border: #f0f8ff00;
}


#postsubmit {
border-radius: 9px;
    background-color: #676869;
    color: rgb(255 255 255 / 70%);
    font-size: 15px;
    padding: 4px;
    font-family: 'Gaegu', cursive;
    letter-spacing: 1px;
}

        /* class="text-start" style ="display: inline-block"; transform: translateY(1px); */
      </style>



    </head>

    <body data-spy="scroll" data-target=".onpage-navigation" data-userid="${user.id}" data-offset="60"
      style="background: #fff">
      <main>


        <div class="page-loader">
          <div class="loader">Loading...</div>
        </div>


        <!-- header -->
        <jsp:include page="../common/header.jsp" />
        <!-- headerEnd -->

        <section class="module" id="contact">
          <div class="container">

            <div class="row">
              <!-- sidebar Start -->
              <jsp:include page="leftCommunity.jsp" />
              <!-- sidebar End -->

              <!--addPost Start-->

              <div class="col-sm-8 col-sm-offset-1">
               <h2 class="module-title font-alt " style="color: #666666;text-align: inherit;position:inherit;font-family: 'Gaegu', cursive;font-size: 35px;letter-spacing: -3px;margin: 0px;">감성캠핑 커뮤니티게시글 등록
                </h2>
                <div class="module-subtitle font-serif"></div>
              </div>

              <div class="col-sm-8 col-sm-offset-1">

                <form name="postForm" id="postForm" style="width: 500px" role="form">


                  <div class="camp1">
                    <div class="form-group">
                      <select class="form-control add" name="postType" id="postType" style="width: 216px">
                        <option selected="selected">카테고리를 선택해주세요.</option>
                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected"
                          : "" }>캠핑리포트</option>
                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected"
                          : "" }>캠핑노하우</option>
                        <option value="3" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected"
                          : "" }>추억 한컷</option>
                        <option value="4" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected"
                          : "" }>내캠핑기록</option>
                        <option value="5" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected"
                          : "" }>캠핑지식인</option>
                      </select>
                    </div>

                    <div class="layer">

                      <div class="search-box campsearch">
                        <label class="sr-only" for="searchCampKeyword">검색어</label>
                        <input type="text" class="form-control add" id="searchCampKeyword" name="searchCampKeyword"
                          placeholder="캠핑장이름을 입력해주세요." value="">
                        <button class="search-btn" id="camp-search-btn" name="search-btn" type="button"><i
                            class="fa fa-search"></i></button>
                      </div>

                    </div>

                  </div>

                  <div class="campsearchadd">

                  </div>

                  <div class="form-group">
                    <label class="sr-only" for="title">제목</label>
                    <input class="form-control add" type="text" id="postTitle" name="postTitle" placeholder="제목을 입력해주세요."
                      required="required" />
                    <p class="help-block text-danger"></p>
                  </div>


                  <div class="form-group">
                    <label class="sr-only" for="content">내용</label>
                    <textarea class="form-control add" id="postContent" name="postContent" placeholder="내용을 입력해주세요."
                      required="required" style="height: 514px" wrap="hard"></textarea>
                    <p class="help-block text-danger"></p>
                  </div>

                  <div class="form-group layer">
                  <div class="starRev" style="
    transform: translateX(362px);
">
                     <span class="text-start" style="
    font-family: 'Gaegu', cursive;
    font-size: 22px;
    transform: translateX(-3px) translateY(-5px);
">평점</span>
                      <span class="starR on" data-star=1.0>별1</span>
                      <span class="starR" data-star=2.0>별2</span>
                      <span class="starR" data-star=3.0>별3</span>
                      <span class="starR" data-star=4.0>별4</span>
                      <span class="starR" data-star=5.0>별5</span>
                      <span id="result_star" style="text-align: center;"></span>
                    </div>
                  </div>


                  <div class="form-group">
                    <label class="sr-only" for="hashtag">해시태그</label>
                    <input class="form-control add" type="text" id="allhashtag" name="allhashtag"
                      placeholder="태그를 입력해주세요(최대3개)"></input>
                    <p class="help-block text-danger"></p>
                  </div>

                  <input type="hidden" id="hashtag1" name="hashtag1" value="">
                  <input type="hidden" id="hashtag2" name="hashtag2" value="">
                  <input type="hidden" id="hashtag3" name="hashtag3" value="">



                  <div class="camera-video">

                    <div class="camera-box">
                      <div class="image-upload">

                        <button type="button" id="filebutton" class="btn btn-outline-dark"
                          style="background-color: white; padding-left: 0px; padding-right: 0px;">
                          <div class="camera-btn"
                            style="width: 100px;  border: 1px solid;  border-radius: 20px;   margin-bottom : 5px;  text-color : #EAEAEA;">
                            <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-camera" width="16" height="16"
                              fill="currentColor" class="bi bi-camera" viewBox="0 0 16 16">
                              <path
                                d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z" />
                              <path
                                d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
                            </svg>
                          </div>사진등록
                        </button>

                        <input type="file" id="file" name="postImg" accept="image/*" multiple="multiple"
                          onchange="uploadFile(this)" style="display:none" />

                      </div><!-- image-upload end -->
                    </div><!-- camera-box 1  end -->


                    <div class="image-show" id="image-show"></div>

                    <div class="camera-box">

                      <button type="button" class="btn btn-outline-dark"
                        style="background-color: white; padding-left: 0px; padding-right: 0px;"">
			            		<div class=" video-btn"
                        style="width: 100px;  border: 1px solid;  border-radius: 20px;   margin-bottom : 5px;  text-color : #EAEAEA;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                          class="bi bi-camera-video" viewBox="0 0 16 16">
                          <path fill-rule="evenodd"
                            d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2V5zm11.5 5.175 3.5 1.556V4.269l-3.5 1.556v4.35zM2 4a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h7.5a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1H2z">
                          </path>
                        </svg>
                    </div>동영상등록
                    </button>
                  </div>

              </div>

              <div class="text-center">
                <button class="btn btn-block btn-round btn-d" id="postsubmit" name="1" type="button">게시글 등록</button>
              </div>


              <input type="hidden" id="statusRating" name="statusRating" value=0>
              <input type="hidden" id="user_id" name="user_id" value="${user.id}">

              </form>
            </div>
          </div>
          </div>
        </section>
      </main>


      <script src="../../resources//js/community.js"></script>
      <script>


        $(function () {
          $("button:button[name='1']").on("click", function () {
            //  $("#postsubmit").on("click" , function() {
            //Debug..
            fncAddPost();
          });

        });

        function fncAddPost() {

          console.log("fncAddPost 호출")

          var postTitle = $("input[name='postTitle']").val();
          var postType = $("select[name='postType']").val();
          var postContent = $("textarea[name='postContent']").val();
          var hashtags = $('#allhashtag').val().split('#');



          $("textarea[name='postContent']").val($("textarea[name='postContent']").val().replace(/\n/g, "<br>"));

          console.log($("textarea[name='postContent']").val());
          

          hashtags.shift(); // 첫번째 배열 삭제 

          console.log($('#allhashtag').val());
          console.log(hashtags);

          if (postTitle == '') {
            alert("제목을 입력해주세요");
            $("input:text[name='postTitle']").focus();
            return;
          }

          if (postContent == '') {
            alert("내용을 입력해주세요");
            $("textarea:text[name='postContent']").focus();
            return;
          }

          if (postType == '') {
            alert("내용을 입력해주세요");
            $("select[name='postType']").focus();
            return;
          }

          if (hashtags.length > 4) {
            alert("해시태그는 최대 3개 까지 등록 가능합니다.");
            $('#allhashtag').focus();
            return;
          }


          hashtags.forEach((el, index) => { /* array item 하나씩, 그리고 그것의 index */

            var i = index + 1;  /* 0+1=1 , 1+1=2 , 2+1=3 .... 여기서 var는 hashtag앞에 붙일 숫자.  */

            $('#hashtag' + i).val('#' + el); /* #hashtag1, #hashtag2, #hashtag3에 val을 넣는다. el값 하나씩  */

            console.log("이것좀보세요" + $('#hashtag' + i).val());

          })


          if (confirm("등록하시겠습니까?")) {
            $("form").attr("method", "POST").attr("action", "/community/addPost").attr("enctype", "multipart/form-data").submit();
          }

        };

        $('#filebutton').click(function () {
          $('#file').click();
        });

        function uploadFile(e) {
          console.log("file Name:", e.value);
        }

        jQuery('#postType').change(function () {//$는 jQuery로도 사용 가능하다.       
          var state = jQuery('#postType option:selected').val();

          if (state == '4') {
            jQuery('.layer').show();
          } else {
            jQuery('.layer').hide();
          }
        });

        $(function () {
          $("#camp-search-btn").on("click", searchCamp);

          // var searchKeyword = document.getElementById('searchKeyword').value; //이거 안잡힘.. 




          function searchCamp(e) { // e는 위에 타겟에 관련된 이벤트가 변수로 들어옴 (속성포함)


            var searchKeyword = $("#searchCampKeyword").val();

            console.log(searchKeyword);

            $.ajax({
              type: "post",
              url: "/community/rest/searchListCamp",
              data: {

                searchKeyword: searchKeyword,

              },

              success: function (map) {

                console.log("map::::", map);

                if (map != null && map != 0 && map != "") { // && 조건이 모두 true일 경우 진행된다. 

                  var list = map.list;  // map에서 list만 꺼낸다. 

                  console.log("map에서 꺼낸 list", list);

                  var listHtml = "";


                  listHtml += " <div class='form-group'>";
                  listHtml += " <select class='form-control' name='campNo'  id='campNo' style='width: 499px'>";
                  listHtml += " <option selected='selected'>캠핑장을 선택해주세요(높은 조회순 5개의 캠핑장)</option>";

                  for (const i in list) { // {map : Array(0), totalCount:1}
                    //  map : 0 { a:a, b:b, c:c, d:d }
                    var campNo = list[i].campNo;
                    var campName = list[i].user.campName;

                    console.log(list[i].campNo);
                    console.log(list[i].user.campName);

                    listHtml += " <option value=" + campNo + ">" + campName + "</option>";



                  }
                  listHtml += " </select>";
                  listHtml += " </div> ";


                  $(".campsearchadd").html(listHtml);

                }
              },//success end
              error: function () {
                console.log("error::::");

              }//error end

            });//ajax end

          } //searchCamp end




        });//function end

        $('.starRev span').on("click", function () {
          $(this).parent().children('span').removeClass('on');
          $(this).addClass('on').prevAll('span').addClass('on');
          var append = "&nbsp;&nbsp;&nbsp;(" + $(this).data('star') + "점)";

          console.log($(this).data("star"));

          $("#statusRating").val($(this).data("star"));

          console.log($(this).data("star"));

          $("#result_star").empty();
          $("#result_star").append(append);

          return false;
        });

      </script>

    </body>

    </html>