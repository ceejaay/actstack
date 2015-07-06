require 'sinatra'
require 'sinatra/reloader'
require './actstack_model'

put "/:id/:vote" do
  
  @premise = Premise.get(params[:id])
  @premise.vote = @premise.vote.to_i + params[:vote].to_i
  @premise.save
  redirect "/"
end

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

get "/:id/acts/new" do
  @premise = Premise.get(params[:id])
  puts @premise.id
  erb :new_act
end

post "/:id/acts" do
  @premise = Premise.get(params[:id])
  @params = params
  act = @premise.acts.new
  act.content = params[:content] 
  act.act_number = params[:act_number]
  act.save
  redirect "/#{@params[:id]}"
end

  
get "/test_page" do
  erb :test_page
end

