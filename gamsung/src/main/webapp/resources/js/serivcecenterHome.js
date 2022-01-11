$(document).ready(function(){
    console.log("hello service Center");
    $('.btn[data-btntype]').on('click' , (e)=>{
        const userid = $("body").data("userid");
        const btnType = $(e.currentTarget).data('btntype');
        
        console.log(userid);

        switch (btnType) {
            case 1:
                self.location = "/servicecenter/listNotice"
                break;
        
            case 2:
                self.location = "/servicecenter/listQna"
                break;
        
            case 4:
                if(userid == undefined || userid == null || userid == ""){
                    Swal.fire(
                        '로그인 하셨나요?',
                        '로그인 후 가능합니다.',
                        'question'
                    )
                    return;
                }else{
                    self.location = "/servicecenter/listReport?id="+userid;
                }
                break;
            
            case 5:
                if(userid == undefined || userid == null || userid == ""){
                    Swal.fire(
                        '로그인 하셨나요?',
                        '로그인 후 가능합니다.',
                        'question'
                    )
                    return;
                }else{
                    self.location = "/servicecenter/listQna?id="+userid;
                }
                break;
            
            default:
                // alert("잘못된 선택입니다.");
                break;
        }
    });
    
    
})