express 	= require 'express'
Joi 		= require 'joi'

user = require '../../models/user'


apiRouter = express.Router()


apiRouter.post '/create', (req, res, next) ->
	next()


apiRouter.post '/update/:id', (req, res, next) ->
	next()


module.exports = apiRouter


