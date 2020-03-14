require "application_system_test_case"

class ProjectModulesTest < ApplicationSystemTestCase
  setup do
    @project_module = project_modules(:one)
  end

  test "visiting the index" do
    visit project_modules_url
    assert_selector "h1", text: "Project Modules"
  end

  test "creating a Project module" do
    visit project_modules_url
    click_on "New Project Module"

    click_on "Create Project module"

    assert_text "Project module was successfully created"
    click_on "Back"
  end

  test "updating a Project module" do
    visit project_modules_url
    click_on "Edit", match: :first

    click_on "Update Project module"

    assert_text "Project module was successfully updated"
    click_on "Back"
  end

  test "destroying a Project module" do
    visit project_modules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project module was successfully destroyed"
  end
end
