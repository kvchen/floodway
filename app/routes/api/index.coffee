apiRouter = require('express').Router()

requestRouter = require './request'


apiRouter.use '/requests', requestRouter



module.exports = apiRouter
