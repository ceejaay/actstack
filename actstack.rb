require 'sinatra'
require './actstack_model.rb'


get "/" do
 @all_premise = Premise.all
  puts @all_premise.class
  erb :index
end


post "/new_premise" do
  @premise = Premise.create
  @premise.save
  #the new premise should go to the show premise page.
  #erb :show_premise
#right now it should show the new premise in the index 
  erb :index
end

#this should show an individual post
get "/premise/:id" do
  @premise = params[:id]
  erb :show 
end


get "/ideas" do
  markdown :README
end

