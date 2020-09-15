class ChatsController < ApplicationController
  def index
  end
  def create
	    @matching = Mating.find(params[:matching_id])
	    #投稿に紐づいたコメントを作成
	    @chat = @matching.chats.build(comment_params)
	    @chat.user_id = current_user.id
	    @chat_matcing = @chat.matching
     if @chat.save
        #通知の作成
        @chat_matching.create_notification_comment!(current_user, @comment.id)
        render :index
     end
end
