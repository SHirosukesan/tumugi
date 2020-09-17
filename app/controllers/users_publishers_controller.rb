class UsersPublishersController < ApplicationController
    def create
      publisher = Publisher.find(params[:publisher_id])
      user_publisher = current_user.users_publishers.new(publisher_id:publisher.id)
      user_publisher.save
      redirect_to publisher_path(publisher)
    end

    def destroy
    end

    def update
      user = User.find(params[:user_id])
      user_publisher = current_publisher.users_publishers.find_by(user_id:user.id)
      if user_publisher.follow_permission == false
        user_publisher.update(follow_permission:true)
      else
        user_publisher.update(follow_permission:false)
      end
      redirect_to user_path(user)
    end

end


#   def match
#     if params[:follower_permission]
#       current_user.match(params[:user_id],params[:publisher_id],params[:follower_permission])
#       # if UsersPublisher.exits?(follower_id: params[:publisher_id])
#       #   chatroom = ChatRooms.new
#       #   chatroom.user_id = params[:user_id]
#       #   chatroom.publisher_id = params[:publisher_id]
#       #   redirect_to
#       # end
#       redirect_to publisher_path(params[:publisher_id])
#     end
#   end

#    def unmatch
#       current_user.unmatch(params[:user_id], params[:publisher_id])
#      redirect_to publisher_path(params[:publisher_id])
#    end
# end
# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー↓publisher側ーーーーーーーーーーー
  # publisherがフォローするとき
#   def publisher_match
#     if params[:follower_permission]
#       current_publisher.match(params[:user_id],params[:publisher_id],params[:follower_permission])
#       redirect_to user_path(params[:user_id])
#     end

#     @ff = false #片思い
#     if Users_publishers.exists?(follower_id: params[:user_id], followed_id:params[:publisher_id])
#       @ff = true #相互フォロー状態
#       if (ChatRooms.exists(publisher_id: current_publisher, user_id: current_user.id))
#         # 既にチャットルームが存在しているならばそのチャットテーブルを取得
#         @chat = ChatRooms.find_by(publisher_id: current_publisher, user_id:current_user.id)
#       else
#         # 存在しなければチャットルームを新規作成
#         @chat = ChatRooms.new
#         @chat.publisher_id = params[:publisher_id]
#         @chat.user_id = params[:user_id]
#         @chat.save
#       end
#     end

#   end

#   def publisher_unmatch
#       current_publisher.unmatch(params[:user_id], params[:publisher_id])
#       redirect_to user_path(params[:user_id])
#   end
# end


  # コメ後々共通化したほうが良い
