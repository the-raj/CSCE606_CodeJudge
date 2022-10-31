require "test_helper"

class ApprovedRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @approved_request = approved_requests(:one)
  end

  test "should get index" do
    get approved_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_approved_request_url
    assert_response :success
  end

  test "should create approved_request" do
    assert_difference("ApprovedRequest.count") do
      post approved_requests_url, params: { approved_request: {  } }
    end

    assert_redirected_to approved_request_url(ApprovedRequest.last)
  end

  test "should show approved_request" do
    get approved_request_url(@approved_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_approved_request_url(@approved_request)
    assert_response :success
  end

  test "should update approved_request" do
    patch approved_request_url(@approved_request), params: { approved_request: {  } }
    assert_redirected_to approved_request_url(@approved_request)
  end

  test "should destroy approved_request" do
    assert_difference("ApprovedRequest.count", -1) do
      delete approved_request_url(@approved_request)
    end

    assert_redirected_to approved_requests_url
  end
end
