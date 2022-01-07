$(document).ready(function(){
    console.log("hello service Center");
    $('.btn[data-btntype]').on('click' , (e)=>{
        // console.log($(e.currentTarget));
        // console.log("this ",$(this));
        // console.log("target ",$(e.currentTarget));

        const btnType = $(e.currentTarget).data('btntype');$(this)
        console.log(btnType)
        switch (btnType) {
            case 1:
                // 공지사항
                self.location = "/servicecenter/listNotice"
                break;
        
            case 2:
                // Q&A
                self.location = "/servicecenter/listQna"
                break;
        
            case 3:
                // 신고하기
                self.location = "/servicecenter/addReport"
                break;
        
            case 4:
                // 신고 내역
                self.location = "/servicecenter/listReport/my"
                break;
            
            case 5:
                // 내 Q&A
                self.location = "/servicecenter/listQna/my"
                break;
            
            default:
                alert("잘못된 선택입니다.");
                break;
        }
    })
})