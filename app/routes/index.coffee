express = require 'express'

viewRouter	= require './views'
authRouter	= require './auth'
apiRouter	  = require './api'


router = express.Router()


# Use other routers
router.use '/', viewRouter
router.use '/', authRouter
router.use '/api', apiRouter


module.exports = router