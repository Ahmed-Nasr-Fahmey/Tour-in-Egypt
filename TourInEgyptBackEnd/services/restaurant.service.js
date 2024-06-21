const { restaurantModel } = require("../models/restaurant.model");

module.exports.addRestaurants = async (req, res) => {
    try {
        const newRestaurants = req.body; // Assuming the request body contains an array of new places

        // Insert the new places into the database
        const createdRestaurants = await restaurantModel.insertMany(newRestaurants);

        res.status(201).json({ message: 'Restaurants added successfully', restaurants: createdRestaurants });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
}

module.exports.getRestaurants = async (req, res) => {
    try {
      const restaurants = await restaurantModel.find({}).populate('cityId', 'cityName');
      res.status(200).json({ message: 'Restaurants retrieved successfully', restaurants });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal Server Error' });
    }
}

module.exports.getRestaurantsByCityId = async (req, res) => {
  try {
    const { cityId } = req.params;
    const restaurants = await restaurantModel.find({ cityId }).populate('cityId', 'cityName');
    if (restaurants.length > 0) {
        res.status(200).json({ message: 'Restaurants retrieved successfully', restaurants });
    } else {
        res.status(404).json({ message: 'No restaurants found for this cityId' });
    }
  } catch (error) {
      res.status(500).json({ message: 'Server error', error });
  }
}