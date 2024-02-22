const mongoose = require('mongoose');

const postSchema = mongoose.Schema({
    contentPath: String,
    contentType: String,
    description: String,
    location: String,
    longtude: String,
    latitude: String,
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user', // Reference to the 'user' model
    },
    likes:  {
        type: Number,
        default: 0,
    },
    comments:  {
        type: Number,
        default: 0,
    },
    createdAt: {
        type: Date,
        default: () => Date.now() + 2 * 60 * 60 * 1000, // Current date + 2 hours
    },
});

const postModel = mongoose.model('post', postSchema);
module.exports.postModel = postModel;