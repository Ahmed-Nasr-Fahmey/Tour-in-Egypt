const jwt = require('jsonwebtoken');

module.exports.auth = (request, response, next) => {
    let token = request.header('token');
    jwt.verify(token, process.env.TOKENSECRITKEY, (err, decoded) => {
        if (err) {
            response.json({message:err.message});
        }
        else{
            request._id = decoded._id
            next()
        }
    })
}