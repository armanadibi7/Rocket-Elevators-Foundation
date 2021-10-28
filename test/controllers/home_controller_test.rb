require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get quotedraft" do
    get home_quotedraft_url
    assert_response :success
  end

end
