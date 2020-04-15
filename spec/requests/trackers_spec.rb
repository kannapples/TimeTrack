require 'rails_helper'

RSpec.describe "Trackers", type: :request, js: true do
  describe "GET /trackers" do
    it "works! (now write some real specs)" do
      get trackers_path
      expect(response).to have_http_status(200)

    #   click_button("button#tracker_index_nav_btn")
  		# click_link(id: "tracker_index_nav_month_tracker_link")
    end
  end
end
