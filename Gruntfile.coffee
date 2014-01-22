module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig
    coffee:
      dist:
        options:
          bare: yes
          join: yes
        src: [
          'src/Group.coffee'
          'src/*.coffee'
        ]
        dest: 'dist/barcodes.js'

  grunt.registerTask 'default', ['coffee']