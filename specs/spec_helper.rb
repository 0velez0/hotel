
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
require_relative '../lib/unavailable_error'
require_relative '../lib/date_helper'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
