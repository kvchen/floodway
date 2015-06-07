gulp = require 'gulp'
coffeelint = require 'gulp-coffeelint'

gulp.task 'lint', ->
	gulp.src ['./app/**/*.coffee', '!./app/config/*']
		.pipe coffeelint()
		.pipe coffeelint.reporter()
