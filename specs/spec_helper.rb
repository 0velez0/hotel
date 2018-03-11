
require 'simplecov'
SimpleCov.start do
  add_filter "/specs/"
end

# in terminal, type this:
# open coverage/index.html

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require 'date'

# Require any classes
require_relative '../lib/admin'
require_relative '../lib/reservation'
require_relative '../lib/room'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
