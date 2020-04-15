require 'rails_helper'

RSpec.describe "trackers/edit", type: :view do
  before(:each) do
    @tracker = assign(:tracker, Tracker.create!())
  end

  it "renders the edit tracker form" do
    render

    assert_select "form[action=?][method=?]", tracker_path(@tracker), "post" do
    end
  end
end
