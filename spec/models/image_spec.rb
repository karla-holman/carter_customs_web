require 'rails_helper'

describe Image, type: :model do
  let!(:image) { Fabricate :image }

  it { is_expected.to belong_to(:project) }
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_attachment_presence(:image_attach) }
  it { is_expected.to validate_attachment_content_type(:image_attach).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }

end
