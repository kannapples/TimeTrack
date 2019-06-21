require "application_system_test_case"

class ScrumTasksTest < ApplicationSystemTestCase
  setup do
    @scrum_task = scrum_tasks(:one)
  end

  test "visiting the index" do
    visit scrum_tasks_url
    assert_selector "h1", text: "Scrum Tasks"
  end

  test "creating a Scrum task" do
    visit scrum_tasks_url
    click_on "New Scrum Task"

    fill_in "Category", with: @scrum_task.category
    check "Completed?" if @scrum_task.completed
    fill_in "Periodicity", with: @scrum_task.periodicity
    fill_in "Task", with: @scrum_task.task
    click_on "Create Scrum task"

    assert_text "Scrum task was successfully created"
    click_on "Back"
  end

  test "updating a Scrum task" do
    visit scrum_tasks_url
    click_on "Edit", match: :first

    fill_in "Category", with: @scrum_task.category
    check "Completed?" if @scrum_task.completed
    fill_in "Periodicity", with: @scrum_task.periodicity
    fill_in "Task", with: @scrum_task.task
    click_on "Update Scrum task"

    assert_text "Scrum task was successfully updated"
    click_on "Back"
  end

  test "destroying a Scrum task" do
    visit scrum_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scrum task was successfully destroyed"
  end
end
