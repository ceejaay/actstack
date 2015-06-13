require 'sinatra'


get "/" do
  erb :index
end


post "/new_premise" do
  @premise = params["premise"]
  erb :index
end


