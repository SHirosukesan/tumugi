class Chat < ApplicationRecord
	has_many :notifications, dependent: :destroy

	def create_notification_by(current_user)
        notification = current_user.active_notifications.new(
          matching_id: id,
          visited_id: user_id,
          action: "message_match"
        )
        notification.save if notification.valid?
    end

    def create_notification_chat!(current_user, chat_id)
        # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
        temp_ids = Chat.select(:user_id).where(matching_id: id).where.not(user_id: current_user.id).distinct
        # --------------------------------------------------------.distinct後で調べる------------------
        temp_ids.each do |temp_id|
            save_notification_chat!(current_user, chat_id, temp_id['user_id'])
        end
        # まだ誰もコメントしていない場合は、投稿者に通知を送る
        save_notification_chat!(current_user, chat_id, user_id) if temp_ids.blank?
  end

    def save_notification_chat!(current_user, chat_id, visited_id)
        # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
        notification = current_user.active_notifications.new(
          matching: id,
          chat_id: chat_id,
          visited_id: visited_id,
          action: 'message_match'
        )
        # 自分の投稿に対するコメントの場合は、通知済みとする
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
     end

end
