Sequelize = require 'sequelize'

sequelize = require '../lib/db'
logger    = require '../lib/logger'


Assignment = sequelize.define 'Assignment',
  name: Sequelize.STRING
  description: Sequelize.TEXT

  questions: Sequelize.ARRAY Sequelize.INTEGER
  type:
    type: Sequelize.ENUM
    values: ['homework', 'lab', 'quiz', 'project', 'exam', 'other']
  
  assignedAt: Sequelize.DATE
  dueAt: Sequelize.DATE
,
  getterMethods:
    active: ->
      return Sequelize.NOW > this.assignedAt and Sequelize.NOW < this.dueAt

module.exports = Assignment
