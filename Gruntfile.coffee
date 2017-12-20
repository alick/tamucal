module.exports = (grunt) ->
  'use strict'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    iced:
      options:
        runtime: 'inline'
      debug:
        files: [
          expand: true
          cwd: 'src'
          src: ['*.iced']
          dest: 'build'
          ext: '.js'
        ]

    concat:
      options:
        banner:
          '''
// Copyright (c) <%= grunt.template.today('yyyy') %>, <%= pkg.author.name %>. (MIT Licensed)
// ==UserScript==
// @name          <%= pkg.name %>
// @namespace     https://github.com/alick
// @version       <%= pkg.version %>
// @description   <%= pkg.description %>
// @include       https://howdy.tamu.edu/render.UserLayoutRootNode.uP?uP_tparam=utf&utf=%2fcp%2fip%2flogin%3fsys%3dsctssb%26url%3dhttps://compass-ssb.tamu.edu/pls/PROD/BWXKTSCHD.p_textScheduleStudent
// @include       https://registrar.tamu.edu/Catalogs,-Policies-Procedures/Academic-Calendar
// @include       http://registrar.tamu.edu/Catalogs,-Policies-Procedures/Academic-Calendar
// ==/UserScript==

//#include
          '''
      dist: {
        src: ['lib/FileSaver.min.js', 'lib/jquery-1.8.2.min.js', 'lib/moment.min.gm.js', 'build/tamucal.js']
        dest: 'dist/tamucal.user.js'
      }

    watch:
      iced:
        files: ['src/*.iced']
        tasks: ['iced']

    clean:
      build: ['build/*']
      release: ['dist/*']

  grunt.registerMultiTask 'iced', 'Compile IcedCoffeeScript files into JavaScript', ->
    path = require('path')
    options = @options(
      bare: false
      separator: grunt.util.linefeed
    )
    grunt.fail.warn 'Experimental destination wildcards are no longer supported. please refer to README.'  if options.basePath or options.flatten
    grunt.verbose.writeflags options, 'Options'
    @files.forEach (f) ->
      output = f.src.filter((filepath) ->
        if grunt.file.exists(filepath)
          true
        else
          grunt.log.warn 'Source file \'' + filepath + '\' not found.'
          false
      ).map((filepath) ->
        compileCoffee filepath, options
      ).join(grunt.util.normalizelf(options.separator))
      if output.length < 1
        grunt.log.warn 'Destination not written because compiled files were empty.'
      else
        grunt.file.write f.dest, output
        grunt.log.writeln 'File ' + f.dest + ' created.'

  compileCoffee = (srcFile, options) ->
    options = grunt.util._.extend filename: srcFile, options
    srcCode = grunt.file.read srcFile
    try
      return require('iced-coffee-script').compile srcCode, options
    catch e
      grunt.log.error e
      grunt.fail.warn 'CoffeeScript failed to compile.'

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'debug', ['iced:debug']
  grunt.registerTask 'dev', ['debug', 'watch']
  grunt.registerTask 'release', ['debug', 'concat']
