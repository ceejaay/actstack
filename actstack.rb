require 'sinatra'


get "/" do
 @premise = %w{ this is for testing get it out of here soon}
 # @premise = params
  erb :index
end


post "/new_premise" do
  @premise = params["premise"] 
  #the new premise should go to the show premise page.
  #erb :show_premise
#right now it should show the new premise in the index 
  erb :index
end


