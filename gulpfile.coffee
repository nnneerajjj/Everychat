gulp = require 'gulp'
clean = require 'gulp-clean'

gulp.task 'clean', ->
  gulp.src 'vendor/assets'
    .pipe clean { force: true }

gulp.task 'package', ->
  # pure
  gulp.src 'node_modules/purecss/build/pure-min.css'
    .pipe gulp.dest 'vendor/assets/stylesheets/'
