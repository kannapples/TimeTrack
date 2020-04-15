require "rails_helper"

RSpec.describe ProjectUmbrellasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/project_umbrellas").to route_to("project_umbrellas#index")
    end

    it "routes to #new" do
      expect(:get => "/project_umbrellas/new").to route_to("project_umbrellas#new")
    end

    it "routes to #show" do
      expect(:get => "/project_umbrellas/1").to route_to("project_umbrellas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_umbrellas/1/edit").to route_to("project_umbrellas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/project_umbrellas").to route_to("project_umbrellas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_umbrellas/1").to route_to("project_umbrellas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_umbrellas/1").to route_to("project_umbrellas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_umbrellas/1").to route_to("project_umbrellas#destroy", :id => "1")
    end
  end
end
