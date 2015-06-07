express  = require 'express'
nconf    = require 'nconf'
passport = require 'passport'

GoogleStrategy = require('passport-google-oauth').OAuth2Strategy

logger = require '../../lib/logger'
util   = require '../../lib/util'
auth   = require '../../lib/auth'

User   = require '../../models/user'

config = nconf.get 'auth'

passport.use new GoogleStrategy config.strategy.google,
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


# Define user-specific authentication methods
passport.serializeUser (user, done) ->
  done null, user.id


passport.deserializeUser (id, done) ->
  User.findById id
  .then (user) ->
    done null, user
  .error (err) ->
    done err


authRouter = express.Router()
authRouter.get '/login', passport.authenticate 'google', config.auth

authRouter.get '/login/callback', passport.authenticate 'google',
  successRedirect: '/'
  failureRedirect: '/'

authRouter.get '/logout', (req, res) ->
  req.logout()
  res.redirect '/'

module.exports = authRouter


