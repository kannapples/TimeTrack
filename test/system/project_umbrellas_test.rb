require "application_system_test_case"

class ProjectUmbrellasTest < ApplicationSystemTestCase
  setup do
    @project_umbrella = project_umbrellas(:one)
  end

  test "visiting the index" do
    visit project_umbrellas_url
    assert_selector "h1", text: "Project Umbrellas"
  end

  test "creating a Project umbrella" do
    visit project_umbrellas_url
    click_on "New Project Umbrella"

    click_on "Create Project umbrella"

    assert_text "Project umbrella was successfully created"
    click_on "Back"
  end

  test "updating a Project umbrella" do
    visit project_umbrellas_url
    click_on "Edit", match: :first

    click_on "Update Project umbrella"

    assert_text "Project umbrella was successfully updated"
    click_on "Back"
  end

  test "destroying a Project umbrella" do
    visit project_umbrellas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project umbrella was successfully destroyed"
  end
end
