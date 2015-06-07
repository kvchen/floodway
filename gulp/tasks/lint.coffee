gulp = require 'gulp'
coffeelint = require 'gulp-coffeelint'

config = require '../config'

gulp.task 'lint', ->
  gulp.src config.lint.src
    .pipe coffeelint()
    .pipe coffeelint.reporter()
