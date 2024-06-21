const mongoose = require('mongoose');

const restaurantSchema = mongoose.Schema({
    cityId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'cities', // Reference to the 'cities' model
    },
    name:String,
    description: String,
    location: String,
    address:String,
    longitude: String,
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

const restaurantModel = mongoose.model('restaurant', restaurantSchema);
module.exports.restaurantModel = restaurantModel;