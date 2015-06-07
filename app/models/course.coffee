Sequelize = require 'sequelize'

sequelize = require '../lib/db'
logger    = require '../lib/logger'


Course = sequelize.define 'Course',
  name: Sequelize.STRING
  description: Sequelize.TEXT


module.exports = Course
