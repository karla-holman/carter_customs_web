class SmallGallery < ActiveRecord::Base
  has_attached_file :main_image, styles: {
    thumb: '150x125>',
    medium: '600x600>'
  }

  validates_presence_of :title
  validate :only_eight_enabled
  validate :image_dimensions

  validates_attachment :main_image,
    presence: true,
    content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
    size: { in: 0..2.megabytes }

  scope :enabled, ->{ where(enabled: true) }

  def only_eight_enabled
    errors.add(:enabled, I18n.t('small_galleries.errors.enabled')) if SmallGallery.where.not(id: self.id).enabled.count >= 8
  end

  def image_dimensions
    dimensions = Paperclip::Geometry.from_file(main_image.queued_for_write[:original].path)
    difference = dimensions.width - dimensions.height
    errors.add(:image, "must be square") unless -10 < difference && difference < 10
  end
end
