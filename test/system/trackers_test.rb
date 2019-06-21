require "application_system_test_case"

class TrackersTest < ApplicationSystemTestCase
  setup do
    @tracker = trackers(:one)
  end

  test "visiting the index" do
    visit trackers_url
    assert_selector "h1", text: "Trackers"
  end

  test "creating a Tracker" do
    visit trackers_url
    click_on "New Tracker"

    fill_in "Date", with: @tracker.date
    fill_in "End time", with: @tracker.end_time
    fill_in "Hours", with: @tracker.hours
    fill_in "Payment", with: @tracker.payment
    fill_in "Start time", with: @tracker.start_time
    fill_in "Subtask 1", with: @tracker.subtask_1
    fill_in "Subtask 2", with: @tracker.subtask_2
    fill_in "Task", with: @tracker.task
    click_on "Create Tracker"

    assert_text "Tracker was successfully created"
    click_on "Back"
  end

  test "updating a Tracker" do
    visit trackers_url
    click_on "Edit", match: :first

    fill_in "Date", with: @tracker.date
    fill_in "End time", with: @tracker.end_time
    fill_in "Hours", with: @tracker.hours
    fill_in "Payment", with: @tracker.payment
    fill_in "Start time", with: @tracker.start_time
    fill_in "Subtask 1", with: @tracker.subtask_1
    fill_in "Subtask 2", with: @tracker.subtask_2
    fill_in "Task", with: @tracker.task
    click_on "Update Tracker"

    assert_text "Tracker was successfully updated"
    click_on "Back"
  end

  test "destroying a Tracker" do
    visit trackers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tracker was successfully destroyed"
  end
end
