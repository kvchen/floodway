express = require 'express'
Joi     = require 'joi'

Request = require '../../models/request'


requestRouter = express.Router()

requestRouter.get '/show/:id', (req, res, next) ->
  Request.findById req.params.id
  .then (request) ->
    res.json request.toJSON()
  .error (err) ->
    next err

# requestRouter.post '/create', (req, res, next) ->
#   Request.build
#     req.params.

requestRouter.post '/destroy/:id', (req, res, next) ->
  Request.findById req.params.id
  .then (request) ->
    request.destroy()
    .then ->
      next()
    .error (err) ->
      next err
  .error (err) ->
    next err

requestRouter.post '/update', (req, res, next) ->
  next()

module.exports = requestRouter
