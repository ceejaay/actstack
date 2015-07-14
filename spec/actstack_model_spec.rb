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
  describe "premise" do
    describe "making a new model" do
      it "should have a new premise" do
        new_premise = Premise.new(premise: "hello world")
        expect(new_premise.premise).to eq("hello world")
      end
#this needs implementation
      it "the premise should not be nil" do
        premise = Premise.new
        expect(premise.premise).not_to eq(nil)

      end
    end
  end

  describe "acts" do
    describe "creating a new act" do
      it "should create a new act" do
        premise = Premise.new
        act = premise.acts.new(content: "this is an act")
        expect(act.content).to eq("this is an act")
      end

      it "should not be nil" do
        premise = Premise.new
        act = premise.acts.new
        expect(act.content).not_to eq(nil)
      end
    end
  end
end
