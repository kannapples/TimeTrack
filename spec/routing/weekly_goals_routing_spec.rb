require "rails_helper"

RSpec.describe WeeklyGoalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/weekly_goals").to route_to("weekly_goals#index")
    end

    it "routes to #new" do
      expect(:get => "/weekly_goals/new").to route_to("weekly_goals#new")
    end

    it "routes to #show" do
      expect(:get => "/weekly_goals/1").to route_to("weekly_goals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/weekly_goals/1/edit").to route_to("weekly_goals#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/weekly_goals").to route_to("weekly_goals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/weekly_goals/1").to route_to("weekly_goals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/weekly_goals/1").to route_to("weekly_goals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/weekly_goals/1").to route_to("weekly_goals#destroy", :id => "1")
    end
  end
end
