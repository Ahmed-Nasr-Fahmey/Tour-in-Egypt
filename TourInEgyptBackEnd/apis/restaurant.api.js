const { auth } = require('../middleware/authentication/auth');
const { addRestaurants, getRestaurants, getRestaurantsByCityId } = require('../services/restaurant.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE

router.post('/addRestaurants',  addRestaurants);
router.get('/getRestaurants', auth, getRestaurants);
router.get('/getRestaurantsByCityId/:cityId', getRestaurantsByCityId)

module.exports = router;