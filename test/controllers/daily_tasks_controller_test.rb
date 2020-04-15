require 'test_helper'

class DailyTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_task = daily_tasks(:one)
  end

  test "should get index" do
    get daily_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_task_url
    assert_response :success
  end

  test "should create daily_task" do
    assert_difference('DailyTask.count') do
      post daily_tasks_url, params: { daily_task: { category: @daily_task.category, completed?: @daily_task.completed, task: @daily_task.task } }
    end

    assert_redirected_to daily_task_url(DailyTask.last)
  end

  test "should show daily_task" do
    get daily_task_url(@daily_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_task_url(@daily_task)
    assert_response :success
  end

  test "should update daily_task" do
    patch daily_task_url(@daily_task), params: { daily_task: { category: @daily_task.category, completed?: @daily_task.completed, task: @daily_task.task } }
    assert_redirected_to daily_task_url(@daily_task)
  end

  test "should destroy daily_task" do
    assert_difference('DailyTask.count', -1) do
      delete daily_task_url(@daily_task)
    end

    assert_redirected_to daily_tasks_url
  end
end
