class UsersPublisher < ApplicationRecord
	belongs_to :publisher
    belongs_to :user

    def self.already_sent_matched?(user_id, publisher_id)
      where(follower_id: user_id, followed_id: publisher_id).exists?
    end
end

