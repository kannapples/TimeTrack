require 'rails_helper'

RSpec.describe "weekly_goals/edit", type: :view do
  before(:each) do
    @weekly_goal = assign(:weekly_goal, WeeklyGoal.create!())
  end

  it "renders the edit weekly_goal form" do
    render

    assert_select "form[action=?][method=?]", weekly_goal_path(@weekly_goal), "post" do
    end
  end
end
