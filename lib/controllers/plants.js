const { Router } = require('express');
const Plant = require('../models/Plant');
// const jwt = require('jsonwebtoken');
const ensureAuth = require('../middleware/ensureAuth');

module.exports = Router().post('/', ensureAuth, async (req, res, next) => {
  try {
    const { plant_name, description, scientific_name, image, category_id } = req.body;
    const plant = await Plant.insert({
      plant_name,
      description,
      scientific_name,
      image,
      category_id,
    });

    res.send(plant);
  } catch (error) {
    next(error);
  }


});