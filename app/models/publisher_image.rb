class PublisherImage < ApplicationRecord
	attachment :publisher_image
	belongs_to :publisher
end
