require 'sinatra'


get "/" do
  @premise = params
  erb :index
end


post "/new_premise" do
  @premise = params["premise"]
  erb :index
end


