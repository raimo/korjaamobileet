require 'test_helper'

class HotLinkTest < ActiveSupport::TestCase

  test "should be able to click" do
    link = HotLink.new
    assert_difference 'link.clicked', 1 do
      link.click!
    end
  end
end
