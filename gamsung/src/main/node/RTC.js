const express = require('express')();

//http 접속
/*const sever = require('http').Server(express);
const socketIO = require('socket.io')(sever);*/

//https 접속
const https = require('https');

const fs = require( 'fs' );

var ssl = {
  key: fs.readFileSync('./private.pem'),
  cert: fs.readFileSync('./public.pem'),
};

const server = https.createServer(ssl, express);
const socketIO = require('socket.io')(server);

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

server.listen(3000, handleListen);



