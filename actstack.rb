require 'sinatra'
require './actstack_model'


get "/" do
  @list = Premise.all
  erb :index
end


post "/new_premise" do
#code to create premise
  n = Premise.new
  n.premise = params[:premise]
  n.save
  #for some reason, you can't tell it..
  #erb :index
  # You have to redirect.
  redirect "/"
# redirect "/#{n.id}"
end

#this should show an individual post
get "/premise/:id" do
  @premise = Premsie.get(params[:id])
  erb :show 
end

get "/:id" do
  @premise = Premise.get params[:id]
  erb :show
end


get "/ideas" do
  markdown :README
end

