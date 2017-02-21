require "rails_helper"

RSpec.describe "Projects", :type => :request do
  let!(:projects) { Fabricate.times(3, :project) }

  describe 'Show Page' do
    it 'displays the project name' do
      visit project_path(projects.first)
      expect(page).to have_content(projects.first.name)
    end
  end
end
