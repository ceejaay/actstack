# test.rb
require File.expand_path '../test_helper.rb', __FILE__

class MyTest < MiniTest::Test
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def setup
    @premise = Premise.create(premise: "this is a premise", vote: "0")
    @act = @premise.acts.new(content: "this is an act", vote: "0")
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

  def test_new_premise_saves_to_database
    length = Premise.all.length
    Premise.create premise: "thing"
    assert_equal Premise.all.length, length + 1
  end

  def test_new_act_post_request
    post "/premise/#{@premise.id}/acts"
    follow_redirect!
    assert last_response.ok?
  end

  def test_upvote_put_request
    put "/premise/#{@premise.id}/1"
    follow_redirect!
    assert last_response.ok?
  end

  def test_that_upvotes_on_premise_increase_votes
    put "/premise/#{@premise.id}/1"
    premise = Premise.get(@premise.id)
    assert_equal '1', premise.vote.to_s
  end

  def test_that_vote_is_set_to_zero
    premise = Premise.new
    assert_equal 0, premise.vote
  end

  def teardown
    Premise.all.destroy!
    Act.all.destroy!
  end
end
