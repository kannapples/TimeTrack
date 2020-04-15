require 'rails_helper'

RSpec.describe "WeeklyGoals", type: :request do
  describe "GET /weekly_goals" do
    it "works! (now write some real specs)" do
      get weekly_goals_path
      expect(response).to have_http_status(200)
    end
  end
end
