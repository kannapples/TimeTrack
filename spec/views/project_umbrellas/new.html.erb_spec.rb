require 'rails_helper'

RSpec.describe "project_umbrellas/new", type: :view do
  before(:each) do
    assign(:project_umbrella, ProjectUmbrella.new())
  end

  it "renders new project_umbrella form" do
    render

    assert_select "form[action=?][method=?]", project_umbrellas_path, "post" do
    end
  end
end
