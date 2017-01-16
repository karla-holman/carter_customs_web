class Project < ActiveRecord::Base
	has_many :images
	has_attached_file :main_image,
		styles: {
			thumb: '125x75>',
			medium: '1250x750>',
			large: '2500x1500>'
		}

	validates :name, presence: true, uniqueness: true

	scope :current, -> { where("complete_date IS ?", nil) || where("complete_date > ?", Date.today) }
	scope :past, -> { where("complete_date <= ?", Date.today) }

	validates_attachment :main_image,
		presence: true,
		content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
		size: { in: 0..2.megabytes }

	def complete?
		complete_date.present?
	end

	def format_date
		complete_date.strftime('%m.%d.%Y')
	end
end
