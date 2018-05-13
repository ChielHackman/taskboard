require 'rails_helper'

RSpec.describe ProjectsController do
  describe "GET index" do
    it "assigns @projects" do
      project = Project.new
      project.title = "Test_title"
      project.description = "Test_description"
      project.save
      get :index
      expect(assigns(:projects)).to eq([project])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
