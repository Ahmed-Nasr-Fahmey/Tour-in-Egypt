const mongoose = require('mongoose');

const cafeSchema = mongoose.Schema({
    cityId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'cities', // Reference to the 'cities' model
    },
    description: String,
    location: String,
    longtude: String,
    latitude: String,
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

const cafeModel = mongoose.model('cafes', cafeSchema);
module.exports.cafeModel = cafeModel;