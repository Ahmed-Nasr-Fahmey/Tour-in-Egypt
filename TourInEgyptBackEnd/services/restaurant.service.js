const { restaurantModel } = require("../models/restaurant.model");

module.exports.addRestaurants = async (req, res) => {
    try {
        const newRestaurants = req.body; // Assuming the request body contains an array of new places

        // Insert the new places into the database
        const createdRestaurants = await restaurantModel.insertMany(newRestaurants);

        res.status(201).json({ message: 'Places added successfully', restaurants: createdRestaurants });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
}