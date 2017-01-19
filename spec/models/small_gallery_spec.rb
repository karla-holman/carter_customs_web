require 'rails_helper'

RSpec.describe SmallGallery, type: :model do
  let!(:small_gallery) { Fabricate :small_gallery }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_attachment_presence(:main_image) }
  it { is_expected.to validate_attachment_content_type(:main_image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }

  describe '#only_eight_enabled' do
    context 'when there are already 7 enabled services' do
      let!(:small_galleries) { Fabricate.times 7, :small_gallery }
      let!(:new_small_gallery) { Fabricate.build :small_gallery }

      it 'does not allow the next service to be enabled' do
        new_small_gallery.save
        expect(new_small_gallery).to_not be_valid
        expect(new_small_gallery.errors[:enabled]).to include I18n.t('small_galleries.errors.enabled')
      end
    end
  end
end
