require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get download" do
    get pages_download_url
    assert_response :success
  end

end
