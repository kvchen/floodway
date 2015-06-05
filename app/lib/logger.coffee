winston = require 'winston'

logger = new winston.Logger
	transports: [
		new winston.transports.Console
			level: 'debug'
			handleExceptions: true
			json: false
			colorize: true
		, new winston.transports.DailyRotateFile
			filename: './logs/outfile.log'
	]


module.exports = logger