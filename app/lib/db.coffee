nconf     = require 'nconf'
Sequelize = require 'sequelize'

logger = require './logger'

config = nconf.get 'database'
if nconf.get('NODE_ENV') is "test"
	database = config.name.test
else
	database = config.name.prod

sequelize = new Sequelize database, config.username, config.password,
	dialect: 'postgres'

	host: config.host
	port: config.port
	timezone: config.timezone

module.exports = sequelize
