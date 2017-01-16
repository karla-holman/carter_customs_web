require 'rails_helper'

describe Project, type: :model do
  let!(:project) { Fabricate :project }

  it { is_expected.to have_many(:images) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  it { is_expected.to validate_attachment_presence(:main_image) }
  it { is_expected.to validate_attachment_content_type(:main_image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }

end
