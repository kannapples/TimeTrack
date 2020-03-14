require 'test_helper'

class ProjectUmbrellasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_umbrella = project_umbrellas(:one)
  end

  test "should get index" do
    get project_umbrellas_url
    assert_response :success
  end

  test "should get new" do
    get new_project_umbrella_url
    assert_response :success
  end

  test "should create project_umbrella" do
    assert_difference('ProjectUmbrella.count') do
      post project_umbrellas_url, params: { project_umbrella: {  } }
    end

    assert_redirected_to project_umbrella_url(ProjectUmbrella.last)
  end

  test "should show project_umbrella" do
    get project_umbrella_url(@project_umbrella)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_umbrella_url(@project_umbrella)
    assert_response :success
  end

  test "should update project_umbrella" do
    patch project_umbrella_url(@project_umbrella), params: { project_umbrella: {  } }
    assert_redirected_to project_umbrella_url(@project_umbrella)
  end

  test "should destroy project_umbrella" do
    assert_difference('ProjectUmbrella.count', -1) do
      delete project_umbrella_url(@project_umbrella)
    end

    assert_redirected_to project_umbrellas_url
  end
end
