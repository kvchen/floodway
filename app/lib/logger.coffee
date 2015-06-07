nconf   = require 'nconf'
winston = require 'winston'

logger = new winston.Logger
  transports: [
    new winston.transports.Console
      level: 'info'
      handleExceptions: true
      json: false
      colorize: true
      timestamp: true
    ,
    new winston.transports.DailyRotateFile
      level: 'debug'
      handleExceptions: true
      filename: 'outfile.log'
  ]

module.exports = logger
