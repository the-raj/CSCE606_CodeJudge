require "application_system_test_case"

class ProblemsTest < ApplicationSystemTestCase
  setup do
    @problem = problems(:one)
  end

  test "visiting the index" do
    visit problems_url
    assert_selector "h1", text: "Problems"
  end

  test "should create problem" do
    visit problems_url
    click_on "New problem"

    click_on "Create Problem"

    assert_text "Problem was successfully created"
    click_on "Back"
  end

  test "should update Problem" do
    visit problem_url(@problem)
    click_on "Edit this problem", match: :first

    click_on "Update Problem"

    assert_text "Problem was successfully updated"
    click_on "Back"
  end

  test "should destroy Problem" do
    visit problem_url(@problem)
    click_on "Delete this problem", match: :first

    assert_text "Problem was successfully destroyed"
  end
end
