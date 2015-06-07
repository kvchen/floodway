# Middleware for handling routes that require authentication
ensureAuthenticated = (req, res, next) ->
  return next() if req.isAuthenticated()
  res.redirect '/'

module.exports.ensureAuthenticated = ensureAuthenticated
