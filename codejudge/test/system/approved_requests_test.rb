require "application_system_test_case"

class ApprovedRequestsTest < ApplicationSystemTestCase
  setup do
    @approved_request = approved_requests(:one)
  end

  test "visiting the index" do
    visit approved_requests_url
    assert_selector "h1", text: "Approved requests"
  end

  test "should create approved request" do
    visit approved_requests_url
    click_on "New approved request"

    click_on "Create Approved request"

    assert_text "Approved request was successfully created"
    click_on "Back"
  end

  test "should update Approved request" do
    visit approved_request_url(@approved_request)
    click_on "Edit this approved request", match: :first

    click_on "Update Approved request"

    assert_text "Approved request was successfully updated"
    click_on "Back"
  end

  test "should destroy Approved request" do
    visit approved_request_url(@approved_request)
    click_on "Destroy this approved request", match: :first

    assert_text "Approved request was successfully destroyed"
  end
end
