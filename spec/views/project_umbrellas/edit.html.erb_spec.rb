require 'rails_helper'

RSpec.describe "project_umbrellas/edit", type: :view do
  before(:each) do
    @project_umbrella = assign(:project_umbrella, ProjectUmbrella.create!())
  end

  it "renders the edit project_umbrella form" do
    render

    assert_select "form[action=?][method=?]", project_umbrella_path(@project_umbrella), "post" do
    end
  end
end
