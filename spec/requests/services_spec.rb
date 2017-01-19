require "rails_helper"

RSpec.describe "Info Page", :type => :request do
  let!(:services) { Fabricate.times 3, :service }

  describe 'Home Page' do
    it 'displays each enabled service with an image' do
      visit root_path
      Service.enabled.each do |service|
        expect(page).to have_content service.header
      end
    end
  end
end
