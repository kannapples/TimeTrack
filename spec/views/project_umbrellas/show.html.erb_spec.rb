require 'rails_helper'

RSpec.describe "project_umbrellas/show", type: :view do
  before(:each) do
    @project_umbrella = assign(:project_umbrella, ProjectUmbrella.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
