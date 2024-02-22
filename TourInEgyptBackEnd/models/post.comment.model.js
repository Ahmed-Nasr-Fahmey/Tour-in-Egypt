const mongoose = require('mongoose');

const postCommentSchema = mongoose.Schema({
    content:String,
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user', // Reference to the 'user' model
    },
    postId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'post', // Reference to the 'post' model
    },
    likes: {
        type: Number,
        default: 0,
    }
});

const postCommentModel = mongoose.model('postComment', postCommentSchema);
module.exports.postCommentModel = postCommentModel;