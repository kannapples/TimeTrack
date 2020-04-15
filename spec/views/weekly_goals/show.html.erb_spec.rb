require 'rails_helper'

RSpec.describe "weekly_goals/show", type: :view do
  before(:each) do
    @weekly_goal = assign(:weekly_goal, WeeklyGoal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
