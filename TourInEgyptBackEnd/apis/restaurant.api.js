const { auth } = require('../middleware/authentication/auth');
const { addRestaurants, getRestaurants } = require('../services/restaurant.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE

router.post('/addRestaurants',  addRestaurants);
router.get('/getRestaurants', auth, getRestaurants);

module.exports = router;