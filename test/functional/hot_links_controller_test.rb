require 'test_helper'

class HotLinksControllerTest < ActionController::TestCase

  test "should present index" do
    get :index
    assert_response :success
    assert_select 'li[class=element today]', :count => 3
  end
end
