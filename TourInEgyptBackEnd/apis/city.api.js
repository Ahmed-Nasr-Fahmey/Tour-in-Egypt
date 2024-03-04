const { auth } = require('../middleware/authentication/auth');
const { addCities, getCities } = require('../services/city.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE

router.post('/addCities', addCities);
router.get('/getCities', auth, getCities);

module.exports = router;