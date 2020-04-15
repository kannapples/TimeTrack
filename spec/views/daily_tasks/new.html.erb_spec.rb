require 'rails_helper'

RSpec.describe "daily_tasks/new", type: :view do
  before(:each) do
    assign(:daily_task, DailyTask.new())
  end

  it "renders new daily_task form" do
    render

    assert_select "form[action=?][method=?]", daily_tasks_path, "post" do
    end
  end
end
