const mongoose = require('mongoose');

const citySchema = mongoose.Schema({
    cityName: String,
    region: String,
    famousPlaceName: String,
    famousPlacePath: String,
    confirmationCode: String,
});

const cityModel = mongoose.model('cities', citySchema);
module.exports.cityModel = cityModel;