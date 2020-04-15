require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is valid with valid attributes" do
    expect(Project.new(name: "test project")).to be_valid
  end

  it "is not valid without a title" do
	project = Project.new(name: nil)
	expect(project).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:project_umbrella).without_validating_presence }
  end
end
