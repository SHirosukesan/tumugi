class UsersPublisher < ApplicationRecord
	belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "Publisher"

    def self.already_sent_matched?(user_id, publisher_id)
      where(follower_id: user_id, followed_id: publisher_id).exists?
    end
end

