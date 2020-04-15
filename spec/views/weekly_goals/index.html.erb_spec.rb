require 'rails_helper'

RSpec.describe "weekly_goals/index", type: :view do
  before(:each) do
    assign(:weekly_goals, [
      WeeklyGoal.create!(),
      WeeklyGoal.create!()
    ])
  end

  it "renders a list of weekly_goals" do
    render
  end
end
