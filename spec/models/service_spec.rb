require 'rails_helper'

RSpec.describe Service, type: :model do
  let!(:service) { Fabricate :service }

  it { is_expected.to validate_presence_of :header }
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to validate_attachment_presence(:main_image) }
  it { is_expected.to validate_attachment_content_type(:main_image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }

  describe '#only_three_enabled' do
    context 'when there are already 2 enabled services' do
      let!(:services) { Fabricate.times 2, :service }
      let!(:new_service) { Fabricate.build :service }

      it 'does not allow the next service to be enabled' do
        new_service.save
        expect(new_service).to_not be_valid
        expect(new_service.errors[:enabled]).to include I18n.t('services.errors.enabled')
      end
    end
  end
end
