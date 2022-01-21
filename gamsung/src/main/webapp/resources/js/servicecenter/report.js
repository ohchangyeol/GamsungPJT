$(document).ready(function(){
    

    $(".report-updatecode-btn").on("click", (e)=>{
        const reportNo = $(".get-report").data("reportno");
        const receiverId = $(".get-report").data("receiverid");
        const status = $(e.currentTarget).data("code");
        const data = {  "reportNo": reportNo , 
                        "reportStatus" : status ,
                        "receiverId" : receiverId}
        $.ajax({
            type : 'post',
            url : '/servicecenter/rest/updateCode',
            data : JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType : 'json',
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
                        title: '신고처리가 되었습니다.',
                        showConfirmButton: false,
                        timer: 2000
                    }).then(()=>{
                            location.reload();
                    })
                }else{
                    Swal.fire(
                        '신고가 거절 되었습니다.',
                        '  ',
                        'question'
                    ).then(()=>{
                        location.reload();
                })

                }
            }
        });
    })

    $(".report-back").on("click", (e)=>{
        self.location ="/servicecenter/listReport";
    })

    $(".report-cancel").on("click", (e)=>{
        const reportNo = $("body.get-report").data("reportno");
        Swal.fire({
            title: '신고접수를 취소하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네.',
            cancelButtonText: '아니오.'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type : 'get',
                    url : '/servicecenter/rest/deleteReport/'+reportNo,
                    dataType : 'json',
                    error: function(xhr, status, error){
                        Swal.fire({
                            icon: 'error',
                            title: 'ERROR!',
                            text: '처리하는 도중 문제가 발생하였습니다.\n 다시 시도해주세요.'
                        })
                    },
                    success : function(json){
                        console.log(json);
                        if(json == 1){
                            Swal.fire(
                                '신고취소가 완료되었습니다.',
                                '신고 목록으로 전환됩니다.',
                                'success'
                                ).then(()=>{
                                    parent.document.location.reload();
                                    $(".mfp-iframe-scaler",parent.document).find(".mfp-close").trigger("click");
                                })
                        }else{
                            Swal.fire(
                                '신고 취소가 잘못 되었습니다.',
                                '  ',
                                'question'
                            )
        
                        }
                    }
                });
                
            }else{
                return;
            }
        })
    })
    $("#report-condition").on("change" , ()=>{
        // console.log("변경");
        $(".rerport-search").attr("method", "post").submit();
    })
    $(".my-report tbody tr").on("click" , (e)=>{
        const reportNo = $(e.currentTarget).find(".report-no").text();

        url = "/servicecenter/getReport?reportNo="+reportNo;
        $.magnificPopup.open({
            items: {
                src: url,
                type: 'iframe',
                closeBtnInside: true,
                midClick: true ,
                
                iframe: {
                markup: '<div style="width:400px; height:720px;">'+
                        '<div class="mfp-iframe-scaler" >'+
                        '<div class="mfp-close">xxxxxx</div>'+
                        '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+
                        '</div></div>'
                }
               

            },
            mainClass: 'report-modal-content'

        });
    })
    $(".admin-report tbody tr").on("click" , (e)=>{
        const reportNo = $(e.currentTarget).find(".report-no").text();
        console.log(reportNo);
        self.location ="/servicecenter/getReport?reportNo="+reportNo;
    })
    $('.image-link').magnificPopup({
        type: 'image',
        mainClass: 'mfp-with-zoom',
        zoom: {
          enabled: true,
      
          duration: 300,
          easing: 'ease-in-out',
      
          opener: function(openerElement) {
            return openerElement.is('img') ? openerElement : openerElement.find('img');
          }
        }
    });

    fncGetList = (currentPage)=>{
    $("#currentPage").val(currentPage);
    $(".rerport-search").attr("method", "post").submit();
    }
    

  })