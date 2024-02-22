const { uploads } = require('../common/uploads');
const { auth } = require('../middleware/authentication/auth');
const { signUp, signIn, sendConfirmationCode, verifyConfirmationCode, updatePassword, updateUsername, updateEmail, updatePicture } = require('../services/user.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE

router.post('/signUp', signUp);
router.post('/signIn', signIn);
router.put('/sendConfirmationCode', auth, sendConfirmationCode);
router.post('/verifyConfirmationCode', auth, verifyConfirmationCode);
router.put('/updateUsername', auth, updateUsername);
router.put('/updateEmail', auth, updateEmail);
router.put('/updatePassword', auth, updatePassword);
router.put('/updatePicture', auth, uploads('picture'), updatePicture);


module.exports = router;


