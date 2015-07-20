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
    end

    it "should display the homepage" do
      get "/"
      expect(last_response.body).to include("Act Stack")
    end
  end

  describe "post /new_premise" do
    it "should do it's post thing" do
      #this is hacky. Need to figure a way to reset database
      post "/new_premise", {"premise" => "this is a premise", "id" => "#{Premise.all.length}"}
      follow_redirect!
      expect(last_request.path).to eq("/premise/#{Premise.all.length}")
    end
  end

  describe "get /premise/:id" do
    it "should show the individual premise" do
      #this is hacky, too.
      get "/premise/#{Premise.all.length}"
      expect(last_response).to be_ok
    end

  end

  describe "the ideas page" do
    it "should get the ideas page" do
      get "/ideas"
      expect(last_response).to be_ok
    end

  end

  describe "the acts creation" do
    it "will create an act when we send a POST request" do
      post "/1/acts", {"content" => "this is act"}
      follow_redirect!
      expect(last_request.path).to eq("/premise/1")

    end

  end

end
