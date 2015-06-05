Sequelize = require 'sequelize'

sequelize = require '../lib/db'
logger    = require '../lib/logger'

User = sequelize.define 'User',
	id:
		type: Sequelize.STRING
		primaryKey: true
	avatar: Sequelize.STRING
		validate:
			isURL: true
	email: Sequelize.STRING
		validate:
			isEmail: true
	language: Sequelize.STRING

	firstName: Sequelize.STRING
	lastName: Sequelize.STRING
,
	getterMethods:
		fullName: ->
			return this.firstName + ' ' + this.lastName

module.exports = User
