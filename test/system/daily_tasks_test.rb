require "application_system_test_case"

class DailyTasksTest < ApplicationSystemTestCase
  setup do
    @daily_task = daily_tasks(:one)
  end

  test "visiting the index" do
    visit daily_tasks_url
    assert_selector "h1", text: "Daily Tasks"
  end

  test "creating a Daily task" do
    visit daily_tasks_url
    click_on "New Daily Task"

    fill_in "Category", with: @daily_task.category
    check "Completed?" if @daily_task.completed
    fill_in "Task", with: @daily_task.task
    click_on "Create Daily task"

    assert_text "Daily task was successfully created"
    click_on "Back"
  end

  test "updating a Daily task" do
    visit daily_tasks_url
    click_on "Edit", match: :first

    fill_in "Category", with: @daily_task.category
    check "Completed?" if @daily_task.completed
    fill_in "Task", with: @daily_task.task
    click_on "Update Daily task"

    assert_text "Daily task was successfully updated"
    click_on "Back"
  end

  test "destroying a daily task" do
    visit daily_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily task was successfully destroyed"
  end
end
