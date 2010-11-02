require 'test_helper'

class MainControllerTest < ActionController::TestCase

  test "get the index page with layout" do
    get :index
    assert_response :success
    assert_template 'main/index'
    assert_select 'li[class=element today]', :count => 2
  end
end
