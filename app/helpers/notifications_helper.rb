module NotificationsHelper
	def notification_form(notification)
      @visitor = notification.visitor
      @chat = nil
      your_matching = link_to 'あなたの投稿()matching', matchings_index_path(notification), style:"font-weight: bold;"
      @visitor_chat = notification.chat_id
      #notification.actionがfollowかlikeかcommentか
      case notification.action
        when "follow" then
          tag.a(notification.visitor.name, href:users_path(@visitor), style:"font-weight: bold;")+"があなたをフォローしました"
        when "message_match" then
          tag.a(notification.visitor.name, href:users_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:matchings_index_path(notification.matching_id), style:"font-weight: bold;")+"にいいねしました"
        when "chat" then
            @chat = Chat.find_by(id: @visitor_chat)&.content
            tag.a(@visitor.name, href:users_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:matchings_index_path(notification.matching_id), style:"font-weight: bold;")+"にコメントしました"
      end
    end
end



# @visitor.nameがあまりよくわからない
# あまり理解してないところが多い
