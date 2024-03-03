const express = require('express')
const app = express()
require('dotenv').config()
const port = process.env.PORT;
const mongoose = require('mongoose');


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
app.use('/cities',require('./apis/city.api'));
app.use('/restaurants',require('./apis/restaurant.api'));
app.use('/cafes',require('./apis/cafe.api'));
app.use('/tourism',require('./apis/tourism.api'));
app.use('/beaches',require('./apis/beache.api'));
app.use('/shopping',require('./apis/shopping.api'));
app.use('/parks',require('./apis/park.api'));
app.use('/events',require('./apis/event.api'));
app.use('/emergency',require('./apis/emergency.api'));


// Start the server
let server = app.listen(port, () => {
    console.log(`Example app listening on port ${port}!`)
});


app.get('/', (req, res) => res.send('Welcome to our Tour in Egypt App!'));
