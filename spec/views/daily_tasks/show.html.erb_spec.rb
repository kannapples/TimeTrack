require 'rails_helper'

RSpec.describe "daily_tasks/show", type: :view do
  before(:each) do
    @daily_task = assign(:daily_task, DailyTask.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
