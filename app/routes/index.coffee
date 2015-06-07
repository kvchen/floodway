express = require 'express'

viewRouter	= require './views'
oauthRouter	= require './oauth'
apiRouter	= require './api'


router = express.Router()


# Use other routers
router.use '/', viewRouter
router.use '/', oauthRouter
router.use '/api', apiRouter


module.exports = router