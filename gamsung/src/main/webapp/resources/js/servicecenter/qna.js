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
            icon: 'warning',
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

  })