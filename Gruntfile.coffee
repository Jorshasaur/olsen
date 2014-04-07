module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON 'package.json'

    shell:
      capture:
        command: () ->
          "coffee capture.coffee -c sites.json"
        options:
          stdout: true
          stderr: true
  }

  grunt.loadNpmTasks 'grunt-shell'
  grunt.registerTask "capture", ["shell:capture"]
