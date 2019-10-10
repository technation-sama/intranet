require 'test_helper'

class RepairControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get repair_new_url
    assert_response :success
  end

end
