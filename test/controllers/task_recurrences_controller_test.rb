require 'test_helper'

class TaskRecurrencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_recurrence = task_recurrences(:one)
  end

  test "should get index" do
    get task_recurrences_url
    assert_response :success
  end

  test "should get new" do
    get new_task_recurrence_url
    assert_response :success
  end

  test "should create task_recurrence" do
    assert_difference('TaskRecurrence.count') do
      post task_recurrences_url, params: { task_recurrence: { name: @task_recurrence.name } }
    end

    assert_redirected_to task_recurrence_url(TaskRecurrence.last)
  end

  test "should show task_recurrence" do
    get task_recurrence_url(@task_recurrence)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_recurrence_url(@task_recurrence)
    assert_response :success
  end

  test "should update task_recurrence" do
    patch task_recurrence_url(@task_recurrence), params: { task_recurrence: { name: @task_recurrence.name } }
    assert_redirected_to task_recurrence_url(@task_recurrence)
  end

  test "should destroy task_recurrence" do
    assert_difference('TaskRecurrence.count', -1) do
      delete task_recurrence_url(@task_recurrence)
    end

    assert_redirected_to task_recurrences_url
  end
end
