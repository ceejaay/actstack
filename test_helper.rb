# test_helper.rb
ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require "minitest/reporters"
Minitest::Reporters.use!
require File.expand_path '../actstack.rb', __FILE__
