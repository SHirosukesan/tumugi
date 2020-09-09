class PublisherImage < ApplicationRecord
	attachment :publisher_iamge
	belongs_to :publisher
end
