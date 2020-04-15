require 'test_helper'

class RepeatRecurrencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repeat_recurrence = repeat_recurrences(:one)
  end

  test "should get index" do
    get repeat_recurrences_url
    assert_response :success
  end

  test "should get new" do
    get new_repeat_recurrence_url
    assert_response :success
  end

  test "should create repeat_recurrence" do
    assert_difference('RepeatRecurrence.count') do
      post repeat_recurrences_url, params: { repeat_recurrence: { name: @repeat_recurrence.name } }
    end

    assert_redirected_to repeat_recurrence_url(RepeatRecurrence.last)
  end

  test "should show repeat_recurrence" do
    get repeat_recurrence_url(@repeat_recurrence)
    assert_response :success
  end

  test "should get edit" do
    get edit_repeat_recurrence_url(@repeat_recurrence)
    assert_response :success
  end

  test "should update repeat_recurrence" do
    patch repeat_recurrence_url(@repeat_recurrence), params: { repeat_recurrence: { name: @repeat_recurrence.name } }
    assert_redirected_to repeat_recurrence_url(@repeat_recurrence)
  end

  test "should destroy repeat_recurrence" do
    assert_difference('RepeatRecurrence.count', -1) do
      delete repeat_recurrence_url(@repeat_recurrence)
    end

    assert_redirected_to repeat_recurrences_url
  end
end
