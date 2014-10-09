module.exports = (grunt) ->
  "use strict"
  grunt.initConfig
    dir:
      src: "src"
      dest: "dist"

    pkg: grunt.file.readJSON("package.json")
    bower:
      install:
        options:
          targetDir: "./vendor/assets/bower_components"
          layout: "byComponent"
          install: true
          verbose: false
          cleanTargetDir: true
          cleanBowerDir: true

  grunt.loadNpmTasks "grunt-bower-task"
  grunt.registerTask "default", ["bower:install"]
  return
