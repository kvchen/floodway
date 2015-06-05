logger = require '../app/lib/logger'

# Pre and post-test hooks


before (done) ->
	logger.debug "Running pre-test setup tasks"

	done()

after (done) ->
	logger.debug "Running post-test cleanup tasks"

	done()
