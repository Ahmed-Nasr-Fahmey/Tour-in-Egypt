const { postModel } = require("../models/post.model");

module.exports.createPost = async (request, response) => {
    try {
        const userId = request._id;
        console.log(request.body)
        const {
            contentType,
            placeName,
            description,
            hashtags,
            location,
            longitude,
            latitude,
        } = request.body;

        const fileDetails = request.file;
        if (fileDetails) {
            // Create a new post instance
            const newPost = new postModel({
                userId,
                contentPath: fileDetails.filename,
                contentType,
                placeName,
                description,
                hashtags,
                location,
                longitude,
                latitude,
            });
            // Save the new post to the database
            await newPost.save();
        }else{
            // Create a new post instance
            const newPost = new postModel({
                userId,
                contentType,
                placeName,
                description,
                hashtags,
                location,
                longitude,
                latitude,
            });
            // Save the new post to the database
            await newPost.save();
        }

        // Send a success response
        response.status(201).json({ message: 'Post created successfully' });
    } catch (error) {
        // Handle errors
        console.error(error);
        response.status(500).json({ message: 'Internal Server Error' });
    }
}

module.exports.getAllPosts = async (req, res) => {
    try {
        // Use populate to get user details for each post
        const posts = await postModel.find().populate('userId', 'username email picture admin');

        // Send the response
        res.status(200).json({ posts, message: 'Successfully fetched all posts' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
}