require 'test_helper'

class ProjectModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_module = project_modules(:one)
  end

  test "should get index" do
    get project_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_project_module_url
    assert_response :success
  end

  test "should create project_module" do
    assert_difference('ProjectModule.count') do
      post project_modules_url, params: { project_module: {  } }
    end

    assert_redirected_to project_module_url(ProjectModule.last)
  end

  test "should show project_module" do
    get project_module_url(@project_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_module_url(@project_module)
    assert_response :success
  end

  test "should update project_module" do
    patch project_module_url(@project_module), params: { project_module: {  } }
    assert_redirected_to project_module_url(@project_module)
  end

  test "should destroy project_module" do
    assert_difference('ProjectModule.count', -1) do
      delete project_module_url(@project_module)
    end

    assert_redirected_to project_modules_url
  end
end
