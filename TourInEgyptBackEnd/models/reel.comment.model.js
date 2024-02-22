const mongoose = require('mongoose');

const reelCommentSchema = mongoose.Schema({
    content:String,
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user', // Reference to the 'user' model
    },
    reelId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'reel', // Reference to the 'reel' model
    },
    likes: {
        type: Number,
        default: 0,
    }
});

const reelCommentModel = mongoose.model('reelComment', reelCommentSchema);
module.exports.reelCommentModel = reelCommentModel;