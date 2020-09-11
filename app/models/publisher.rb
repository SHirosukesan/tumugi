class Publisher < ApplicationRecord
	has_many :publisher_iamges, dependent: :destroy
	accepts_attachments_for :publisher_images, attachment: :publisher_image
	# accepts_nested_attributes_for :publisher_images
end