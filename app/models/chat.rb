class Chat < ApplicationRecord
	has_many :notifications, dependent: :destroy
end
