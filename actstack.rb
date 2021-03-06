require 'sinatra'
require 'sinatra/reloader'
require './actstack_model'
#upvote act
put "/premise/:id/act/:act_id/:vote" do
  @premise = Premise.get(params[:id])
  @act = @premise.acts.get(params[:act_id])
  @act.vote = @act.vote + params[:vote].to_i
  @act.save
  redirect back
end

#upvote premise
put "/premise/:id/:vote" do
  @premise = Premise.get(params[:id])
  @premise.vote = @premise.vote.to_i + params[:vote].to_i
  @premise.save
  redirect back
end

#new act
post "/premise/:id/acts" do
  @premise = Premise.get(params[:id])
  @params = params
  act = @premise.acts.new(content: params[:content], act_number: params[:act_number])
  act.date_created = Time.now
  act.save
  redirect "/premise/#{@premise.id}"
end


#get to index page
get "/" do
  params.inspect
  @list = Premise.all
  @url = request.url
  erb :index
end

#new premise post request
post "/new_premise" do
  n = Premise.new
  #need to add save at time and other data.
  n.premise = params[:premise]
  n.date_created = Time.now
  n.save
  redirect "/premise/#{n.id}"
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
  act.date_created = Time.now
  act.save
  redirect "/premise/#{@premise.id}"
end
