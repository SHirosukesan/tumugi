class Group < ApplicationRecord
	has_many :user, dependent: :destroy
end
