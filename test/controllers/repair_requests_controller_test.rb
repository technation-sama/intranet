require 'test_helper'

class RepairRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repair_request = repair_requests(:one)
  end

  test "should get index" do
    get repair_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_repair_request_url
    assert_response :success
  end

  test "should create repair_request" do
    assert_difference('RepairRequest.count') do
      post repair_requests_url, params: { repair_request: { area: @repair_request.area, category: @repair_request.category, description: @repair_request.description } }
    end

    assert_redirected_to repair_request_url(RepairRequest.last)
  end

  test "should show repair_request" do
    get repair_request_url(@repair_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_repair_request_url(@repair_request)
    assert_response :success
  end

  test "should update repair_request" do
    patch repair_request_url(@repair_request), params: { repair_request: { area: @repair_request.area, category: @repair_request.category, description: @repair_request.description } }
    assert_redirected_to repair_request_url(@repair_request)
  end

  test "should destroy repair_request" do
    assert_difference('RepairRequest.count', -1) do
      delete repair_request_url(@repair_request)
    end

    assert_redirected_to repair_requests_url
  end
end
