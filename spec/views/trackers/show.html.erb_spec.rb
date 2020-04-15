require 'rails_helper'

RSpec.describe "trackers/show", type: :view do
  before(:each) do
    @tracker = assign(:tracker, Tracker.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
