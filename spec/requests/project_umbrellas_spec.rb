require 'rails_helper'

RSpec.describe "ProjectUmbrellas", type: :request do
  describe "GET /project_umbrellas" do
    it "works! (now write some real specs)" do
      get project_umbrellas_path
      expect(response).to have_http_status(200)
    end
  end
end
