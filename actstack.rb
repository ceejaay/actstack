require 'sinatra'
require 'sinatra/reloader'
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
  redirect "/premise/#{n.id}"
end

get "/ideas" do
  markdown :README
end

get "/premise/:id" do
  @premise = Premise.get params[:id]
  erb :show
end

get "/premise/:id/acts/new" do
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
  redirect "/premise/#{@params[:id]}"
end


