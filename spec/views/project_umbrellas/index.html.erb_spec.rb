require 'rails_helper'

RSpec.describe "project_umbrellas/index", type: :view do
  before(:each) do
    assign(:project_umbrellas, [
      ProjectUmbrella.create!(),
      ProjectUmbrella.create!()
    ])
  end

  it "renders a list of project_umbrellas" do
    render
  end
end
