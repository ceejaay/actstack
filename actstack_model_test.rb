require File.expand_path '../test_helper.rb', __FILE__

class ActStackModelTest < MiniTest::Test
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def setup
    @premise = Premise.create(premise: "this is a premise", vote: 0)
    @act = @premise.acts.new(content: "this is an act", vote: 0)
  end

  def test_creates_new_premise
    current_database = Premise.all.length
    Premise.create premise: "this"
    assert_equal Premise.all.length, current_database + 1
  end

  def test_creates_new_act
    current_database = Act.all.length
    y = Premise.create premise: "this"
    y.acts.create content: "act"
    assert_equal Act.all.length, current_database + 1
  end

  def test_add_new_vote_to_premise
    database_vote_count = @premise.vote
    @premise.vote = @premise.vote.to_i + 1
    @premise.save
    assert_equal @premise.vote, database_vote_count + 1
  end

  def test_add_new_vote_to_act
    database_act_vote_count = @act.vote
    @act.vote = @act.vote + 1
    @act.save
    assert_equal @act.vote, database_act_vote_count + 1
  end

  def test_make_sure_premise_is_not_empty
    premise = Premise.new
    refute premise.save
  end

  def test_that_act_content_not_empty
    premise = Premise.create premise: "hello world"
    act = premise.acts.new
    refute act.save
  end

  def teardown
    Premise.all.destroy!
    Act.all.destroy!
  end

end
