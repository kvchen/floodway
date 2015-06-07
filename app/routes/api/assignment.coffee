express = require 'express'
Joi     = require 'joi'

Assignment = require '../../models/assignment'


assignmentRouter = express.Router()

assignmentRouter.get '/show/:id', (req, res, next) ->
  Assignment.findById req.params.id
  .then (assignment) ->
    res.json assignment.toJSON()
  .error (err) ->
    next err

# assignmentRouter.post '/create', (req, res, next) ->
#   Request.build
#     req.params.

assignmentRouter.post '/destroy/:id', (req, res, next) ->
  Request.findById req.params.id
  .then (assignment) ->
    assignment.destroy()
    .then ->
      next()
    .error (err) ->
      next err
  .error (err) ->
    next err

assignmentRouter.post '/update', (req, res, next) ->
  next()

module.exports = assignmentRouter
