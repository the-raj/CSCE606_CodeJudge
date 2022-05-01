require "application_system_test_case"

class AttemptsTest < ApplicationSystemTestCase
  setup do
    @attempt = attempts(:one)
  end

  test "visiting the index" do
    visit attempts_url
    assert_selector "h1", text: "Attempts"
  end

  test "should create attempt" do
    visit attempts_url
    click_on "New attempt"

    fill_in "Code", with: @attempt.code
    fill_in "Filename", with: @attempt.filename
    click_on "Create Attempt"

    assert_text "Attempt was successfully created"
    click_on "Back"
  end

  test "should update Attempt" do
    visit attempt_url(@attempt)
    click_on "Edit this attempt", match: :first

    fill_in "Code", with: @attempt.code
    fill_in "Filename", with: @attempt.filename
    click_on "Update Attempt"

    assert_text "Attempt was successfully updated"
    click_on "Back"
  end

  test "should destroy Attempt" do
    visit attempt_url(@attempt)
    click_on "Destroy this attempt", match: :first

    assert_text "Attempt was successfully destroyed"
  end
end
