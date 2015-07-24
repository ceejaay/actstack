#these tests are to check for the routes. Make sure all the requests work.
require File.expand_path '../test_helper.rb', __FILE__

class MyTest < MiniTest::Test
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def setup
    @premise = Premise.create(premise: "this is a premise", vote: "0")
    @act = @premise.acts.create(content: "this is an act", vote: "0")
  end


  def test_index_page
    get "/"
    assert last_response.ok?
  end

  def test_premise_page
    get "/premise/#{@premise.id}"
    assert last_response.ok?
  end

  def test_new_premise_post_request
    post "/new_premise", {'premise' => "this is a premise"}
    follow_redirect!
    assert last_response.ok?
  end

  def test_new_act_post_request
    post "/premise/#{@premise.id}/acts"
    follow_redirect!
    assert last_response.ok?
  end

  def test_upvote_put_request_on_premise
    put "/premise/#{@premise.id}/1"
    follow_redirect!
    assert last_response.ok?
  end

  def test_upvote_on_act
    put "/premise/#{@premise.id}/act/#{@act.id}/1"
    follow_redirect!
    assert last_response.ok?
  end

  def teardown
    Premise.all.destroy!
    Act.all.destroy!
  end
end
