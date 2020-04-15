require 'rails_helper'

RSpec.describe "DailyTasks", type: :request do
  describe "GET /daily_tasks" do
    it "works! (now write some real specs)" do
      get daily_tasks_path
      expect(response).to have_http_status(200)
    end
  end
end
