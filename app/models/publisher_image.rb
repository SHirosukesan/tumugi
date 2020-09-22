class PublisherImage < ApplicationRecord
	belongs_to :publisher
    attachment :publisher_image
end
