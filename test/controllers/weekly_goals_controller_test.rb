require 'test_helper'

class WeeklyGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_goal = weekly_goals(:one)
  end

  test "should get index" do
    get weekly_goals_url
    assert_response :success
  end

  test "should get new" do
    get new_weekly_goal_url
    assert_response :success
  end

  test "should create weekly goal" do
    assert_difference('WeeklyGoal.count') do
      post weekly_goal_url, params: { weekly_goal: {  } }
    end

    assert_redirected_to weekly_goal_url(WeeklyGoal.last)
  end

  test "should show weekly goal" do
    get weekly_goal_url(@weekly_goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_weekly_goao_url(@weekly_goal)
    assert_response :success
  end

  test "should update weekly goal" do
    patch weekly_goal_url(@weekly_goal), params: { weekly_goal: {  } }
    assert_redirected_to weekly_goal_url(@weekly_goal)
  end

  test "should destroy weekly goal" do
    assert_difference('WeeklyGoal.count', -1) do
      delete weekly_goal_url(@weekly_goal)
    end

    assert_redirected_to weekly_goals_url
  end
end
