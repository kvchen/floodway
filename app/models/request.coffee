Sequelize = require 'sequelize'

sequelize = require '../lib/db'
logger    = require '../lib/logger'

Assignment = require './assignment'
User       = require './user'


Request = sequelize.define 'Requests',
  details: Sequelize.TEXT
  startedAt: Sequelize.DATE
  completedAt: Sequelize.DATE

  feedback: Sequelize.TEXT
  rating:
    type: Sequelize.INTEGER
    min: 1
    max: 5
  state:
    type: Sequelize.ENUM
    values: ['pending', 'active', 'completed', 'cancelled']
    defaultValue: 'pending'


# Establish relationships
User.hasMany Request
Assignment.hasMany Request

module.exports = Request

