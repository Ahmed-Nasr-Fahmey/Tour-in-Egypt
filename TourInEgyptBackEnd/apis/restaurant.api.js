const { addRestaurants } = require('../services/restaurant.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE


router.post('/addRestaurants',  addRestaurants);

module.exports = router;