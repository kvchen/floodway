Sequelize = require 'sequelize'

sequelize = require '../lib/db'
logger    = require '../lib/logger'


Assignment = sequelize.define 'Assignment',
	questions: Sequelize.ARRAY Sequelize.TEXT
	type:
		type: Sequelize.ENUM
		values: ['homework', 'lab', 'quiz', 'project', 'exam', 'other']


module.exports = Assignment
