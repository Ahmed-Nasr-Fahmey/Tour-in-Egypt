const { auth } = require('../middleware/authentication/auth');
const { addCafes, getCafes, getCafesByCityId } = require('../services/cafe.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE

router.post('/addCafes', addCafes);
router.get('/getCafes', auth, getCafes);
router.get('/getCafesByCityId/:cityId', getCafesByCityId)


module.exports = router;