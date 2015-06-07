express  = require 'express'
nconf    = require 'nconf'
passport = require 'passport'

GoogleStrategy = require('passport-google-oauth2').Strategy

logger = require '../../lib/logger'
util   = require '../../lib/util'
auth   = require '../../lib/auth'

User   = require '../../models/user'

passport.use new GoogleStrategy nconf.get('oauth').strategy,
  (accessToken, refreshToken, profile, done) ->
    process.nextTick ->
      User.findOrCreate
        where:
          id: profile.id
        defaults:
          id: profile.id
          avatar: util.stripAvatarSize profile.photos[0].value
          email: profile.email
          language: profile.language
          firstName: profile.name.givenName
          lastName: profile.name.familyName

      .spread (user, created) ->
        if created
          logger.info '%s (%s) signed in as a new user',
            user.fullName, user.email
        else
          logger.info '%s (%s) signed in as a returning user',
            user.fullName, user.email

        return done null, user

      .error (err) ->
        return done err


# Set up the HTTP bearer token strategy
# passport.use new BearerStrategy (token, done) ->
#   User.findOne where:
#     token: token
#   , (err, user) ->
#     return done err if err
#     return done null, false if not user
#     return done null, user,
#       scope: 'all'


# Define user-specific authentication methods
passport.serializeUser (user, done) ->
  done null, user.id


passport.deserializeUser (id, done) ->
  User.findById id
  .then (user) ->
    done null, user
  .error (err) ->
    done err


oAuthRouter = express.Router()
oAuthRouter.get '/login', passport.authenticate 'google',
  nconf.get('oauth').auth

oAuthRouter.get '/login/callback', passport.authenticate 'google',
  successRedirect: '/'
  failureRedirect: '/'

oAuthRouter.get '/logout', (req, res) ->
  req.logout()
  res.redirect '/'

module.exports = oAuthRouter


