require "rails_helper"

RSpec.describe "Info Page", :type => :request do
  let!(:services) { Fabricate.times 3, :service }
  let!(:projects) { Fabricate.times 3, :project }

  describe 'Home Page' do
    it 'displays each enabled service with an image' do
      visit root_path
      Service.enabled.each do |service|
        expect(page).to have_content service.header
      end
    end

    it 'displays each enabled small gallery image' do
      visit root_path
      within('.instagram') do
        SmallGallery.enabled.each do |image|
          expect(page).to have_selector("#small-gallery-#{image.id}")
        end
      end
    end

    it 'displays each project title and the image' do
      visit root_path
      within('.projects') do
        Project.all.each do |project|
          expect(page).to have_content project.name
        end
      end
    end
  end
end
