class Group < ApplicationRecord
	has_many :my_page, dependent: :destroy
end
