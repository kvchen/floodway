fs    = require 'fs'
nconf = require 'nconf'

logger = require '../lib/logger'

app      = require './app'
database = require './database'
auth     = require './auth'

# Replace this with Redis in production
nconf.use 'memory'
nconf.argv()
nconf.env()

# Load external configuration files
nconf.set 'app', app
nconf.set 'database', database
nconf.set 'auth', auth

logger.info 'Loaded configuration settings'
