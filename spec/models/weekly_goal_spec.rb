require 'rails_helper'

RSpec.describe WeeklyGoal, type: :model do
 #  it "is valid with valid attributes" do
 #  	# new_project = Project.new()
 #    expect(WeeklyGoal.new(name: "test weekly goal", project_id: 1)).to be_valid
 #  end

 #  it "is not valid without a title" do
	# wg = WeeklyGoal.new(name: nil)
	# expect(wg).to_not be_valid
 #  end

  describe "Associations" do
    it { should belong_to(:project).without_validating_presence }
    it { should have_many(:daily_tasks) }
  end
 end
