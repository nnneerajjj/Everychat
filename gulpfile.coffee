gulp = require 'gulp'
clean = require 'gulp-clean'

gulp.task 'clean', ->
  gulp.src 'vendor/assets'
    .pipe clean { force: true }

gulp.task 'package', ->
  # pure
  gulp.src 'bower_components/pure/pure.css'
    .pipe gulp.dest 'vendor/assets/stylesheets/'
