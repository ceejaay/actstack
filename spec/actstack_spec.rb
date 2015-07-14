ENV["RACK_ENV"] = 'test'
require './actstack'
require 'rspec'
require 'rack/test'

describe "The pages" do
  #don't forget this when testing sinatra
  include Rack::Test::Methods
    def app
      Sinatra::Application
    end

  describe "home page" do
    it "should allow accessing the home page" do
      get "/"
      expect(last_response).to be_ok
      #last_response.should be_ok
      #expect(last_response.h1).to eq('Act Stack')
    end
  end

  describe "the ideas page" do
    it "should allow access to the idea page" do
      get "/ideas"
      expect(last_response).to be_ok
    end
  end

  describe "faq page" do
    it "shoul allow access to the faq page" do
      get "/faq"
      expect(last_response).to be_ok

    end

  end
end
