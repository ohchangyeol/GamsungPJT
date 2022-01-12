$(document).ready(function(){

    
    $(".delete-btn").on("click",function (e){
        const el = $(e.currentTarget);
        const key = el.data("id");
        const input = $("input[id="+key+"]");
        const label = $("label[for="+key+"]");

        el.find("img").hide();
        label.find("i").show();
        input.val("");
    })
    
    
    $(".report-send").on('click', (e)=>{
        const form = $("#report-add-form");
        form.attr("enctype","multipart/form-data");

        const formData = new FormData(form[0]) ;

        $.ajax({
            type : 'post',
            url : '/servicecenter/rest/addReport',
            data : formData,
            dataType : 'json',
            processData : false,
            contentType : false,
            error: function(xhr, status, error){
                Swal.fire({
                    icon: 'error',
                    title: 'ERROR!',
                    text: '처리하는 도중 문제가 발생하였습니다.\n 다시 시도해주세요.'
                })
            },
            success : function(json){
                if(json == 1){
                    Swal.fire({
                        icon: 'success',
                        title: '신고가 접수 되었습니다.',
                        showConfirmButton: false,
                        timer: 2000
                    }).then(()=>{
                        $(".mfp-iframe-scaler",parent.document).find(".mfp-close").trigger("click");
                    })
                }else{
                    Swal.fire(
                        '닉네임 또는 캠핑장명이 \n잘못 되었습니다. ',
                        '닉네임 또는 캠핑장명을 다시 입력해주세요.',
                        'question'
                    )

                }
            }
        });
    })


    $("input[type=file]").on("change" , (e)=>{
        const input = $(e.currentTarget);
        const getId= input.attr("id");
        const targetLabel = $("label[for="+getId+"]");
        const targetImg = $("label[for="+getId+"]").next().find("img");
        const icon = targetLabel.find("i");
        
        if(input[0].files && input[0].files[0]) {
            const reader = new FileReader()
            reader.onload = e => {
                targetImg.attr("src" , e.target.result);
                icon.hide();
                targetImg.show();
            }
            reader.readAsDataURL(input[0].files[0])
        }

    })

    $(".add-report #report-type").on("change", ()=>{
        const value = $("option:selected", this).attr("value");
        const receiver = $("#receiver-name");
        const receiverInput = $("#report-receiver");

        if(value == "1"){
            receiver.text("캠핑장명 *");
            receiverInput.attr("name" , "receiverCampName");
        }else{
            receiver.text("상대방 닉네임 *")
            receiverInput.attr("name" , "receiverNickName");
        }
    }).trigger("change");

})