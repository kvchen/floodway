bodyParser   = require 'body-parser'
cookieParser = require 'cookie-parser'
express      = require 'express'
jade         = require 'react-jade'
nconf        = require 'nconf'
passport     = require 'passport'
session      = require 'express-session'
url          = require 'url'

# Initialize settings before performing dependent imports
require './config'

error  = require './lib/error'
logger = require './lib/logger'
routes = require './routes'

# Initialize database
sequelize = require './lib/db'
models = require './models'

# Synchronize the database if we're not in a test environment
env = nconf.get('NODE_ENV')
if env is not 'test'
	logger.debug "Connecting to Postgres"
	sequelize.sync
	.then ->
		logger.debug "All tables are initialized"
	.error (err) ->
		logger.error err

# Instantiate the Express app with default settings
logger.debug "Starting webapp"
app = express()


app.set "port", process.env.PORT or nconf.get 'app:port'
app.disable "x-powered-by"


# Set view engine
app.set "views", __dirname + "/views"
app.set "view engine", "jade"

# Include static files
app.use express.static __dirname + "/public/build"


# Set up middleware
app.use cookieParser()
app.use session nconf.get 'app:session'


# Use passport authentication
logger.debug "Initializing passport authentication"
app.use passport.initialize()
app.use passport.session()


# Define routes
app.use '/', routes


# Handle errors
app.use error.logError


# Export app for other modules to use
module.exports = app


