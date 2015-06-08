sequelize = require '../app/lib/db'
logger    = require '../app/lib/logger'

# Pre and post-test hooks

before (done) ->
  logger.debug 'Running pre-test setup tasks'

  sequelize.sync
    force: true
  .then ->
    logger.debug 'Cleared all tables'
    done()
  .error (err) ->
    throw err

after (done) ->
  logger.debug 'Running post-test cleanup tasks'

  done()
