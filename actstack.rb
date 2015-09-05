require 'sinatra'
require 'sinatra/flash'
require 'sinatra/reloader'
require 'dotenv'
Dotenv.load
require './actstack_model'
require 'json'
require 'net/http'
#require 'rack-flash'

enable :sessions
#use Rack::Flash

#get to index page
get "/" do
  @list = Premise.all
  @url = request.url
  erb :index
end

#show individual premise
get "/premise/:id" do
  @premise = Premise.get params[:id]
  erb :show
end

#new premise post request
post "/new_premise" do
#this code is a hot mess. See also new act post block
  uri = URI("https://www.google.com/recaptcha/api/siteverify")
  res = Net::HTTP.post_form(uri, {"secret" => ENV['SECRET_KEY'], "response" => params['g-recaptcha-response']})
  passed = JSON.parse(res.body)["success"]
#here we check for the passing captcha.
  if passed
    n = Premise.new
    n.premise = params[:premise]
    n.date_created = Time.now
    n.save
    
    if n.save
    redirect "/premise/#{n.id}"
    puts params
    else
      flash[:premise_error] = n.errors[:premise]
      redirect "/"
    end
  else
    flash[:captcha_error] = "the captcha failed. Try again"
    redirect "/"
  end
end

#new act
post "/premise/:id/acts" do
#the hotness of this mess is hot.
  uri = URI("https://www.google.com/recaptcha/api/siteverify")
  res = Net::HTTP.post_form(uri, {"secret" => ENV['SECRET_KEY'], "response" => params['g-recaptcha-response']})
  passed = JSON.parse(res.body)["success"]
    @premise = Premise.get(params[:id])
    act = @premise.acts.new(content: params[:content], act_number: params[:act_number])
  if passed
    act.date_created = Time.now
    act.save
    if act.save
      redirect "/premise/#{@premise.id}"
    else
      flash[:act_error] = act.errors[:content]
      redirect "/premise/#{@premise.id}"
    end
  else
    flash[:captcha_error] = "The captcha failed. Try again"
    redirect "/premise/#{@premise.id}"
  end
end

#new act post request
post "/premise/:id/acts" do
  @premise = Premise.get(params[:id])
  act = @premise.acts.new(content: params[:content], act_number: params[:act_number])
  act.date_created = Time.now
  act.save
  redirect "/premise/#{@premise.id}"
end

#upvote act
=begin
put "/premise/:id/act/:act_id/:vote" do
  @premise = Premise.get(params[:id])
  @act = @premise.acts.get(params[:act_id])
  @act.vote = @act.vote + params[:vote].to_i
  @act.save
  redirect back
end
=end

=begin
#upvote premise
put "/premise/:id/:vote" do
  @premise = Premise.get(params[:id])
  @premise.vote = @premise.vote.to_i + params[:vote].to_i
  @premise.save
  redirect back
end
=end

=begin
#new act request form

get "/premise/:id/acts/new" do
  @premise = Premise.get(params[:id])
  puts @premise.id
  erb :new_act
end
=end
