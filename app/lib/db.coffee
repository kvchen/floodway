nconf     = require 'nconf'
Sequelize = require 'sequelize'

logger = require './logger'

config = nconf.get 'database'
testEnv = nconf.get('NODE_ENV') is 'test'


# Choose the correct database depending on the environment
database = if testEnv then config.name.test else config.name.prod

sequelize = new Sequelize database, config.username, config.password,
  dialect: 'postgres'

  host: config.host
  port: config.port
  timezone: config.timezone

  logging: logger.verbose

module.exports = sequelize
