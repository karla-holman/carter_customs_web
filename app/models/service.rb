class Service < ActiveRecord::Base
  has_attached_file :main_image, styles: {
    thumb: '225x125>',
    medium: '450x250>'
  }

  validates_presence_of :header, :body
  validate :only_three_enabled

  validates_attachment :main_image,
		presence: true,
		content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
		size: { in: 0..2.megabytes }

  scope :enabled, ->{ where(enabled: true) }

  def only_three_enabled
    errors.add(:enabled, I18n.t('services.errors.enabled')) if Service.where(enabled: true).count > 3
  end
end
