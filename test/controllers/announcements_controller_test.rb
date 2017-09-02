require 'test_helper'

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get announcements_index_url
    assert_response :success
  end

end
