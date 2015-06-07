logger = require './logger'

logError = (err, req, res, next) ->
  logger.error err
  next err


# app.use (err, req, res, next) ->
#   res.status 500
#   res.render 'error',
#     error: err

module.exports.logError = logError
