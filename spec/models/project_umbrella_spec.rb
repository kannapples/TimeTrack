require 'rails_helper'

RSpec.describe ProjectUmbrella, type: :model do
  it "is valid with valid attributes" do
    expect(ProjectUmbrella.new(name: "test project umbrella")).to be_valid
  end

  it "is not valid without a title" do
	project_umbrella = ProjectUmbrella.new(name: nil)
	expect(project_umbrella).to_not be_valid
  end
end
