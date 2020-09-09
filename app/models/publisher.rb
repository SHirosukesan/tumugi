class Publisher < ApplicationRecord
	accepts_nested_attributes_for :publisher_images
	has_many :publisher_iamges, dependent: :destroy
	accepts_attachments_for :publisher_images, attachment: :publisher_image
e