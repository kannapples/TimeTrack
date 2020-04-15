require 'rails_helper'

RSpec.describe "daily_tasks/index", type: :view do
  before(:each) do
    assign(:daily_tasks, [
      DailyTask.create!(),
      DailyTask.create!()
    ])
  end

  it "renders a list of daily_tasks" do
    render
  end
end
