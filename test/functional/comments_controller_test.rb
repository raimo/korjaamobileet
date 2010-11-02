require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "should comment a joke" do
    joke = Joke.first
    assert_difference 'joke.comments.count' do
      post :create, :comment => { :body => 'testing' }, :joke_id => joke.id
    end
    assert_response :success
  end

  test "should not be able to comment a joke with empty body" do
    joke = Joke.first
    assert_no_difference 'joke.comments.count' do
      post :create, :comment => { :body => '' }, :joke_id => joke.id
    end
    assert_response 203
  end

  test "should not be able to comment a joke with 256 chars body" do
    joke = Joke.first
    assert_no_difference 'joke.comments.count' do
      post :create, :comment => { :body => 'x'*256 }, :joke_id => joke.id
    end
    assert_response 203
  end
end
