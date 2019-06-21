require 'test_helper'

class ScrumTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scrum_task = scrum_tasks(:one)
  end

  test "should get index" do
    get scrum_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_scrum_task_url
    assert_response :success
  end

  test "should create scrum_task" do
    assert_difference('ScrumTask.count') do
      post scrum_tasks_url, params: { scrum_task: { category: @scrum_task.category, completed?: @scrum_task.completed, periodicity: @scrum_task.periodicity, task: @scrum_task.task } }
    end

    assert_redirected_to scrum_task_url(ScrumTask.last)
  end

  test "should show scrum_task" do
    get scrum_task_url(@scrum_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_scrum_task_url(@scrum_task)
    assert_response :success
  end

  test "should update scrum_task" do
    patch scrum_task_url(@scrum_task), params: { scrum_task: { category: @scrum_task.category, completed?: @scrum_task.completed, periodicity: @scrum_task.periodicity, task: @scrum_task.task } }
    assert_redirected_to scrum_task_url(@scrum_task)
  end

  test "should destroy scrum_task" do
    assert_difference('ScrumTask.count', -1) do
      delete scrum_task_url(@scrum_task)
    end

    assert_redirected_to scrum_tasks_url
  end
end
