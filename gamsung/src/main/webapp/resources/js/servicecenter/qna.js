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

  fncGetList = (currentPage)=>{
    $("#currentPage").val(currentPage);
    $(".qna-search").attr("method", "post").submit();
  }

})