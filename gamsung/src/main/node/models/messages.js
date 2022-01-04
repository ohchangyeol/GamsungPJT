const mongoose = require('mongoose');
const detailSchema = new mongoose.Schema({
    sender : { type : String, required:true },
    receiver : { type : String, required:true },
    message : String
    
})

const msgSchema = new mongoose.Schema({
    room : {type : String},
    content : detailSchema ,
    date : {type: Date , default: Date.now()}
    
})

const Msg = mongoose.model('msg', msgSchema);
module.exports = Msg;