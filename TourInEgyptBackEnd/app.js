const express = require('express')
const app = express()
require('dotenv').config()
const port = process.env.PORT;
const mongoose = require('mongoose');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');


app.use(express.json());
app.use(express.static('uploads'));

// Connect to MongoDB
mongoose.connect(process.env.MONGODBCONNECTIONSTRING).then(() => {
    console.log("mongodb is connected");
}).catch((error) => {
    console.log("error", error);
});

app.use('/users',require('./apis/user.api'));
app.use('/reels',require('./apis/reel.api'));
app.use('/reelComments',require('./apis/reel.comment.api'));
app.use('/posts',require('./apis/post.api'));
app.use('/postComments',require('./apis/post.comment.api'));
app.use('/followers',require('./apis/follower.api'));
app.use('/following',require('./apis/following.api'));

// Start the server
let server = app.listen(port, () => {
    console.log(`Example app listening on port ${port}!`)
});

let io = require("socket.io")(server);


io.on("connection",async (client) => {
    console.log('new Client Connected');
});



app.get('/', (req, res) => res.send('Hello World!'))
