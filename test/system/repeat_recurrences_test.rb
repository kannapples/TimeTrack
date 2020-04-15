require "application_system_test_case"

class RepeatRecurrencesTest < ApplicationSystemTestCase
  setup do
    @repeat_recurrence = repeat_recurrences(:one)
  end

  test "visiting the index" do
    visit repeat_recurrences_url
    assert_selector "h1", text: "Repeat Recurrences"
  end

  test "creating a Repeat recurrence" do
    visit repeat_recurrences_url
    click_on "New Repeat Recurrence"

    fill_in "Name", with: @repeat_recurrence.name
    click_on "Create Repeat recurrence"

    assert_text "Repeat recurrence was successfully created"
    click_on "Back"
  end

  test "updating a Repeat recurrence" do
    visit repeat_recurrences_url
    click_on "Edit", match: :first

    fill_in "Name", with: @repeat_recurrence.name
    click_on "Update Repeat recurrence"

    assert_text "Repeat recurrence was successfully updated"
    click_on "Back"
  end

  test "destroying a Repeat recurrence" do
    visit repeat_recurrences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repeat recurrence was successfully destroyed"
  end
end
