$(document).ready(function(){
    $(document).off();

    // event init        
    init();
});

function init() {
    $(document).on("click",".list-box", e=>{
        console.log($(this));

        const room = $(e.currentTarget).data('chatroom');
        const receiver = $(e.currentTarget).find(".receiver").text();
        console.log("room => ",room);
        console.log("receiver =>",receiver);
        self.location = "/chat/chatroom?room="+room+"&receiver="+receiver;
    });

    $("#close-btn").on("click", ()=>{
        $(".ch-desk-messenger",parent.document).attr("class", "ch-messenger-hidden");
    })

    $("#back-btn").on("click" , ()=>{
        self.location = "/chat/chatlist";

        //socket.emit('outRoom', room );
    })
};