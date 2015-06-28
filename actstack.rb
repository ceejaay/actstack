require 'sinatra'
require './actstack_model'

get "/" do
  @list = Premise.all
  erb :index
end

post "/new_premise" do
  n = Premise.new
  #need to add save at time and other data.
  n.premise = params[:premise]
  n.save
  redirect "/#{n.id}"
end

get "/ideas" do
  markdown :README
end

get "/:id" do
  @premise = Premise.get params[:id]
  erb :show
end


