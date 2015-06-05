fs    = require 'fs'
nconf = require 'nconf'

appConf      = require './app'
databaseConf = require './database'
oAuthConf    = require './oauth'

logger = require '../lib/logger'

nconf.use 'memory'
nconf.argv()
nconf.env()


# Load external configuration files
nconf.set 'app', appConf
nconf.set 'database', databaseConf
nconf.set 'oauth', oAuthConf


logger.info 'Loaded configuration settings'
