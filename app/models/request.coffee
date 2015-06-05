Sequelize = require 'sequelize'

sequelize = require '../lib/db'
logger    = require '../lib/logger'

Assignment = require './assignment'
User       = require './user'


Request = sequelize.define 'Requests',
	details: Sequelize.TEXT
	startedAt: Sequelize.DATE
	completedAt: Sequelize.DATE

	rating:
		type: Sequelize.ENUM
		values: ['good', 'bad']
	feedback: Sequelize.TEXT
	state: 
		type: Sequelize.ENUM
		values: ['pending', 'active', 'completed', 'cancelled']
		defaultValue: 'pending'


# Establish relationships
User.hasMany Request
Assignment.hasMany Request

module.exports = Request

