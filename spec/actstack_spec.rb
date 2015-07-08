ENV["RACK_ENV"] = 'test'
require './actstack'
require 'rspec'
require 'rack/test'

describe "Actstack" do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  describe "actstack/index" do
    it "should allow access to index" do
      get "/"
      expect(last_response).to be_ok
    end 

    it "should have a form for a new premise" do
      pending "not sure how to test for forms"
      this_should_not_get_executed
    end
  end
end

