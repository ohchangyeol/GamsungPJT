$(document).ready(function(){
  const userId = $("body").data("userid");
  
  $(".qna-back").on("click" , ()=>{
    const dataQnaType = $("body").data("qnatype");
    if(dataQnaType == "my"){
      self.location ="/servicecenter/listQna?id="+userId;
    }else{
      self.location ="/servicecenter/listQna";
    }
  })

  $(".qna-list tr").on("click" , (e)=>{
    const qnaNo = $(e.currentTarget).find('.qna-no').text();
    self.location ="/servicecenter/getQna?qnaNo="+qnaNo;
  })
  
  $(".qna-btn").on("click", (e)=>{
    
    console.log(typeof $(e.currentTarget).data("type") );
    const qnaType = $(e.currentTarget).data("type");
    
    if(userId == null || userId == undefined || userId == ""){
      Swal.fire({
        icon: 'error',
        title: '로그인이 되어있지 않습니다.',
        text: '로그인을 해주세요! ',
      })
    }else{
      switch (qnaType) {
        case 1:
          self.location ="/servicecenter/listQna?id="+userId;
          break;

        case 2:
          self.location ="/servicecenter/addQna";
          break;
        default:
          alert("잘못된 선택입니다.");
          break;
      }
    }
    
  });
  $("#qna-send").on('click' , (e)=>{
    
      Swal.fire({
          title: '등록 하시겠습니까?',
          // text: "You won't be able to revert this!",
          icon: 'question',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '등록',
          cancelButtonText: '취소'
      }).then((result) => {
          if (result.isConfirmed) {
              Swal.fire(
              '등록이 완료되었습니다.',
              '내 Q&A 내역으로 전환됩니다.',
              'success'
              ).then(()=>{
                  const campNo = $("input[name=campNo]");

                  if(campNo.val() == '' || campNo.val() == undefined || campNo.val() == null){
                      campNo.val(0);
                  }
                  $("#qna-add-form").attr("action","/servicecenter/addQna").attr( "method","post" ).submit();
              })
          }else{
              return;
          }
      })
  })

  $("#qna-delete-btn").on("click",()=>{
    console.log("클릭")
    const qnaNo = $(".qna-content").data("qnano");
      Swal.fire({
        title: 'Q&A를 삭제 하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
            '삭제가 완료되었습니다.',
            'Q&A 목록으로 전환됩니다.',
            'success'
            ).then(()=>{
                self.location ="/servicecenter/deleteQna?qnaNo="+qnaNo;
            })
        }else{
            return;
        }
      })
  });

  $("#send-answer").on("click",()=>{
    Swal.fire({
      title: 'Q&A에 답변을 등록하시겠습니까?',
      icon: 'question',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '등록',
      cancelButtonText: '취소'
    }).then((result) => {
      if (result.isConfirmed) {
          Swal.fire(
          '답변이 등록되었습니다.',
          ' ',
          'success'
          ).then(()=>{
            $("#answer-form").attr("action","/servicecenter/addQnaAnswer").attr( "method","post" ).submit();
          })
      }else{
          return;
      }
    })
    
  })

  
  
  let isFlag = false;
  let ajaxToggle = false;
  const pageEl = $("#currentPage");
  const searchEl = $(".qna-serach-input");
  

  $(window).scroll(function(){
    let currentPage = pageEl.val();
    
    // console.log(window.innerHeight + window.scrollY );
    // console.log("----------------------");
    // console.log($(document).height() - ($(document).height() / 10));

    if(window.innerHeight+ window.scrollY >= Math.floor( $(document).height()-($(document).height() / 10) ) && !isFlag && !ajaxToggle ){
      pageEl.val(++currentPage); 

      ajaxToggle = true;

      $.ajax({
        url : "/servicecenter/rest/listQna" ,
        method : "GET" ,
        data:$(".qna-search").serialize(),
        dataType : "json" ,
        success : function(JSONData , status) {
          console.log(JSONData);

          const qnas = JSONData.qnas;
          const searchData = JSONData.search;
          
          if(qnas.length == 0){
            isFlag = true;
          }
            
          searchEl.val(searchData.searchKeyword)
          

          // console.log(li);
          // console.log(answer);
          qnas.forEach( (qna, index) => {
          // for(let index = 0 ; index < qnas.length ; index++ ){
            const layoutLeft = $(".qna-left");
            const layoutRight = $(".qna-right");
            let li = $(".format #accordion").clone();
            let answer = $(".format .answer").clone();
            // const qna = qnas[index];
            console.log(index);
            const title = li.find("a.collapsed");// 제목
            const collapse = li.find("div.collapse");
            const content = li.find("div.question"); // 내용
            const answerContent = answer.find("span"); // 답변 내용

            title.attr("href" , "#support"+qna.qnaNo).text(qna.questionTitle);
            collapse.attr("id" , "support"+qna.qnaNo);
            content.text(qna.questionContent);

            console.log(qna.answerContent);
            if(qna.answerContent != null){
              title.append("<div class='check'>확인</div>");
              answerContent.text(qna.answerContent);
              content.append(answer);
            }else{
              title.append("<div class='unCheck'>미답변</div>");

            }

            if(index % 2 == 0 ){
              layoutLeft.append(li);
            }else{
              layoutRight.append(li);
            }
          });
        }
      }).done(function () {
        ajaxToggle = false;
      });
      //     var list = JSONData.list;
      //     console.log(JSONData);
          
      //     console.log(list);
      //     if(list.length == 0){
      //       console.log("list가 없어서 씀")
      //       isFlag = true;
      //     }
      //     var temp = "<div class='row' style='text-align: center;'>";
      //     for(var i =0 ; i < list.length ; i ++){
      //       console.log("for문 " + i);
      //       temp +=  "<div class='col-lg-4'>"
      //                   +"<img class='img-circle' src='/images/uploadFiles/"+list[i].fileName+"' data-toggle='tooltip' data-placement='top' title='상품 번호 : "+list[i].prodNo+"<br>상품명 : "+list[i].prodName+"<br>상세 정보 : "+list[i].prodDetail+"<br>제조일자 : "+list[i].regDate+" <br>가격 : "+list[i].price+"원 <br>등록일자 : "+list[i].manuDate+"' width='140' height='140' data-html='true'>"
      //                   +"<h2>"+list[i].prodName+"</h2>"
      //                   +"<p class ='product-price'>"+list[i].price+"원</p>"
      //                   +"<p>"+list[i].prodDetail+"</p>";
                          
      //       if (menu == "search") {
      //                     if( list[i].prodTranCode == null){
      //                       temp += "<button type='button' class='btn btn-primary' data-prodno='"+list[i].prodNo+"'>Buy &raquo;</button>";
      //                     }else{
      //                       temp += "<button type='button' class='btn btn-danger'>sold out</button>";
      //                     }
      //                 }else if(menu == "manage"){
      //                     if( list[i].prodTranCode == null){
      //                       temp += "<p><a class='btn btn-default' href='/product/updateProduct?prodNo="+list[i].prodNo+"' role='button'>Change &raquo;</a></p>";
      //                     }else{
      //                         if(list[i].prodTranCode .trim() == '1'){
      // // 		                            	temp += "<a class='btn btn-info' role='button' href='/purchase/updateTranCodeByProd?prodNo="+list[i].prodNo+"&menu="+menu+"' onclick='return confirm('선택 하신 상품 "+list[i].prodName+"을 배송 하시겠습니까?')'>배송하기</a>";
      //                         }else if(list[i].prodTranCode .trim() == '2'){
      //                           temp+= "<a class='btn btn-danger' role='button' href='#'>배송중</a>";
      //                         }else{
      //                           temp += "<a class='btn btn-danger' role='button' href='#'>재고 없음</a>";
      //                         }
      //                     }
      //                 }
      //       temp += "</div>";
      //     }
      //     temp += "</div>";
      //     $(".marketing").append(temp);
      //     }
      // });
    }//end of If
  });

  fncGetList = (currentPage)=>{
    $("#currentPage").val(currentPage);
    $(".qna-search").attr("method", "post").submit();
  }

})