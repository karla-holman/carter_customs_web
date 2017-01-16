class Image < ActiveRecord::Base
	belongs_to :project

	has_attached_file :image_attach,
		styles: {
			thumb: '125x75>',
			medium: '1250x750>',
			large: '2500x1500>'
		}

	validates :name, presence: true

	validates_attachment :image_attach,
		presence: true,
		content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
		size: { in: 0..2.megabytes }
end
