require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

# Require any classes
require_relative '../lib/admin'
require_relative '../lib/reservation'
require_relative '../lib/room'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
