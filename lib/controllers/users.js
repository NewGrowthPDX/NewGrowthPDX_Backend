const { Router } = require('express');
const User = require('../models/User');
const ensureAuth = require('../middleware/ensureAuth');

module.exports = Router()
  .get('/', ensureAuth, async (req, res, next) => {
    try {
      const user = await User.findUser();
      res.send(user);
    } catch (error) {
      next(error);
    }
  });
