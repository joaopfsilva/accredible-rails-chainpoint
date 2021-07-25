require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get submit" do
    get home_submit_url
    assert_response :success
  end

end
