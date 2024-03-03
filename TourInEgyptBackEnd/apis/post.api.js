const { uploads } = require('../common/uploads');
const { auth } = require('../middleware/authentication/auth');
const { createPost, getAllPosts } = require('../services/post.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE

router.get('/getAllPosts', auth, getAllPosts);

router.post('/createPost', auth, uploads('file'), createPost);

module.exports = router;