const mongoose = require('mongoose');

const reelSchema = mongoose.Schema({
    contentPath: String,
    location: String,
    longtude: String,
    latitude: String,
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user', // Reference to the 'user' model
    },
    likes: {
        type: Number,
        default: 0,
    },
    comments: {
        type: Number,
        default: 0,
    },
});

const reelModel = mongoose.model('reel', reelSchema);
module.exports.reelModel = reelModel;