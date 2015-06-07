express = require 'express'
viewRouter = express.Router()


viewRouter.get '/', (req, res) ->
  res.render 'index',
    user: req.user


module.exports = viewRouter


