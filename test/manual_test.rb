#!/usr/bin/env ruby

require '../lib/cli-parser'
require 'json'

arguments, options = CliParser.parse(%w(-w), %w(-o -t))

puts 'Arguments: ' + JSON.pretty_generate(arguments)
puts 'Options: ' + JSON.pretty_generate(options)