const mongoose = require('mongoose');

const parkSchema = mongoose.Schema({
    cityId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'cities', // Reference to the 'cities' model
    },
    name:String,
    description: String,
    location: String,
    address:String,
    longtude: String,
    latitude: String,
    picture:String,
    rate: {
        type: Number,
        default: 0,
    },
    numberOfRatings: {
        type: Number,
        default: 0,
    },
    activeNow: {
        type: Boolean,
        default: false,
    },
});

const parkModel = mongoose.model('park', parkSchema);
module.exports.parkModel = parkModel;