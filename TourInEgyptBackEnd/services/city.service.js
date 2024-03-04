const { cityModel } = require("../models/city.model");


// Endpoint to add cities
module.exports.addCities = async (req, res) => {
    try {
      const citiesToAdd = req.body.cities; // Assuming the request body has a property 'cities' which is an array of city objects
  
      // Insert the cities into the database
      const insertedCities = await cityModel.insertMany(citiesToAdd);
  
      res.status(201).json({ message: 'Cities added successfully', cities: insertedCities });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal Server Error' });
    }
  }

  module.exports.getCities = async (req, res) => {
    try {
      const cities = await cityModel.find({});
      res.status(200).json({ message: 'Cities retrieved successfully', cities });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal Server Error' });
    }
  }