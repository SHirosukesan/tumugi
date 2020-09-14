class ChatsController < ApplicationController
  def index
  end
  def create
  	@chat = Chat.new(chat_params)
    @publisher = @chat.publisher
    if @chat.save
      # ここから
      @publisher.create_notification_chat!(current_user, @chat.id)
      # ここまで
      respond_to :js
      #リクエスト毎に処理を分けている？
    else
      render 'posts/show'
    end
end
