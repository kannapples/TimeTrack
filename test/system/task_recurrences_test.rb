require "application_system_test_case"

class TaskRecurrencesTest < ApplicationSystemTestCase
  setup do
    @task_recurrence = task_recurrences(:one)
  end

  test "visiting the index" do
    visit task_recurrences_url
    assert_selector "h1", text: "Task Recurrences"
  end

  test "creating a Task recurrence" do
    visit task_recurrences_url
    click_on "New Task Recurrence"

    fill_in "Name", with: @task_recurrence.name
    click_on "Create Task recurrence"

    assert_text "Task recurrence was successfully created"
    click_on "Back"
  end

  test "updating a Task recurrence" do
    visit task_recurrences_url
    click_on "Edit", match: :first

    fill_in "Name", with: @task_recurrence.name
    click_on "Update Task recurrence"

    assert_text "Task recurrence was successfully updated"
    click_on "Back"
  end

  test "destroying a Task recurrence" do
    visit task_recurrences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task recurrence was successfully destroyed"
  end
end
