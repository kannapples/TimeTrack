require "rails_helper"

RSpec.describe DailyTasksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/daily_tasks").to route_to("daily_tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/daily_tasks/new").to route_to("daily_tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/daily_tasks/1").to route_to("daily_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/daily_tasks/1/edit").to route_to("daily_tasks#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/daily_tasks").to route_to("daily_tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/daily_tasks/1").to route_to("daily_tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/daily_tasks/1").to route_to("daily_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/daily_tasks/1").to route_to("daily_tasks#destroy", :id => "1")
    end
  end
end
