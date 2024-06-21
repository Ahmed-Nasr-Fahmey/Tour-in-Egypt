const { cafeModel } = require("../models/cafe.model");

module.exports.addCafes = async (req, res) => {
  try {
    const cafesData = req.body; // Assuming the request body contains an array of cafes
    const cafes = await cafeModel.insertMany(cafesData);

    res.status(201).json({ message: 'Cafes inserted successfully', cafes });
  } catch (error) {
    console.error('Error inserting cafes:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
}
  
module.exports.getCafes = async (req, res) => {
  try {
    const cafes = await cafeModel.find({}).populate('cityId', 'cityName');
    res.status(200).json({ message: 'Cafes retrieved successfully', cafes });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
}

module.exports.getCafesByCityId = async (req, res) => {
  try {
    const { cityId } = req.params;
    const cafes= await cafeModel.find({ cityId }).populate('cityId', 'cityName');
    if (cafes.length > 0) {
        res.status(200).json({ message: 'Cafes retrieved successfully', cafes });
    } else {
        res.status(404).json({ message: 'No Cafes found for this cityId' });
    }
  } catch (error) {
      res.status(500).json({ message: 'Server error', error });
  }
}