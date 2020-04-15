require 'rails_helper'

RSpec.describe "weekly_goals/new", type: :view do
  before(:each) do
    assign(:weekly_goal, WeeklyGoal.new())
  end

  it "renders new weekly_goal form" do
    render

    assert_select "form[action=?][method=?]", weekly_goals_path, "post" do
    end
  end
end
