require 'rails_helper'

RSpec.describe "trackers/new", type: :view do
  before(:each) do
    assign(:tracker, Tracker.new())
  end

  it "renders new tracker form" do
    render

    assert_select "form[action=?][method=?]", trackers_path, "post" do
    end
  end
end
