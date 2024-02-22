const mongoose = require('mongoose');

const followerSchema = mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user', // Reference to the 'user' model
    },
    followerId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user', // Reference to the 'user' model
    },
});

const followerModel = mongoose.model('follower', followerSchema);
module.exports.followerModel = followerModel;