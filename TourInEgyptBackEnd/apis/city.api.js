const { addCities } = require('../services/city.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE

router.post('/addCities', addCities);

module.exports = router;