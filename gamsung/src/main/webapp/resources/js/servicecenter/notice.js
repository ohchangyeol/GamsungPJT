$(document).ready(function(){

    eventInit();
    noticeLoading();
    fncGetList = (currentPage)=>{
        $("#currentPage").val(currentPage);
        $(".notice-search").attr("method", "post").submit();
    }

})// end jQurey

function noticeLoading(){

    const noticeContent = $("div.format.update-content").html();
    console.log($("div.format.update-content"));
    console.log(noticeContent);
    console.log($(".note-editable"));
    if(noticeContent != undefined || noticeContent != null || noticeContent != ''){
        $(".note-editable").append(noticeContent);
    }
}

function eventInit() {

    $(".notice-search-btn").on("click", ()=>{
        $(".notice-search").attr("method", "post");
    })
    
    $(".notice-list ul li").on("click" , (e)=>{
        const noticeNo = $(e.currentTarget).find('.notice-no').text();
        // console.log(noticeNo);
        self.location ="/servicecenter/getNotice?noticeNo="+noticeNo;
    })
  
    $(".notice-back").on('click', ()=>{
        self.location ="/servicecenter/listNotice";
    })
    $("#notice-delete-btn").on("click",()=>{
        const noticeNo = $(".getNotice").data("noticeno");
        Swal.fire({
            title: '공지사항을 삭제 하시겠습니까?',
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
                '공지사항 목록으로 전환됩니다.',
                'success'
                ).then(()=>{
                    self.location ="/servicecenter/deleteNotice?noticeNo="+noticeNo;
                })
            }else{
                return;
            }
        })
        
    })

    $("#notice-update-btn").on("click",()=>{
        const noticeNo = $(".getNotice").data("noticeno");
        
        Swal.fire(
        '수정페이지로 전환됩니다',
        ' ',
        'success'
        ).then(()=>{
            self.location ="/servicecenter/updateNotice?noticeNo="+noticeNo;
        })
    
    })

    $("#n-files").bind('change', function() {
        selectFile(this.files);
    });
    
    $(".notice-btn").on("click" , (e)=>{
        const no = $(e.currentTarget).data("no");
        const tagContent = $(".note-editable").html();
        const file = $("#n-files").val();

        $("#n-content").val(tagContent);
        
        console.log(tagContent);
        
        switch (no) {
            case 1:
                console.log($("#n-content").val());
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
                        '공지사항 목록으로 전환됩니다.',
                        'success'
                        ).then(()=>{
                            console.log("넘어간닷!")
                            $("#notice-form").attr("action" , "/servicecenter/addNotice").attr("method" , "post").attr("enctype","multipart/form-data").submit();
                        })
                    }else{
                        return;
                    }
                })
                break;
            case 2:
                $("#notice-form")[0].reset();
                break;
            case 3:
                Swal.fire(
                    '등록이 완료되었습니다.',
                    '공지사항 상세보기로 전환됩니다.',
                    'success'
                ).then(()=>{
                    $("#notice-form").attr("action" , "/servicecenter/updateNotice").attr("method" , "post").attr("enctype","multipart/form-data").submit();
                })
                break;
            case 4:
                window.history.back();
                break;
            default:
                alert("뭘누른거임?")
                break;
        }
    })

    
}



