$(document).ready(function(){
        
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

            }

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

  })