$(document).ready(function(){

    $("#close-btn").on("click", ()=>{
        $(".ch-desk-messenger",parent.document).attr("class", "ch-messenger-hidden");
    })

    $("#back-btn").on("click" , ()=>{
        self.location = "/chat/chatlist";
    })
});