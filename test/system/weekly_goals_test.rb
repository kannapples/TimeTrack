require "application_system_test_case"

class WeeklyGoalsTest < ApplicationSystemTestCase
  setup do
    @weekly_goal = weekly_goals(:one)
  end

  test "visiting the index" do
    visit weekly_goals_url
    assert_selector "h1", text: "Weekly Goals"
  end

  test "creating a Weekly Goal" do
    visit weekly_goals_url
    click_on "New Weekly Goal"

    click_on "Create Weekly Goal"

    assert_text "Weekly Goal was successfully created"
    click_on "Back"
  end

  test "updating a Weekly Goal" do
    visit weekly_goals_url
    click_on "Edit", match: :first

    click_on "Update Weekly Goal"

    assert_text "Weekly Goal was successfully updated"
    click_on "Back"
  end

  test "destroying a Weekly Goal" do
    visit weekly_goals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weekly Goal was successfully destroyed"
  end
end
