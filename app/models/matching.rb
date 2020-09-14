class Matching < ApplicationRecord
	has_many :notifications, dependent: :destroy
end
