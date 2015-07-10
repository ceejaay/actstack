ENV["RACK_ENV"] = 'test'
require './actstack'
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/actstack.db")
  DataMapper.finalize
  Premise.auto_migrate!
end

describe "the models" do
  include Rack::Test::Methods
    def app
      Sinatra::Application
    end
  
    describe "new premise" do
      lambda do
        post "/new_premise", params = {
          :premise => "a long time ago in a galaxy far far away",
          :vote => 0
        }
      end.should {
        change(Premise, :count).by(1)
      }
    end
end
