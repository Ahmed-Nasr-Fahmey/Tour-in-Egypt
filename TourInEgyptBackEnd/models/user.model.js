const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    username: String,
    email: String,
    password: String,
    picture: String,
    confirmationCode: String,
    admin: {
        type: Boolean,
        default: false,
    },
});

const userModel = mongoose.model('user', userSchema);
module.exports.userModel = userModel;