const { uploads } = require('../common/uploads');
const { auth } = require('../middleware/authentication/auth');
const { signUp, signIn, sendConfirmationCode, verifyConfirmationCode, updatePassword, updateUsername, updateEmail, updatePicture, getAllUsers } = require('../services/user.service')

const router = require('express').Router();
// GET = RETRIVE
// POST = ADD
// PUT = UPDATE
// DELETE = REMOVE

router.post('/signUp', signUp);
router.post('/signIn', signIn);
router.put('/sendConfirmationCode', sendConfirmationCode);
router.post('/verifyConfirmationCode', verifyConfirmationCode);
router.put('/updateUsername', auth, updateUsername);
router.put('/updateEmail', auth, updateEmail);
router.put('/updatePassword', updatePassword);
router.put('/updatePicture', auth, uploads('picture'), updatePicture);
router.get('/getAllUsers', auth, getAllUsers);


module.exports = router;


