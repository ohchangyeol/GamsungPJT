const mongoose = require('mongoose');


const roomSchema = new mongoose.Schema({
    room : {type : String},
    members : [{type : String}]
})

const Room = mongoose.model('room', roomSchema);
module.exports = Room;