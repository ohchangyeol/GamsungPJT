const app = require('express')();
const httpServer = require('http').Server(app);
const socketIO = require('socket.io')(httpServer);


socketIO.on("connection", (socket) => {
  socket.on("joinVideo", (productNo) => {
    socket.join(productNo);
    socket.to(productNo).emit("welcome");
  });
  socket.on("offer", (offer, productNo) => {
    socket.to(productNo).emit("offer", offer);
  });
  socket.on("answer", (answer, productNo) => {
    socket.to(productNo).emit("answer", answer);
  });
  socket.on("ice", (ice, productNo) => {
    socket.to(productNo).emit("ice", ice);
  });
  socket.on('left', function(productNo) {
     socket.to(productNo).emit("left");
  });
});


const handleListen = () => console.log(`[socket 3000 port start]`);
httpServer.listen(3000, handleListen);
