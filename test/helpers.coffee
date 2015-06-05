sequelize = require '../app/lib/db'

# Helper methods
module.exports.clearDatabase = (done) ->
	sequelize.sync
		force: true
	.then done
	.error (err) ->
		throw err

module.exports.clearTable = (model, done) ->
	model.destroy()
		where: null
	.then ->
		done()
	.error (err) ->
		throw err
