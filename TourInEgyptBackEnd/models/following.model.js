const mongoose = require('mongoose');

const followingSchema = mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user', // Reference to the 'user' model
    },
    followingId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user', // Reference to the 'user' model
    },
});

const followingModel = mongoose.model('following', followingSchema);
module.exports.followingModel = followingModel;