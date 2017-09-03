require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get downloads" do
    get categories_downloads_url
    assert_response :success
  end

end
