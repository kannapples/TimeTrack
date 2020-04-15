require 'rails_helper'

RSpec.describe "daily_tasks/edit", type: :view do
  before(:each) do
    @daily_task = assign(:daily_task, DailyTask.create!())
  end

  it "renders the edit daily_task form" do
    render

    assert_select "form[action=?][method=?]", daily_task_path(@daily_task), "post" do
    end
  end
end
