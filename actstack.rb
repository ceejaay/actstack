require 'sinatra'
require 'sinatra/reloader'
require './actstack_model'

#upvote premise
put "/premise/:id/:vote" do
  @premise = Premise.get(params[:id])
  @premise.vote = @premise.vote.to_i + params[:vote].to_i
  @premise.save
  redirect "/"
end

#upvote act
put "/premise/:id/act/:act_id/:vote" do
  @premise = Premise.get(params[:id])
  @act = @premise.acts.get(params[:act_id])
  @act.vote = @act.vote + params[:vote].to_i
  @act.save
  redirect "/premise/#{@premise.id}"
end

#get to index page
get "/" do
  @list = Premise.all
  erb :index
end

#new premise post request
post "/new_premise" do
  n = Premise.new
  #need to add save at time and other data.
  n.premise = params[:premise]
  n.save
  redirect "/premise/#{n.id}"
end

#readme page
get "/ideas" do
  markdown :README
end

#show individual premise
get "/premise/:id" do
  @premise = Premise.get params[:id]
  erb :show
end

#new act request form
get "/premise/:id/acts/new" do
  @premise = Premise.get(params[:id])
  puts @premise.id
  erb :new_act
end

#new act post request
post "/premise/:id/acts" do
  @premise = Premise.get(params[:id])
  @params = params
  act = @premise.acts.new(content: params[:content], act_number: params[:act_number])
  act.save
  redirect "/premise/#{@premise.id}"
end
