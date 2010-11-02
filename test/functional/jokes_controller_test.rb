require 'test_helper'

class JokesControllerTest < ActionController::TestCase
  setup do
    @joke = jokes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:best_jokes)
    assert_not_nil assigns(:new_jokes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not be able to set initial points for a joke" do
    assert_difference('Joke.count') do
      post :create, :joke => @joke.attributes.merge(:points => 1000)
    end

    assert_response :redirect
    assert_equal 0, Joke.last(:order => 'created_at, id').points
  end

  test "should not be able to mass_assign user_id for a joke" do
    assert_difference('Joke.count') do
      post :create, :joke => @joke.attributes.merge(:user_id => 1000)
    end

    assert_response :redirect
    assert_equal nil, Joke.last(:order => 'created_at, id').user_id
  end

  test "should create joke of length 300" do
    body = '-'*Joke::MAX_LENGTH
    assert_difference('Joke.count') do
      post :create, :joke => @joke.attributes.merge(:body => body)
    end

    assert_response :redirect
    assert_equal body, Joke.last(:order => 'created_at, id').body
  end

  test "should not create joke of length 301" do
    body = '-'*Joke::MAX_LENGTH+'-'
    assert_no_difference('Joke.count') do
      post :create, :joke => @joke.attributes.merge(:body => body)
    end
    assert_response :success
  end

  test "should not create joke with no body" do
    body = ''
    assert_no_difference('Joke.count') do
      post :create, :joke => @joke.attributes.merge(:body => body)
    end
    assert_response :success
  end

  test "should show joke" do
    get :show, :id => @joke.to_param
    assert_response :success
  end

end
