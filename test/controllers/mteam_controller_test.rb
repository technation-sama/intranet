require 'test_helper'

class MteamControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get mteam_home_url
    assert_response :success
  end

end
