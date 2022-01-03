const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const mongoose = require('mongoose');

const Msg = require('./models/Messages');
const Rooms = require('./models/rooms');

require('dotenv').config({path:"variables.env"});



const chatting = io.of("/chatting");
const chatList = io.of("/chatlist");
chatList.on('connection', sockat=>{
  console.log("list...");

  sockat.on("getList",name=>{
    Rooms.find().where("members").in(name).then(datas=>{
      if(datas.length){
        datas.forEach(data=>{

          Msg.findOne({"room" : data.room }).sort({date : -1})
          .then(msgData =>{
            console.log(msgData.content.message);
            data._doc.lastMsg = msgData.content.message;
            // console.log("1");
          });
          
          setTimeout(() => {
            // console.log("2");
            let filtered =data.members.filter((el) => el !== name);
            data.members = filtered;
          }, 100);

        });
        
      }// end of if
      setTimeout(() => {
        // console.log("3");
        console.log(datas);
        sockat.emit("outList",datas);
      }, 100);
    })
  })

  
})

chatting.on('connection',socket=>{
  // console.log( chatting.sockets.manager.rooms)
  // console.log("chtting login!");
  let roomName="";

  // room join
  socket.on("joinRoom",room=>{
    roomName = room ;
    console.log("join Room => ",roomName);
    
    socket.join(roomName);

    const query ={"room" : roomName }; 
    Msg.find(query).then(result=>{
      //console.log("채팅 내용 찾기 =>",result);
      socket.emit("out_message", result);
    })

  });
  
  socket.on("req_message", msg=>{
    const message = new Msg(msg);
    
    message.save().then(()=>{
      //console.log(msg);
      chatting.to(roomName).emit("res_message",msg);
    });

  });

  // room out
  // socket.on("disconnect",async()=>{
  //   console.log("out room => " , roomName);
  //   socket.leave(roomName);
  //   roomName="";
  // });

  
});

io.on('connection',sockat=>{
  //console.log(io.sockets.adapter.rooms)

})


// server open
http.listen(82, (err)=>{
  if(err){
    console.log(err);
  }else{
    console.log('listening on *:82');
    mongoose.connect(process.env.MONGO_DB,{ useNewUrlParser: true},(err)=>{
      if(err){
        console.log(err);
      }else{
        console.log("mongoDB connected...");
      }
    });
  }
});