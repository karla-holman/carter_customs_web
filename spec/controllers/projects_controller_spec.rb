require "rails_helper"

RSpec.describe ProjectsController, :type => :controller do
  let!(:project) { Fabricate :project }
  let!(:base_params) { {} }

  describe "GET show" do
    it 'has a 200 status code' do
      get :show, base_params.merge(id: project.id)
      expect(response.status).to eq(200)
    end

    it 'assigns the project' do
      get :show, base_params.merge(id: project.id)
      expect(assigns(:project)).to eq project
    end
  end
end
